#!/bin/sh

echo "remove enterprise-repo"
rm /etc/apt/sources.list.d/pve-enterprise.list

echo "add proxmox community-repository"
echo "deb http://download.proxmox.com/debian/pve buster pve-no-subscription" >> /etc/apt/sources.list

echo "Update && Upgrade proxmox"
apt update && apt -y full-upgrade

echo "remove popup and restart pveproxy"
sed -Ezi.bak "s/(Ext.Msg.show\(\{\s+title: gettext\('No valid sub)/void\(\{ \/\/\1/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js && systemctl restart pveproxy.service

echo "install ifupdown2"
apt-get install ifupdown2
