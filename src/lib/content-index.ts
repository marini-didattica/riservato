import fs from 'node:fs/promises';
import path from 'node:path';
import type { FileEntry } from '@/types';
import { withBase } from '@/utils/base';
import { encodePath, joinPath } from '@/utils/paths';

const MANIFEST_PATH = 'manifest.json';
const PUBLIC_FILES_DIR = 'public/files';

interface DirectoryPageProps {
  entries: FileEntry[];
  /** Relative directory path, empty string for the code root. */
  dir: string;
}

interface DirectoryPage {
  params: { code: string; path?: string };
  props: DirectoryPageProps;
}

async function walkDirectories(root: string, relative = ''): Promise<string[]> {
  const directories = [relative];
  const entries = await fs.readdir(path.join(root, relative), { withFileTypes: true });

  for (const entry of entries) {
    if (!entry.isDirectory() || entry.name.startsWith('.')) continue;

    const child = joinPath(relative, entry.name);
    directories.push(...(await walkDirectories(root, child)));
  }

  return directories;
}

async function listEntries(root: string, code: string, relative: string): Promise<FileEntry[]> {
  const entries = await fs.readdir(path.join(root, relative), { withFileTypes: true });
  const result: FileEntry[] = [];

  for (const entry of entries) {
    if (entry.name.startsWith('.')) continue;

    const child = joinPath(relative, entry.name);

    if (entry.isDirectory()) {
      result.push({
        name: entry.name,
        kind: 'directory',
        size: null,
        extension: null,
        href: withBase(`/${code}/${encodePath(child)}/`),
      });
      continue;
    }

    if (!entry.isFile()) continue;

    const info = await fs.stat(path.join(root, child));
    const extension = path.extname(entry.name).slice(1).toLowerCase();

    result.push({
      name: entry.name,
      kind: 'file',
      size: info.size,
      extension: extension || null,
      href: withBase(`/files/${code}/${encodePath(child)}`),
    });
  }

  const collator = new Intl.Collator('it', { numeric: true, sensitivity: 'base' });

  result.sort((a, b) => {
    if (a.kind !== b.kind) return a.kind === 'directory' ? -1 : 1;
    return collator.compare(a.name, b.name);
  });

  return result;
}

/**
 * Build one static page per directory in every student's staged content.
 * `path: undefined` is the rest-parameter syntax for the code root page.
 */
export async function getDirectoryPages(): Promise<DirectoryPage[]> {
  let manifest: Record<string, string>;

  try {
    manifest = JSON.parse(await fs.readFile(MANIFEST_PATH, 'utf8')) as Record<string, string>;
  } catch {
    throw new Error(
      'Impossibile leggere manifest.json. Esegui `bun run content:build` prima della build.',
    );
  }

  const pages: DirectoryPage[] = [];

  for (const code of Object.keys(manifest)) {
    const root = path.join(PUBLIC_FILES_DIR, code);

    try {
      await fs.access(root);
    } catch {
      throw new Error(
        `La cartella pubblica per il codice ${code} non esiste. ` +
          'Esegui `bun run content:build` prima della build.',
      );
    }

    const directories = await walkDirectories(root);

    for (const dir of directories) {
      pages.push({
        params: { code, path: dir === '' ? undefined : dir },
        props: {
          entries: await listEntries(root, code, dir),
          dir,
        },
      });
    }
  }

  return pages;
}
