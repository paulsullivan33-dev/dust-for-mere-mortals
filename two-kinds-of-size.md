# Two kinds of size

The outcome of this chapter: when dust
and another tool disagree about a file,
you can say *which* size each one is
reporting, and you have watched the two
sizes disagree by 64 MiB on a single
file and agree to the byte on a whole
tree.

Chapter 2 named the pair. A file's
**length** is how many bytes it claims
to hold. Its **disk usage** is how many
whole blocks the filesystem has given
it. dust reports disk usage by default;
`-s` reports length, under the name
*apparent size*.

## The loud disagreement

The fixture's `vm/disk.img` was made
with `truncate`: length 67108864 bytes,
contents never written. Disk space
spent on its contents: none. Transcript
`t05-apparent-size.txt`:

```text
$ dust fixture/vm
0B   ┌── disk.img │█      │   0%
0B ┌─┴ vm         │█      │   0%
$ dust -s fixture/vm
64Mi   ┌── disk.img │████…  │ 100%
64Mi ┌─┴ vm         │████…  │ 100%
```

Same file, same tool, two truths. The
default answer — 0B — is the one that
matters for a full disk: deleting this
file frees nothing. The `-s` answer —
64Mi — is the one that matters if you
are about to copy the file somewhere:
the copy will be 64 MiB of real bytes
at the far end (mostly zeros, but real).
Sparse files are how virtual machine
images, database files and download
placeholders keep a straight face, and
the difference between the two numbers
is the whole content of this chapter.

The quiet disagreement runs the other
way. `tiny.txt` is 100 bytes long and
occupies one 4 KiB block, so the
default scan says `4.0Ki` and `-s` says
`100B`. A folder of ten thousand small
files is gigabytes of blocks wearing
megabytes of length. Neither number is
the lie; each is the answer to a
different question, and dust makes you
choose the question.

## The cross-check against du

Suspicion is healthy, so the lab held
dust's totals against `du`'s, on the
same tree, in exact bytes (transcript
`t05`):

```text
$ dust -o b fixture            21180416B
$ du --block-size=1 fixture    21180416
$ dust -s -o b fixture         91427237B
$ du --apparent-size … fixture 88281195
```

In disk-usage mode the two tools agree
**to the byte**: 21,180,416. That is
the check to run on any tree you care
about — dust's picture is a drawing of
`du`'s arithmetic, and here the
arithmetic matches exactly.

In apparent-size mode they part company
by 3,146,042 bytes, and chapter 8 has
the receipt: nearly all of it is the
fixture's hard-linked music file,
which `-s` counts twice and `du` counts
once, plus a few hundred bytes of
directory entries' own lengths that
dust folds in. The disagreement is not
in the measuring of any ordinary file;
it is in a rule about names — which is
the next chapter.
