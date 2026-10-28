# The moving parts

The outcome of this chapter: when dust
prints a number you don't believe, you
can name the part of the machine that
produced it — the walk, the measuring,
or the drawing — and argue with the
right one.

## The walk

dust starts at the path you give it
(the current folder, if you give none)
and reads directory entries, folder by
folder. It uses several threads at once
(`-T` sets how many), which is why a big
tree answers faster than `du`'s single
file procession. It does not open your
files. Everything it learns comes from
the same metadata `ls -l` shows: names,
sizes, and one number most people never
meet — the **inode**, the filesystem's
own serial number for a file. Chapter 8
is about why that number matters.

Two defaults from the walk matter all
through the guide:

- **Symbolic links are not followed.**
  A link is counted once, as a link, and
  the tree does not descend into it.
  `-L` changes that, at a price chapter 8
  shows exactly.
- **Hidden files are counted.** Files
  whose names start with a dot are part
  of the total whether or not you asked
  about them; `-i` leaves them out.

## The measuring

Here is the part nobody warns you about:
a file has **two sizes**, and dust can
report either.

Its **length** — the number you see in
`ls -l` — is how many bytes the file
claims to hold. Its **disk usage** is
how much of the disk it actually
occupies, counted in whole **blocks**
(the filesystem's fixed-size chunks,
commonly 4 KiB). A 100-byte file has a
length of 100 and a disk usage of one
full block. A **sparse file** — one with
long runs of nothing written into it —
can have a length of gigabytes and a
disk usage of nearly zero.

By default dust measures **disk usage**,
the way `du` does: that is the number
that decides whether your disk is full.
`-s` switches it to **length** (called
*apparent size*), and chapter 7 puts the
two side by side on a file built to make
them disagree as loudly as possible.

One more measuring rule: a file with two
names — a **hard link** — is one file,
and in disk-usage mode dust counts it
once, whichever name it met first. In
apparent-size mode it does not, and the
difference is large enough to deserve
its own section of chapter 8.

## The drawing

Having measured everything, dust sorts
each folder's children by size, prunes
the tree to the lines it has room for
(`-n`, and by default your terminal's
height), and draws it upside down
relative to a file manager: the root at
the **bottom**, the biggest child
nearest the root, sizes shrinking as you
read up. Each line carries a bar. The
solid part of a child's bar is its share
of its parent; the fainter part behind
it reaches to the parent's own bar, so
your eye can compare a grandchild with
the whole disk without reading a single
number. Chapter 5 teaches that picture
properly; chapter 6 teaches how to
reshape it.

Nothing is stored. dust keeps no
database, no history, no cache; run it
twice and it walks twice. The map is
drawn fresh from the territory, every
time — which also means it can only
ever show you the territory as it was
during the walk.
