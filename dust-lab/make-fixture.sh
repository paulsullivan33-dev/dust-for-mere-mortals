#!/bin/sh
# Build the practice tree this guide's transcripts were made
# against. Every file is filled with zero bytes; only the sizes
# matter, and the sizes are exact.
#
# Run from the dust-lab folder:
#     sh make-fixture.sh
# It creates ./fixture next to this script. Safe to re-run: the
# old tree is removed first.
set -e
cd "$(dirname "$0")"
rm -rf fixture
mkdir -p fixture/photos fixture/docs/archive fixture/vm \
         fixture/music fixture/backup

mk() { head -c "$2" /dev/zero > "$1"; }

mk fixture/tiny.txt 100
mk fixture/.hidden 131072
mk fixture/photos/holiday.raw 5242880
mk fixture/photos/portrait.jpg 1048576
mk fixture/photos/thumb.jpg 65536
ln -s ../docs fixture/photos/link-docs
mk fixture/docs/report.pdf 2097152
mk fixture/docs/notes.txt 4096
mk fixture/docs/archive/old.zip 8388608
# A sparse file: 64 MiB long, occupying no data blocks at all.
truncate -s 67108864 fixture/vm/disk.img
mk fixture/music/track.flac 3145728
# A second name for the same file: a hard link, not a copy.
ln fixture/music/track.flac fixture/music/track-copy.flac
mk fixture/backup/snapshot.tar 1048576

echo "Fixture built in ./fixture"
