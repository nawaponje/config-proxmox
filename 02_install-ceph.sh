#!/bin/sh

echo "Update && Upgrade proxmox"
apt update -y

echo "Install Proxmox Ceph"
pveceph install

#pveceph mon create
#pveceph mgr create
#pveceph osd create /dev/sd[X]
#pveceph pool create <name> --add_storages
