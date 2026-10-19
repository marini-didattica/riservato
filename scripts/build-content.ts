import type { Dirent } from 'node:fs';
import { copyFile, mkdir, readFile, readdir, rm, stat } from 'node:fs/promises';
import path from 'node:path';

const root = process.cwd();
const contentDir = path.join(root, 'content');
const manifestPath = path.join(root, 'manifest.json');
const publicFilesDir = path.join(root, 'public', 'files');

/** Keep in sync with the code generator and the landing-page form. */
const CODE_PATTERN = /^[A-HJ-NP-Z2-9]{8}$/;

/**
 * Extensions that are safe to publish as-is.
 *
 * Source files (`.typ`, `.tex`), LaTeX build artifacts and anything that can
 * execute in the browser (`.html`, `.js`) are deliberately excluded.
 */
const ALLOWED_EXTENSIONS = new Set([
  '.pdf',
  '.txt',
  '.md',
  '.csv',
  '.json',
  '.png',
  '.jpg',
  '.jpeg',
  '.webp',
  '.gif',
  '.svg',
  '.zip',
  '.py',
  '.c',
  '.h',
  '.cpp',
  '.hpp',
  '.java',
  '.ipynb',
]);

const IGNORED_NAMES = new Set(['.DS_Store', 'Thumbs.db', '__pycache__']);

type Manifest = Record<string, string>;

function fail(message: string): never {
  throw new Error(`[content] ${message}`);
}

async function readManifest(): Promise<Manifest> {
  let raw: string;

  try {
    raw = await readFile(manifestPath, 'utf8');
  } catch {
    fail('manifest.json non trovato nella radice del progetto.');
  }

  let parsed: unknown;

  try {
    parsed = JSON.parse(raw);
  } catch (error) {
    fail(`manifest.json non è JSON valido: ${(error as Error).message}`);
  }

  if (typeof parsed !== 'object' || parsed === null || Array.isArray(parsed)) {
    fail('manifest.json deve contenere un oggetto { "CODICE": "cartella" }.');
  }

  return parsed as Manifest;
}

function assertFolderName(folder: string) {
  if (!folder || folder === '.' || folder === '..') {
    fail('Ogni voce del manifest deve indicare una cartella non vuota.');
  }

  if (folder.includes('/') || folder.includes('\\')) {
    fail(
      `La cartella "${folder}" deve essere un singolo segmento sotto content/. ` +
        'Usa una cartella per studente, non percorsi annidati.',
    );
  }

  if (folder.startsWith('.') || folder.startsWith('_')) {
    fail(`La cartella "${folder}" non può iniziare con "." o "_".`);
  }
}

async function validateManifest(manifest: Manifest) {
  const folders = new Set<string>();

  for (const [code, folder] of Object.entries(manifest)) {
    if (!CODE_PATTERN.test(code)) {
      fail(
        `Il codice "${code}" non è valido: servono 8 caratteri tra A-Z e 2-9, ` +
          'senza I, O, 0 e 1.',
      );
    }

    if (typeof folder !== 'string') {
      fail(`Il valore associato al codice "${code}" deve essere una stringa.`);
    }

    assertFolderName(folder);

    if (folders.has(folder)) {
      fail(`La cartella "${folder}" è associata a più di un codice.`);
    }

    folders.add(folder);

    const source = path.join(contentDir, folder);

    try {
      const info = await stat(source);

      if (!info.isDirectory()) {
        fail(`"${source}" non è una cartella.`);
      }
    } catch {
      fail(`La cartella "content/${folder}" indicata dal manifest non esiste.`);
    }
  }

  let entries: Dirent[];

  try {
    entries = await readdir(contentDir, { withFileTypes: true });
  } catch {
    fail('La cartella content/ non esiste.');
  }

  for (const entry of entries) {
    if (
      !entry.isDirectory() ||
      entry.name.startsWith('.') ||
      entry.name.startsWith('_') ||
      IGNORED_NAMES.has(entry.name)
    ) {
      continue;
    }

    if (!folders.has(entry.name)) {
      fail(
        `La cartella "content/${entry.name}" non è presente in manifest.json. ` +
          'Aggiungi un codice oppure sposta la cartella fuori da content/.',
      );
    }
  }
}

async function collectFiles(dir: string): Promise<string[]> {
  const entries = await readdir(dir, { withFileTypes: true });
  const files: string[] = [];

  for (const entry of entries) {
    if (entry.name.startsWith('.') || entry.name.startsWith('_') || IGNORED_NAMES.has(entry.name)) {
      continue;
    }

    const fullPath = path.join(dir, entry.name);

    if (entry.isDirectory()) {
      files.push(...(await collectFiles(fullPath)));
    } else if (entry.isFile()) {
      files.push(fullPath);
    }
  }

  return files;
}

async function buildContent() {
  const manifest = await readManifest();
  await validateManifest(manifest);

  await rm(publicFilesDir, { recursive: true, force: true });
  await mkdir(publicFilesDir, { recursive: true });

  let copied = 0;
  const skipped = new Set<string>();

  for (const [code, folder] of Object.entries(manifest)) {
    const sourceRoot = path.join(contentDir, folder);
    const destinationRoot = path.join(publicFilesDir, code);
    const files = await collectFiles(sourceRoot);

    await mkdir(destinationRoot, { recursive: true });

    for (const source of files) {
      const extension = path.extname(source).toLowerCase();

      if (!ALLOWED_EXTENSIONS.has(extension)) {
        skipped.add(extension || '(senza estensione)');
        continue;
      }

      const relative = path.relative(sourceRoot, source);
      const destination = path.join(destinationRoot, relative);

      await mkdir(path.dirname(destination), { recursive: true });
      await copyFile(source, destination);
      copied += 1;
    }

    console.log(`[content] ${code} -> content/${folder} (${files.length} file scansionati)`);
  }

  if (skipped.size > 0) {
    console.log(
      `[content] Estensioni ignorate: ${[...skipped].sort().join(', ')}. ` +
        'I sorgenti e i file non elencati non vengono pubblicati.',
    );
  }

  console.log(`[content] ${copied} file copiati in public/files/.`);
}

await buildContent();
