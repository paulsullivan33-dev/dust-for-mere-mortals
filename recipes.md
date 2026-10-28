# Recipes

The outcome of this chapter: a worked
routine for each of the four errands
dust is actually hired for, using only
flags the earlier chapters verified.
Every errand assumes chapter 1's rule:
your machine, your files, or permission.

## "The disk is full"

Start wide and shallow, then follow
the weight:

```text
$ dust -d 1 /
$ dust /the/folder/it/accused
$ dust -F /the/folder/it/accused
```

The depth-1 scan of the root names the
guilty top folder in one screen. Scan
that folder fully and read the chain
from the bottom up — root, biggest
child, biggest grandchild — because a
disk-full story is almost always one
branch. Finish with `-F` on the guilty
folder to see the whale files
themselves, and `-p` if you need their
full addresses for whatever you do next.
dust will not delete them for you; that
part is yours, with your file manager,
your package manager, or `rm` and your
full attention.

## "My home folder is enormous"

```text
$ dust ~
$ dust -i ~
```

Run it twice. The first total includes
hidden folders — where applications
keep their caches — and on many machines
the gap between the two runs *is* the
answer. Then scan the accused cache
folder on its own before removing
anything, and prefer the owning
application's own "clear cache" button
when it has one: dust shows you where
the weight is, not which of it the
application still needs.

## "Which of these folders is the copy?"

Two photo libraries, an old backup and
a new one, a project and its clone:

```text
$ dust -d 2 ~/library-a ~/library-b
```

Several roots come back on one scale
under one `(total)`, drawn to be
compared (chapter 9). Equal totals at
depth 2 with different insides are a
finding, not a contradiction: one may
be hard links — chapter 8 — or sparse
files wearing their length — chapter 7.
The recipes for both suspicions are
`dust -s` on each, and `du` beside it.

## "What changed since last month?"

dust remembers nothing (chapter 2), so
the memory is yours to keep:

```text
$ dust -P -c -o b ~/data > usage-2026-10.txt
$ dust -j -o b ~/data > usage-2026-10.json
```

A dated text tree diffs beautifully
against next month's (`diff` will point
at the folder that grew). The JSON
form, chapter 10, is the one to feed a
graph. Either way the habit is the
recipe: same command, same folder, same
flags, once a month — a trend line
beats a surprise.
