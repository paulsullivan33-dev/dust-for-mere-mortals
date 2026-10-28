# The neighbours

The outcome of this chapter: for any
disk-usage question you can name the
tool whose shape fits it — including
the ones that should replace dust for
that job. These tools are characterised
from their documentation and the lab's
cross-checks, not benchmarked; the one
head-to-head this guide ran is the
`du` totals check in chapter 7.

## du — the original

`du` is on every Unix-like system ever
shipped, needs no install, and prints
one number per folder in walk order.
For scripts, for a machine you may not
install anything on, and for the
cross-check chapter 7 performed, it
remains the right tool. dust's claim is
not that `du` is wrong — on the lab
tree their totals matched to the byte —
but that its output is sorted for the
filesystem's convenience, not yours.

## ncdu — the interactive deleter

[ncdu](https://paulsullivan33-dev.github.io/ncdu-for-mere-mortals/)
draws a similar ranking as a full-screen
interface you can walk with the arrow
keys — and, decisively, **delete from**.
When the errand is a cleanup session
rather than a question, ncdu is the
tool; dust is what you run first when
you only want to look, or when the
output must travel (a transcript, a
ticket, a chat message) instead of
being driven live. The pair are the
same instinct at two moments: survey,
then act.

## The rest of the family

dust's own readme keeps an honest list
of alternatives, and they divide by
taste rather than quality: **dua** is
interactive like ncdu with an aggregate
mode; **gdu** is a fast Go-built
analyser with its own interface;
**diskus** strips the idea to a single
total, quickly, for one folder;
**dutree** and **pdu** explore the same
ground with different drawings and a
parallel walk. None of them is the
villain of this guide. If one is
already on your machine and its picture
makes sense to you, the chapters here
transfer almost whole: the measurement
questions — blocks or lengths, links
followed or not — are the same
questions everywhere, and they matter
more than the drawing.

## When the question is not "how big"

dust cannot tell you a file's *age*
distribution at a glance (though `-M`
can filter a scan by modification
time), which files are *duplicates by
content* under different names, or what
a file *is*. Those are other guides'
tools: file-finding and content search
live in the Finding Files guide named
in this one's footer, and file-type
detective work belongs to `file` and
its kin. A map of sizes is one kind of
knowledge; this chapter's honesty is
that the disk usually needs two or
three kinds at once.
