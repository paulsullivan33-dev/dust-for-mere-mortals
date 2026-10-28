# Hard links and symlinks

The outcome of this chapter: you know
the two ways one file can wear several
names, what dust counts in each case —
and the one mode where dust's total is
larger than the truth, why, and by how
much.

## Hard links: two names, one file

The fixture's `music/` holds
`track.flac` and `track-copy.flac`.
They are not a file and its copy. They
are two directory entries pointing at
one **inode** — one body of data with
two names, the filesystem's oldest
party trick. Deleting one name leaves
the other, and the data, untouched.

In the default disk-usage mode, dust
handles this the way `du` does: the
file is counted **once**, under
whichever name the walk met first, and
the other name does not appear at all
(transcript `t06`):

```text
$ dust fixture/music
3.0Mi   ┌── track-copy.flac │████… │ 100%
3.0Mi ┌─┴ music             │████… │ 100%
```

Disk space freed by "deleting the
duplicate": zero, because there is no
duplicate. The picture is honest, and
the silent omission is worth knowing
about — if a name you expect is missing
from a scan, a hard link wearing it
first is a prime suspect.

## The exception: -s counts it twice

Switch to apparent size and the rule
changes (transcript `t06` again):

```text
$ dust -s fixture/music
3.0Mi   ┌── track-copy.flac │████… │  50%
3.0Mi   ├── track.flac      │████… │  50%
6.0Mi ┌─┴ music             │████… │ 100%
```

Both names appear, both at full size,
and the folder's total doubles to
6.0Mi — while `du`, asked the same
question both ways, says 3145728 bytes
both times. This is not a rounding
wobble: it is dust's apparent-size mode
not deduplicating hard links, at least
in version 1.2.6, and it is the cause
of the 3,146,042-byte gap chapter 7
found between `dust -s` and `du` on the
whole fixture — 3,145,728 bytes of it
is exactly this file, counted twice.

Practical rule: **for totals, trust the
default mode; use `-s` for the files
themselves, and treat any `-s` total
over a tree with hard links — backup
stores, snapshot trees, anything built
by a tool that deduplicates — as an
overestimate by exactly the linked
data.** The lab cannot say whether
other versions behave the same; that
is why the version is named.

## Symlinks: a signpost, not a door

`photos/link-docs` is a **symbolic
link**: a small file whose contents are
a path, `../docs`. By default dust
counts the signpost — 7B apparent (the
length of the path it holds), 4.0Ki by
blocks — and does not walk through it.
The fixture's `docs` is counted once,
where it lives.

`-L` dereferences links: the signpost
becomes a door, and dust walks through
(transcript `t07`):

```text
$ dust -L fixture/photos
 10Mi   ├─┴ link-docs   │████… │  62%
 16Mi ┌─┴ photos        │████… │ 100%
```

`photos` swells from 6.1Mi to 16Mi
because it now contains a second visit
to all of `docs`. Nothing is miscounted
— you asked to follow the link — but
the same bytes now stand in two places,
and any total over a tree where links
point *inside* the tree inflates the
same way. Following links that point
*outside* a filesystem can go further
and loop; dust guards against revisits
within a single walk the same way it
guards hard links in block mode, but a
`-L` scan of unfamiliar territory (say,
someone else's home folder — chapter
1's rule) deserves a small test tree
first, not the whole disk.
