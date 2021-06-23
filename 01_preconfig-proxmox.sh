#!/bin/sh

echo "remove enterprise-repo"
rm /etc/apt/sources.list.d/pve-enterprise.list

echo "add proxmox community-repository"
echo "deb http://download.proxmox.com/debian/pve buster pve-no-subscription" >> /etc/apt/sources.list

echo "Update && Upgrade proxmox"
apt update -y

echo "install ifupdown2 & cloud-init"
apt-get install ifupdown2 cloud-init -y
