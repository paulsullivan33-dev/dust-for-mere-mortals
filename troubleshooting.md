# Troubleshooting

The outcome of this chapter: each common
way a dust scan can look wrong, matched
to the check that settles it. Every
surprise below was produced by this
guide's lab or is the direct consequence
of one that was.

## "dust and du disagree"

First question: **which sizes?** If one
number came from `dust -s` (or a tool
reporting lengths) and the other from
plain `du`, a sparse file anywhere in
the tree will account for gaps of any
size — chapter 7's single file disagreed
by 64 MiB between the two questions.
Settle it in bytes: `dust -o b` against
`du --block-size=1`, same mode both
sides. If they *still* differ and the
tree holds hard links, suspect chapter
8: in `-s` mode dust counts each name,
`du` counts each file. In plain
disk-usage mode on a quiet tree, the
lab's two totals matched exactly; a
mismatch there usually means the tree
changed between the two walks.

## "A folder I know is huge is missing"

Three usual causes, in order:

1. **The screen ran out.** Default
   output is about a terminal-height of
   lines, largest kept. Ask for the
   folder by name (`dust path/to/it`) or
   raise `-n`, rather than concluding
   anything from its absence.
2. **It is a symlink.** Links are
   counted as links and not entered
   (chapter 8). If the "folder" is a
   link into somewhere else, it weighs
   7 bytes of apparent size and points
   at the real weight, which is counted
   where it lives — or use `-L`, knowing
   the price.
3. **A filter is running.** `-i`, `-v`,
   or a config file (below) can remove
   things before the drawing starts.
   Filtered totals are labelled only by
   your memory of typing the flag.

## "The total is smaller than the disk"

dust adds up what it can read. A scan
run as an ordinary user over a system
tree skips other users' private folders
without ceremony, which is correct
behaviour and a wrong total. Re-run
with `--print-errors` to see the locked
doors named, and decide — under chapter
1's rule — whether the missing rooms
are yours to enter at all (a `sudo`
scan answers the arithmetic question
and raises the permission one; both
deserve a pause).

## "It panicked about a broken pipe"

Once in the lab, piping dust into
`head` ended with a Rust panic on
standard error — *failed printing to
stdout: Broken pipe* — after `head`
took its lines and closed the pipe
(transcript `t90`). Behind `head` it
appears only intermittently — a race
between the writer and the reader
closing early — but a reader that
closes the pipe at once (`dust /usr |
false`) reproduces it reliably. The practical reading:
the panic is cosmetic, the lines
`head` kept are real, and if a script
depends on the pipeline, give dust a
reader that stays to the end (`head`
with a generous count, or redirect to
a file and trim after).

## "The output is full of spinner junk"

In scripts, dust's progress spinner
writes control characters to standard
error. Add `-P`. Colours vanish into
pipes on their own; add `-c` when a
tool downstream is confused by them
anyway, and `-R` when the reader is a
screen reader — bars off, a depth
column on.

## "Same command, different tree shape"

Check for a config file. A
`~/.config/dust/config.toml` (or
`~/.dust.toml`) left from an earlier
experiment silently applies its
defaults — the lab's one-line file
reversed every tree it touched,
chapter 10. `--config` with an empty
file of your own is the quick override
while you investigate. And confirm it
is *this* dust: `--version` should say
`Dust` and a version, not a namesake.
