# Installing dust

The outcome of this chapter: dust is on
your machine, `dust --version` answers,
and you know the two display habits it
has when its output is not a terminal.

## The route this guide verified

The lab installed dust exactly the way
its project publishes it: the release
archive from the project's GitHub
releases page. For version 1.2.6 on a
64-bit Linux machine, the file is
`dust-v1.2.6-x86_64-unknown-linux-gnu.tar.gz`.
It unpacks to a folder holding one
binary, `dust`, plus its licence and
readme. There is nothing to compile
and nothing else to install:

```text
$ tar xzf dust-v1.2.6-x86_64-unknown-linux-gnu.tar.gz
$ cd dust-v1.2.6-x86_64-unknown-linux-gnu
$ ./dust --version
Dust 1.2.6
```

(transcript: `dust-lab/transcripts/t00-version.txt`).
Put the binary somewhere on your `PATH`
— `~/.local/bin` is the usual home for
a personal tool — and the same command
answers from anywhere. Archives for
macOS and Windows, and for ARM machines,
sit on the same releases page; the
project also publishes a `.deb` package
for Debian and Ubuntu.

Other routes exist and are the ones
most people will use: a package manager
(the name is `du-dust` in Debian and
Ubuntu, `dust` in Homebrew and in many
other repositories), or `cargo install
du-dust` if you live in the Rust world.
Those routes were not the ones this
guide's lab ran, so they are named here
and not demonstrated — whichever you
use, the check below is the same.

## The check

```text
$ dust --version
Dust 1.2.6
```

One word of vocabulary before it bites:
`dust` is a name other software has
used. If `--version` answers with
anything other than a version of Dust
the disk tool, you have a namesake, and
the release archive above is the way to
get the right one.

## Two display habits

dust expects a terminal. While it walks
it shows a small progress spinner, and
its picture is drawn in colour. Both
behaviours notice when the output is a
pipe or a file instead: the colours are
dropped automatically (every transcript
in this guide is pipe output, and no
colour codes survived into them), and
`-c` drops them by hand when you need
to. The spinner keeps writing to
standard error in a pipe, which is why
scripts add `-P`:

```text
$ dust -P /some/tree | sort
```

`-P` silences the progress indication,
`-c` the colour, and with both, dust's
output is plain text that other tools
can chew on. Chapter 10 returns to
machine-readable output properly.
