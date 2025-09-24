#!/usr/bin/env sh
set -e # exit on any error
# modify fstab entry for new home
_uuid="${1:-??????}"
_tmsp=$(Date +%Y-%m-%d)

# change the /media/home to just /home
sed -e 's:/media/home:/home:' -i'.'"${_tmsp}" '/etc/fstab'

# swap homes
cd / && sudo mv /home /old_home && sudo mkdir /home

#re-mount everything:
sudo mount -a
