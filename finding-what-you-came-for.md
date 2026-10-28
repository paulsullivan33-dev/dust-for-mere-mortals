# Finding what you came for

The outcome of this chapter: faced with
"the disk is full" or "something in
here is enormous," you have a dust
command for each shape of the question —
biggest files, biggest folders, most
files, one kind of file, several places
at once. Transcript `t08` holds every
output below.

## Biggest files, folders aside

**`-F` — only files.** The tree
collapses to a flat ranking of files,
each under the scan's total:

```text
$ dust -F fixture
8.0Mi   ├── old.zip        │████… │  40%
5.0Mi   ├── holiday.raw    │████… │  25%
3.0Mi   ├── track-copy.flac│████… │  15%
```

This is the "find the whales" command.
Folders stop mattering; the largest
single tenants stand in a row. Add `-p`
when you need to know *which* `old.zip`.

## Biggest folders, files aside

**`-D` — only directories.** Every line
is a folder's total, the complement of
`-F`. It answers the tidy-up question —
*which subtree do I open first?* —
without files cluttering the ranking.

## How many, not how big

**`-f` — file count.** A folder's
"size" becomes the number of files
inside it:

```text
$ dust -f fixture/docs
3 ┌─┴ docs │████… │ 100%
```

Disk-full is a bytes problem, but
*slowness* is often a count problem —
a folder of two hundred thousand tiny
files backs up badly, syncs badly and
lists badly while weighing nothing.
`-f` finds those folders. (It is also
the quickest lie-detector for "I only
saved a few things in there.")

## One kind of file

**`-t` — by file type.** The tree is
replaced by a table of extensions:
the fixture reports `.zip` 8.0Mi,
`.raw` 5.0Mi, `.flac` 3.0Mi, and so on,
plus a `(no extension)` row for the
nameless. "What kind of thing is eating
the disk — photos, archives, logs?" is
a type question, and this answers it
in one run.

## Filters: keep this, drop that

Two regex switches shape *what counts*,
not just what is drawn:

- **`-e REGEX` — keep only matches.**
  `dust -e '\.jpg$' fixture` rebuilds
  the tree from JPEG files alone,
  parents resized to match (the fixture
  answers with a 1.1Mi `photos`).
- **`-v REGEX` — exclude matches.**
  The same pattern with `-v` shows
  everything *except* the JPEGs.
- **`-i` — ignore hidden files.**
  The dot-files leave the totals
  entirely, which on a real home folder
  can move the answer by gigabytes of
  caches — or hide exactly what you
  came to find. Know which run you are
  looking at.

Filtered totals are honest about a
*subset*, which makes them dangerous
in a report and perfect in a hunt:
state the filter when you quote the
number.

## Several places at once

dust takes any number of paths and
reports each under a combined `(total)`
line:

```text
$ dust fixture/docs fixture/music
 13Mi ┌─┴ (total) │████… │ 100%
```

Each root is drawn as its own tree with
its own root line first; the `(total)`
caps the set. Chapter 6's `--skip-total`
removes the cap when the sum would
mislead. The natural use is comparison:
the same folder on two disks, or last
month's backup folder beside this
month's — two trees, one scale, and
the difference drawn rather than
subtracted in your head.
