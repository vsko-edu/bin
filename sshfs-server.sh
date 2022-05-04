#!/usr/bin/env bash

# macOS
sshfs -o IdentityFile=~/.ssh/id_rsa vsko@192.168.1.200:/ ~/server

# Debian / Ubuntu
#sudo sshfs -o allow_other, IdentityFile = ~/.ssh/id_rsa vsko@192.168.1.200:/home/user/ /mnt/share

