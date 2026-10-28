# Reading the tree

The outcome of this chapter: given any
dust output, you can say which folder
owns which share of the disk, spot the
largest single file without scanning
numbers, and explain every mark on the
line.

Take one line from the fixture scan
(transcript `t02`):

```text
5.0Mi   │ ├── holiday.raw    │███████████░░                               │  25%
```

Left to right:

- **`5.0Mi`** — the entry's size, in
  human units (1024-based: Ki, Mi, Gi).
  Chapter 6 shows how to pin the whole
  tree to one unit, or to bytes.
- **`├──`** — the tree. `┌──` begins a
  folder's list of children, `├─┴` and
  `┌─┴` mark a folder whose own children
  are listed above it, and the vertical
  bars show which lines belong to which
  parent. A folder's line always sits
  **below** the children it summarises,
  and the root of the whole scan is the
  last line on the screen.
- **`holiday.raw`** — the name, shortened
  unless `-p` asks for full paths.
- **The bar.** Two tones, and two
  comparisons at once. The bar's whole
  length — solid plus faint — is as long
  as its **parent's** bar: `holiday.raw`'s
  bar stretches exactly as far as
  `photos`' bar above it. The solid part
  within that length is the entry itself:
  just under half of it is solid, because
  `holiday.raw` is just under half of
  `photos`. And since the root's bar
  spans the full width, every bar is
  also quietly drawn to the root's scale.
- **`25%`** — a share as a number, and
  this one is always of the scan's
  **root**: `holiday.raw` is 25% of the
  whole fixture. The percentage speaks
  of the total, the bar of the parent;
  that split is why both exist.

## The order is the argument

Within each folder, children are listed
smallest first, reading down towards
their parent line: the biggest child is
the one hugging the folder's own line.
Across the whole picture, the layout is
a ranking you can read from the bottom
up — root, then its biggest child, then
*that* folder's biggest child — which is
the shape of every disk-full story: one
branch carries half the weight, and
inside it one file carries half again.

Files and folders share one ranking.
`docs` earns its 10Mi line mostly from
one file inside `archive`, and dust
shows the chain — `old.zip` 8.0Mi,
`archive` 8.0Mi, `docs` 10Mi — rather
than flattening it, because the chain
is where the file lives and where you
will go to deal with it.

## What a rounded number hides

`20Mi` for the whole fixture is
21,180,416 bytes wearing a coat. The
rounding is honest but coarse: `tiny.txt`
and a 4,095-byte file both wear `4.0Ki`,
and a line that reads `0B` may be a file
of length 67108864 that happens to
occupy no blocks — chapter 7's sparse
file. When a number matters exactly,
chapter 6's `-o b` prints the tree in
bytes. The picture is for finding the
whale; the bytes are for signing the
paperwork.
