# JSON and the config file

The outcome of this chapter: you can get
dust's tree out as data another program
can read, and you can make your standing
preferences — reversed tree, say — the
default instead of a flag you retype.

## The tree as data

**`-j`** asks for JSON. The help text
says the tree is written as JSON "to the
current directory"; in version 1.2.6
what the lab observed is the JSON
arriving on **standard output**, one
line, no file created (transcript
`t09-json-and-config.txt`):

```text
$ dust -j fixture/docs
{"size":"10Mi","name":"fixture/docs","children":[…]}
```

Each node is a `size` in dust's human
units, a `name`, and a `children` list —
the same tree, minus the drawing. That
shape is enough to feed a spreadsheet
of disk usage over time, a web page, or
a suspicious script of your own. Two
cautions, both visible in the sample
itself: sizes arrive as *strings in
human units* (`"10Mi"`, not a byte
count), so a consumer must parse them
or the run must be repeated with `-o b`;
and a help text that disagrees with the
binary is a reminder to test the exact
version in front of you, this guide's
included.

## Preferences that stay set

dust reads a config file so standing
choices stop being flags. The file is
TOML, and it lives at
`~/.config/dust/config.toml` (or
`$XDG_CONFIG_HOME/dust/config.toml`),
with `~/.dust.toml` as the other
address. Keys are the long flag names
in kebab-case, values in TOML. The
lab's entire test file was one line
(transcript `t09` again):

```toml
reverse=true
```

```text
$ dust --config cfg.toml fixture/docs
 10Mi └─┬ docs │████… │ 100%
```

The tree came out reversed, root on
top, with no `-r` on the command line.
`--config FILE` points at a specific
file; without it, dust looks in the
standard places. Anything set in the
file can still be overridden for one
run on the command line — the file is
a default, not a lock.

Two honest notes. A config file is
invisible in a transcript and in a
shell history, so a scan that behaves
oddly on one machine and not another
has a suspect: check for
`~/.config/dust/config.toml` before
blaming the tool (chapter 14 returns
to this). And this guide verified
exactly one key for real. The project's
readme shows others (it demonstrates
`limit-filesystem=true` — the `-x`
behaviour that keeps a scan on one
filesystem) and its repository carries
a fuller sample; keys beyond `reverse`
are documented-only here, named as
such in `criteria.md`.
