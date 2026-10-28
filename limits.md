# Limits

What dust cannot do, and the places its
numbers will mislead you if you let
them — the chapter the rest of the
guide has been promising.

## It never deletes, on purpose

dust is a window, not a broom. There is
no flag, key or mode that removes a
file, and chapter 12's ncdu exists for
the days you want one. Treat any
workflow of the shape *dust said it, so
I deleted it* as two decisions, not
one: dust's measurement, and your
judgement about what the file is. The
first is verified arithmetic. The
second is not dust's department, and a
big file is not automatically a useless
one — the biggest thing on many disks
is the backup.

## The -s total can overstate

Chapter 8's finding, promoted to the
limits chapter because it is the one
real trap the lab caught: in apparent
size mode (`-s`), hard-linked files are
counted once **per name**. On trees
where hard links are a technique —
backup stores, snapshot folders, any
deduplicating tool's output — a `-s`
total is an overestimate by exactly the
linked data (on the lab tree: 3,145,728
bytes of phantom weight in a 91 MB
total). The project's documentation
does not warn about this; now this
guide has. Disk-usage mode does not
have the fault.

## What the walk cannot see

- **Unreadable folders shrink the
  answer silently.** If dust cannot
  open a folder, its contents are
  simply absent from the totals; the
  `--print-errors` flag exists to make
  those failures visible, and a scan of
  a whole system disk should use it.
  (This guide's lab ran as the
  superuser, to whom nothing is
  unreadable, so the behaviour is
  documented here, not demonstrated —
  `criteria.md` says so too.)
- **A scan is a photograph of a moving
  crowd.** Files are being written and
  deleted while dust walks. On a busy
  system two runs of the same command
  legitimately differ, and a total is
  "the tree as the walk met it," never
  a simultaneous census.
- **Percentages flatter and bars
  round.** `0%` can be 100 MB of a
  40 TB array; `4.0Ki` can be 100 bytes
  of length. Quote bytes (chapter 6's
  `-o b`) when the quote will be acted
  on.
- **Metadata is all it knows.** dust
  cannot say what a file is for,
  whether anything still opens it, or
  whether two files with different
  names hold identical content. Size
  is a clue about importance, never a
  proof.

## Edges of the map

Following links with `-L` can take a
scan outside the tree you named —
deliberately — and across filesystems,
where "the disk is full" stops being a
single disk's story; `-x` exists to
fence a scan to one filesystem, and it
is documented-only in this guide. The
JSON output of version 1.2.6 arrived
somewhere its own help text did not
predict (chapter 10): small, but a
standing lesson that a tool's edges
are where its documentation and its
behaviour part company first, and the
only way to know is to have looked.

And the standing return of chapter 1's
rule: dust makes exploring a filesystem
fast and legible, which includes
filesystems that are not yours.
Colleagues' home folders on a shared
server, a customer's machine you were
given access to for one named job — the
map is not permission. **Your files,
your machines, or explicit permission**
is not a slogan around the tool; on a
scanning tool it is most of the ethics
there is, and it is the whole of this
section.
