# Your first scan

The outcome of this chapter: you have
scanned a tree whose sizes you already
know exactly, and dust's picture matched
the ground truth — so when it later
shows you a number on a real disk, you
know what kind of statement it is making.

## A tree with known sizes

Real disks are useless for a first
lesson: nobody knows what the right
answer is. So the lab built a tree where
every size is chosen, not discovered.
`dust-lab/make-fixture.sh` builds it;
the files are zero-filled, because size
is the subject and content is not:

```text
$ cd dust-lab
$ sh make-fixture.sh
Fixture built in ./fixture
```

What it makes, in plain terms (transcript
`t01` lists the files with their exact
lengths):

- `photos/` — a 5 MiB "raw photo", a
  1 MiB one, a 64 KiB thumbnail, and a
  symbolic link into `docs/`
- `docs/` — a 2 MiB document, a 4 KiB
  note, and `archive/old.zip` at 8 MiB
- `vm/disk.img` — a **sparse file**:
  64 MiB long, occupying no blocks
- `music/track.flac` — 3 MiB, with a
  second name, `track-copy.flac`,
  hard-linked to the same file
- `backup/snapshot.tar` — 1 MiB
- `tiny.txt` (100 bytes) and `.hidden`
  (128 KiB) at the top level

Before dust says anything, `du` states
the two totals everything will be judged
against — 21,180,416 bytes by disk
blocks, 88,281,195 by file lengths
(`t01-fixture-and-du.txt`). Keep both
numbers; chapters 7 and 8 spend them.

## The scan

```text
$ dust fixture
```

The full output is transcript
`t02-first-scan.txt`. Read it bottom-up:
the last line is the tree's total, 20Mi,
and above it the children stack from
smallest (top) to largest (nearest the
root). `docs` at 50% and `photos` at 30%
are the story, exactly as planted: the
8 MiB archive and the 5 MiB photo are
the two biggest single files, and the
bars make both visible without reading
a single size.

Three planted facts to check against
your own run:

- **`vm` shows 0B.** The sparse file is
  really there, 64 MiB long — but dust
  is measuring disk blocks by default,
  and the file occupies none. This is
  not an error; it is the default
  question ("what is my disk carrying?")
  answered honestly. Chapter 7 asks the
  other question.
- **`music` shows 3.0Mi, once.** The
  folder holds two names for one 3 MiB
  file, and disk-usage mode counts the
  file once. Chapter 8.
- **`.hidden` is on the list** at
  128 Ki, 1% — dust does not skip hidden
  files unless told to.

## The same scan on your machine

The fixture is the practice target, not
the point. When the picture makes sense
there, point dust at a real folder you
own — your downloads, your documents:

```text
$ dust ~/Downloads
```

Expect the output to stop at a screenful:
by default dust shows only as many lines
as your terminal has rows, keeping the
largest entries. The fixture fit on one
screen; a real tree will not, and that
limit — and how to lift it — is chapter
6's first subject.
