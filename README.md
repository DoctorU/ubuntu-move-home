# ubuntu-move-home
Script and instructions for moving a homedir on Ubuntu.

## Source

The scripts here are derived from the
[Ubuntu Wiki: Partitioning: Moving Home](https://help.ubuntu.com/community/Partitioning/Home/Moving)
instructions.

## Steps

1. Create the new partition and copy your existing home to it
   * run [`bin/create-new-partition-and-copy-home.sh`](./bin/create-new-partition-and-copy-home.sh).
3. Restart your machine.
4. Continue on from "Preparing fstab for the switch" in the wiki article.
   * run (`bin/move-home.sh`](./bin/move-home.sh).
5. Cleanup: run [`bin/delete-old-home.sh`](#todo).
