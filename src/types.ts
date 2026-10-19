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

/** One entry of students.json, keyed by the folder under content/. */
export interface StudentRecord {
  /** Access code used in the explorer URL. */
  slug: string;
  /** Full display name. */
  owner: string;
  /** Lowercase display slug used in the breadcrumb. */
  'owner-slug': string;
}

export type Students = Record<string, StudentRecord>;
