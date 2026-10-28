# Writing criteria for this guide

Every "for Mere Mortals" guide is written to the same nine-point
standard, so a reader who trusts one can trust the rest. Here it
is, with the verification notes for this particular guide below.

1. **Fix it first.** Reader outcomes lead, not action items: each
   chapter opens by naming the outcome it delivers, shows a check
   the reader can run to confirm they got it, and a reasonable
   reader finishes able to state what was done, what it means,
   and what to try next.
2. **Plain language.** Short sentences, everyday vocabulary,
   technical terms defined on first use. No slang, and no
   idioms that only make sense in one country — the reader may
   be translating as they go.
3. **No dead ends.** A guide never tells the reader to do
   something it cannot show them how to verify. Every claim a
   reader relies on — an install, a command, an output — is
   something this guide demonstrates or clearly labels
   documented-only below.
4. **Live-verified where it matters.** Procedures are run for
   real in the guide's lab wherever the build machine allows it,
   and the transcripts kept in the repository are the evidence.
   What could not be run is listed honestly below, never
   presented as if it had been.
5. **General audiences.** Nothing in this guide — examples,
   fixtures, names, addresses — is modelled on any particular
   reader or author's real life, network, or organisations.
   The lab's traffic is the lab talking to itself.
6. **Standalone.** A reader needs this guide, its lab, and
   nothing else. Where another guide would genuinely help, it
   is pointed to once, by name, and the chapter still completes
   without it.
7. **Honest about limits.** Chapter 13 names what the tool
   cannot do: it never deletes anything, its apparent-size
   mode counts hard-linked files once per name, unreadable
   folders shrink its totals without ceremony, it photographs
   a moving tree, and it knows metadata — names and sizes —
   and nothing about what a file is for.
8. **The ethics rule is in the text, early.** Chapter 1 and the
   README state the rule plainly — *your files, your machines,
   or files you have explicit permission to inspect* — before
   any procedure depends on it, and chapter 13 returns to it,
   because a scanning tool makes other people's storage
   legible in a way that is easy to abuse by accident.
9. **Builds clean.** The site builds with MkDocs in strict mode
   with no warnings, and a fresh reader following the chapters
   in order reaches the stated outcome of each.

## Verification notes for this guide

The build machine is a 2-CPU, 7.7 GB Ubuntu 24.04 sandbox.
dust **1.2.6** was installed from the project's official
release archive (`dust-v1.2.6-x86_64-unknown-linux-gnu.tar.gz`
from the bootandy/dust GitHub releases) into a scratch folder
and run against a fixture tree built by the lab itself
(`dust-lab/make-fixture.sh`): files of exact, chosen lengths
filled with zeros, one sparse file made with `truncate`, one
hard link, one symbolic link. All transcripts live in
`dust-lab/transcripts/`.

Run for real, with transcripts as evidence:

- Install from the release archive and `dust --version`
  (t00).
- The fixture itself, its exact file lengths, and the two
  `du` totals every later number is judged against (t01).
- The default scan of the whole fixture (t02).
- Output shaping: `-d 1`, `-n 5`, `-z 2M`, `-r`, `-p`,
  `-o b`, `-o si`, `-b`, `--skip-total` (t03, t04).
- Apparent size versus disk usage: the sparse file at 0B and
  at 64Mi in the two modes, and the byte-exact cross-check
  against `du` — agreement to the byte (21,180,416) in
  disk-usage mode, a 3,146,042-byte gap in apparent mode
  (t05).
- Hard links: counted once and shown once in disk-usage
  mode; counted twice and shown twice under `-s`, against
  `du`'s 3,145,728 bytes both ways (t06).
- Symbolic links: counted as a link and not followed by
  default; followed under `-L`, swelling the parent folder
  from 6.1Mi to 16Mi (t07).
- Finding things: two roots with a combined total, `-F`,
  `-D`, `-f`, `-t`, `-e`, `-v`, `-i` (t08).
- JSON output with `-j` (which arrived on standard output,
  not in a file, in this version) and a one-line TOML config
  file (`reverse=true`) applied via `--config` (t09).
- Error behaviour: a nonexistent path, the message on
  standard error, and exit code 1; plus a broken-pipe panic
  observed intermittently when piping into `head` and
  reproduced reliably with a reader that closes the pipe at
  once (`dust /usr | false`) (t90).

Documented only — described from the project's documentation,
not run, and the text does not claim otherwise:

- Package-manager and cargo installs (the lab ran the
  release archive only), and the macOS, Windows and ARM
  builds.
- Permission-denied behaviour and `--print-errors`: the lab
  ran as the superuser, to whom no folder is unreadable, so
  the locked-door behaviour could not be staged honestly.
  The chapters say "run it and see the folders named"
  without showing a staged transcript.
- Config-file keys other than `reverse` (the project's
  readme demonstrates `limit-filesystem`, and the `-x` flag
  itself was not exercised against a second filesystem).
- The `-M`/`-A`/`-y` time filters, `--files-from` and
  `--files0-from`, `-X`/`-I` ignore files, `--collapse`,
  `-R` screen-reader output, and `-m` filetime mode: present
  in `--help`, named sparingly or not at all in the text,
  never demonstrated.
- The comparison tools in chapter 12 are characterised, not
  benchmarked.

Fixtures are this guide's own and deliberately generic: a
tree of zero-filled files with invented names (a photo
folder, a document archive, a virtual machine image, a
music folder, a backup tarball) built to exact sizes so
every claim could be checked against `du` and against the
fixture's own recipe. No example is modelled on any real
person, machine, service or organisation.
