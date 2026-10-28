# Glossary

The terms used in this guide, collected
in one place.

**Apparent size** — a file's length:
the number of bytes it claims to hold,
regardless of how much disk it occupies.
What `dust -s` and `du --apparent-size`
report.

**Block** — the fixed-size chunk in
which a filesystem hands out space,
commonly 4 KiB. A file's disk usage is
always a whole number of blocks.

**Disk usage** — the space a file
actually occupies on the disk, counted
in blocks. dust's default measurement,
and `du`'s.

**Filesystem** — the system that
organises files on a storage device:
names, folders, inodes, blocks. One
machine usually runs several at once,
which is why `-x` can fence a scan to
one of them.

**Hard link** — a second (or third)
directory entry naming the same inode.
One file, several names; counted once
by `du` and by dust's default mode,
once per name by `dust -s`.

**Hidden file** — a file whose name
begins with a dot. Not hidden from
dust: counted by default, removed by
`-i`.

**Inode** — the filesystem's own record
for a file: its size, its blocks, its
link count, under a serial number.
Names in folders point at inodes; a
file's data lives behind one.

**Sparse file** — a file with long
stretches that were never written. The
unwritten stretches read back as zeros
and occupy no blocks, so length and
disk usage can differ by gigabytes.

**Symbolic link (symlink)** — a small
file whose contents are a path to
somewhere else. dust counts the link
itself and does not follow it unless
`-L` is given.

**Tree** — dust's drawing of a folder
and its contents: children above their
parent, biggest nearest the root line,
the root last (or, with `-r`, first).
