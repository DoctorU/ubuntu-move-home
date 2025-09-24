#!/usr/bin/env sh
set -e # exit on any error.
# Using sh where possible. If this doesn't work, it might move to "bash"
# Currently, this is untested: copy-and-pasted only.
# process options
#filesystemtype - will change the script to allow this as an option.
_device="${1}"; shift
_fstype='ext3';

#validations
if [ -z "${device}" ]; then # exit if the string is empty
  echo 'Device ID required.' 1>&2;
  exit 1;
fi
# list all the UUIDs
sudo blkid || sudo vol_id -u "${_device}"

# TODO: extract uuid from the above.
_uuid=??????
_tmsp=$(Date +%Y-%m-%d)
#backup fstab
sudo cp /etc/fstab /etc/fstab.${_tmsp}
#verify the backup matches the original
cmp /etc/fstab /etc/fstab.${_tmsp}

# add /media/home:
sudi echo "UUID=${_uuid}   /media/home    ${_fstype}          defaults       0       2" >> /etc/fstab

sudo mkdir /media/home

#refresh the mounts
sudo mount -a

# copy existing homedir - NOT for encrypted filesystems
sudo rsync -aXS --exclude='/*/.gvfs' /home/. /media/home/.

# verify the copy
sudo diff -r /home /media/home -x ".gvfs/*"

