import fs from 'node:fs/promises';
import path from 'node:path';
import type { DownloadFile, FileEntry, StudentRecord, Students } from '@/types';
import { withBase } from '@/utils/base';
import { encodePath, joinPath } from '@/utils/paths';

const STUDENTS_PATH = 'students.json';
const PUBLIC_FILES_DIR = 'public/files';

const collator = new Intl.Collator('it', { numeric: true, sensitivity: 'base' });

interface DirectoryPageProps {
  entries: FileEntry[];
  /** Relative directory path, empty string for the code root. */
  dir: string;
  student: StudentRecord;
  /** Every file under this directory, for the client-side zip download. */
  downloadFiles: DownloadFile[];
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

async function listEntries(
  root: string,
  code: string,
  folder: string,
  relative: string,
): Promise<FileEntry[]> {
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
      href: withBase(`/files/${encodePath(folder)}/${encodePath(child)}`),
    });
  }

  result.sort((a, b) => {
    if (a.kind !== b.kind) return a.kind === 'directory' ? -1 : 1;
    return collator.compare(a.name, b.name);
  });

  return result;
}

async function collectDownloadFiles(
  root: string,
  folder: string,
  relativeDir: string,
): Promise<DownloadFile[]> {
  const baseDir = path.join(root, relativeDir);
  const files: DownloadFile[] = [];

  async function walk(currentDir: string, relative: string) {
    const entries = await fs.readdir(currentDir, { withFileTypes: true });

    for (const entry of entries) {
      if (entry.name.startsWith('.')) continue;

      const fullPath = path.join(currentDir, entry.name);
      const child = joinPath(relative, entry.name);

      if (entry.isDirectory()) {
        await walk(fullPath, child);
        continue;
      }

      if (!entry.isFile()) continue;

      const info = await fs.stat(fullPath);

      files.push({
        name: child,
        href: withBase(
          `/files/${encodePath(folder)}/${encodePath(joinPath(relativeDir, child))}`,
        ),
        size: info.size,
      });
    }
  }

  await walk(baseDir, '');
  files.sort((a, b) => collator.compare(a.name, b.name));

  return files;
}

/**
 * Build one static page per directory in every student's staged content.
 * `path: undefined` is the rest-parameter syntax for the code root page.
 */
export async function getDirectoryPages(): Promise<DirectoryPage[]> {
  let students: Students;

  try {
    students = JSON.parse(await fs.readFile(STUDENTS_PATH, 'utf8')) as Students;
  } catch {
    throw new Error(
      'Impossibile leggere students.json. Esegui `bun run content:build` prima della build.',
    );
  }

  const pages: DirectoryPage[] = [];

  for (const [folder, student] of Object.entries(students)) {
    const code = student.slug;
    const root = path.join(PUBLIC_FILES_DIR, folder);

    try {
      await fs.access(root);
    } catch {
      throw new Error(
        `La cartella pubblica per il codice ${code} (${folder}) non esiste. ` +
          'Esegui `bun run content:build` prima della build.',
      );
    }

    const directories = await walkDirectories(root);

    for (const dir of directories) {
      pages.push({
        params: { code, path: dir === '' ? undefined : dir },
        props: {
          entries: await listEntries(root, code, folder, dir),
          dir,
          student,
          downloadFiles: await collectDownloadFiles(root, folder, dir),
        },
      });
    }
  }

  return pages;
}
