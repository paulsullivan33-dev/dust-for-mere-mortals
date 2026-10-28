# What dust is

The outcome of this chapter: you can say
what question dust answers, how its answer
differs from the one `du` gives, and the
one rule that governs pointing it at a
machine.

## The full-disk question

Every computer eventually asks the same
rude question, usually by refusing to do
something: *the disk is full — full of
what?* The files you remember making are
rarely the answer. The answer is a cache
that grew for two years, a virtual machine
image from an abandoned experiment, nine
copies of the same photo library, a log
file nobody rotated.

The traditional tool is `du`, older than
most of the people who use it. `du` walks
a folder tree and prints a number for
every folder in it — thousands of numbers,
in an order that serves the filesystem,
not you. Finding the whale in that output
is a sorting-and-grepping exercise you
re-learn every time.

**dust** (its package is `du-dust`) asks
the same question and draws the answer:
a tree of the biggest folders and files,
biggest nearest the root, each line with a
bar showing its share of the whole. One
command, one picture, and the whale is
usually visible before you have finished
reading the screen.

```text
$ dust
```

That is the whole first lesson: run with
no arguments inside a folder, dust reports
on that folder. Everything else in this
guide is refinement — telling it how deep
to look, which sizes to trust, and what
its numbers quietly leave out.

## The rule

dust walks a tree and reports the name and
size of everything it finds. On your own
laptop that is housekeeping. On a shared
machine — a server at work, a family
computer with several accounts — the same
walk reads other people's file names,
folder names and habits of storage, which
are theirs, not yours.

So the rule, stated here and repeated in
chapter 13: **your files, your machines,
or files you have explicit permission to
inspect.** A disk that is not yours to
tidy is not yours to map. Within that
rule, scan freely: dust never changes,
moves or deletes anything it looks at.
It reads directory listings and file
metadata, and that is all it does.

## What dust is not

dust is not a cleaner. It has no delete
key, no "free up space" button, no opinion
about what you should keep. It is a map,
and the map is the whole product. When
you want to walk the map interactively
and delete as you go, that is a different
tool (ncdu, chapter 12). When you want
raw numbers to feed a script, that is
`du` itself, which is not going anywhere.
dust's bet is narrower: that most of the
time, the picture *is* the answer.
