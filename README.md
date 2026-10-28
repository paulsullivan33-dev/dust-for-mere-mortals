# Dust for Mere Mortals

A disk fills up quietly and announces
itself rudely, usually by refusing to
save, install or start something. The
question that follows — *full of what?*
— has an old answer, `du`, which prints
a number for every folder on the disk
and leaves the finding to you. **dust**
gives the same answer as a picture: a
tree of the biggest folders and files,
biggest nearest the root, every line
carrying a bar that shows its share of
the whole. One command, and the whale
is usually in view.

This guide explains how that picture is
drawn and measured, how to take your
first scan against a practice tree whose
sizes are known exactly, how to read
the tree's bars and percentages, and how
to cut a scan down to the part you came
for. It spends two chapters on the part
nobody warns you about: a file has two
sizes — its length and the disk space it
occupies — and dust can report either,
with a sparse file and a hard link in
the lab to make the two answers disagree
out loud. It also reports what the lab
caught in the act: one mode of dust
counts a hard-linked file twice, and
the guide shows the receipt.

The rule that governs everything here is
stated in chapter 1 and repeated in
chapter 13: **your files, your machines,
or files you have explicit permission to
inspect.** dust reads the names and sizes
of everything it can reach, including
other people's folders on a shared
machine, and a map is not permission.
Within that rule, dust is safe to point
at anything: it never changes, moves or
deletes what it looks at.

The lab behind this guide ran the real
thing: **dust 1.2.6**, from the project's
official release archive, against a
fixture tree the lab built to exact
sizes with `dust-lab/make-fixture.sh` —
ordinary zero-filled files of chosen
lengths, one sparse file of length
64 MiB occupying no disk blocks, one
file wearing two names as a hard link,
and one symbolic link. Against that
tree the lab ran the default scan and
every shaping flag in chapter 6, held
dust's totals up against `du`'s in exact
bytes (they agreed to the byte in
disk-usage mode, and parted by a
measured 3,146,042 bytes in apparent
size mode, for a reason chapter 8
demonstrates), followed a symbolic link
to watch a folder swell, filtered by
type and pattern, produced the tree as
JSON, and set a standing preference in
the config file. What the lab could not
stage, it did not fake: it worked as
the superuser, to whom no folder is
unreadable, so the locked-door
behaviour of a scan across other users'
folders is described from the
documentation and labelled as such.
`criteria.md` keeps the full ledger of
what was run and what was only read.

## What this guide covers

- [**What dust is**](what-dust-is.md) —
  the full-disk question, the tree that
  answers it, and the rule about whose
  files you may map
- [**The moving parts**](the-moving-parts.md) —
  the walk, the measuring (two sizes,
  not one), and the drawing, and which
  part to argue with when a number
  looks wrong
- [**Installing dust**](installing-dust.md) —
  the release archive the lab verified,
  the package names other routes use,
  and the `-P` and `-c` habits for pipes
- [**Your first scan**](your-first-scan.md) —
  a tree of known sizes, the first
  picture, and three planted facts to
  check against your own run
- [**Reading the tree**](reading-the-tree.md) —
  every mark on the line: sizes, tree
  glyphs, the two-tone bar, and why the
  percentages and the bars answer to
  different parents
- [**Shaping the output**](shaping-the-output.md) —
  depth, the largest N, a size floor,
  the reversed tree, full paths, fixed
  units, and plain text
- [**Two kinds of size**](two-kinds-of-size.md) —
  length against disk usage, the sparse
  file that is 0B and 64Mi at once, and
  the byte-exact cross-check against `du`
- [**Hard links and symlinks**](hard-links-and-symlinks.md) —
  one file with two names, counted once,
  then — in apparent mode — twice, and
  the signpost that `-L` turns into a door
- [**Finding what you came for**](finding-what-you-came-for.md) —
  biggest files, biggest folders, file
  counts, file types, filters, and
  several places at once
- [**JSON and the config file**](json-and-the-config-file.md) —
  the tree as data, and preferences
  that stay set — including one place
  where the help text and the binary
  disagree
- [**Recipes**](recipes.md) — the full
  disk, the enormous home folder, the
  two copies, and a monthly habit that
  turns surprises into trend lines
- [**The neighbours**](the-neighbours.md) —
  `du`, ncdu, and the rest of the family:
  which tool fits which shape of question
- [**Limits**](limits.md) — it never
  deletes, its `-s` total can overstate,
  it photographs a moving crowd, and the
  permission rule, stated again plainly
- [**Troubleshooting**](troubleshooting.md) —
  when dust and `du` disagree, when a
  folder goes missing, when a pipe
  panics, and the config file that
  changes everything quietly
- [**Glossary**](glossary.md) — the
  terms, collected in one place

## What it doesn't cover

Deleting things. dust has no delete, and
this guide sends the actual tidying to
your judgement and to tools built for
it. Finding duplicate files by content,
recovering lost disk space from
snapshots or filesystems themselves,
and administering shared storage for an
organisation — quotas, policies, other
people's trees — are likewise out. This
guide stays with one person, their own
disks, and the honest measurement of
what is on them.

## How to use this guide

Read chapter 1 for the question and the
rule, and chapter 2 before your first
real scan — knowing that a file has two
sizes turns most later confusion into a
named problem. Build the fixture in
chapter 4 and keep it: chapters 7 and 8
grade dust against it, and you can
repeat every measurement yourself.
Chapters 6 and 9 are the working
toolbox; chapter 13 is not the optional
chapter, because the `-s` warning in it
is the difference between a true total
and a confident one. The lab's
transcripts live in
`dust-lab/transcripts/`; its fixture
script is `dust-lab/make-fixture.sh`;
its notes are `examples/lab-notes.txt`.

---

## Part of the series

This guide is one of the [For Mere Mortals](https://paulsullivan33-dev.github.io/mere-mortals/) guides: plain-language guides to the tools programmers and makers use.

Related guides:

- [Ncdu for Mere Mortals](https://paulsullivan33-dev.github.io/ncdu-for-mere-mortals/)
- [Finding Files for Mere Mortals](https://paulsullivan33-dev.github.io/finding-files-for-mere-mortals/)
- [Linux for Mere Mortals](https://paulsullivan33-dev.github.io/linux-for-mere-mortals/)

## License

The writing in this guide is licensed under [CC BY 4.0](https://github.com/paulsullivan33-dev/dust-for-mere-mortals/blob/main/LICENSE). Code examples and lab scripts are licensed under the [MIT License](https://github.com/paulsullivan33-dev/dust-for-mere-mortals/blob/main/LICENSE-CODE).
