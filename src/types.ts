/** A file or directory shown in the explorer. */
export interface FileEntry {
  name: string;
  kind: 'file' | 'directory';
  /** File size in bytes; null for directories. */
  size: number | null;
  /** Lowercase extension without the dot; null for directories. */
  extension: string | null;
  /** URL including the deployment base path. */
  href: string;
}

export interface BreadcrumbItem {
  label: string;
  href: string;
}
