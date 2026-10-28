# Shaping the output

The outcome of this chapter: you can cut
a scan down to the part you care about —
the top of a big tree, the five largest
entries, nothing below a threshold —
and turn the whole tree upside down or
into fixed units when the audience
changes.

All of these were run against the lab
fixture; transcripts `t03` and `t04`
hold the outputs.

## Less tree

**`-d N` — depth.** `dust -d 1 fixture`
shows the root and its children as bare
totals, no grandchildren:

```text
 10Mi   ├── docs    │██████████████████████████                           │  50%
 20Mi ┌─┴ fixture   │████████████████████████████████████████████████████ │ 100%
```

That one line per folder is the fastest
answer to "which of my top folders is
the problem?" Deep trees earn their
depth only after the top level accuses
someone.

**`-n N` — the N largest entries.** By
default dust shows roughly a screenful
of lines, choosing the largest. `-n 5`
makes the choice explicit: the five
biggest entries, *with the parent lines
needed to place them* — the fixture's
five are `old.zip`, `docs`, `photos`,
`holiday.raw` and `archive`, a complete
story in six lines.

**`-z SIZE` — a floor.** `-z 2M` hides
every entry smaller than 2 MiB. Folders
below the floor vanish with their
contents; folders above it keep their
true totals. This is the "show me only
things worth deleting" switch.

## The other way up

**`-r` — reverse.** The tree hangs from
the root at the top, biggest first,
like a file manager:

```text
 10Mi └─┬ docs        │██████████████████████████████████████████████████ │ 100%
8.0Mi   ├─┬ archive   │████████████████████████████████████████           │  80%
```

Nothing else changes — same numbers,
same bars — but some people read a
ranking downwards or not at all. If
you print dust's output in a document
for others, reversed is usually the
politer choice; the root-first layout
is also what `-r` gives screenshots.

## Paths, units, and plain text

**`-p` — full paths.** Names stop being
shortened, so every line says where it
lives: `fixture/docs/archive` instead
of `archive`. Essential the moment two
folders share a name — every machine
has more `cache` folders than it has
names for them.

**`-o` — one unit for everything.**
`-o b` prints bytes (`21180416B`),
`-o k`, `m`, `g` pin kibi/mebi/gibi
units, and `-o si` switches the whole
tree to powers of 1000 — the fixture's
total becomes `21M`, not `20Mi`. The
byte mode is the one to reach for when
comparing dust against another tool,
chapter 7's cross-check included.

**`-b`, `-B`, `--dim`** drop the bars,
move them to the right of the names,
or grey them down for dark terminals.
**`--skip-total`** removes the combined
total line when several paths are
scanned at once (chapter 9) — useful
when each root is a separate question
and a sum would invite the wrong one.

None of these change what is measured.
Shaping is drawing, not measuring —
which is exactly why this chapter sits
before the two that argue about the
measurement itself.
