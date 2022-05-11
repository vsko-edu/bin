#!/usr/bin/env bash
#
# ~/.sshfsrc file:
# sites:vsko@192.168.0.200:/usr/local/www/sites/:/mnt/sites
# storage:vsko@192.168.0.200:/usr/storage/:/mnt/storage:~/.ssh/id_rsa
#
# ~/.ssh/config file:
# Host 192.168.0.200
# HostName 178.20.153.253
# Port 22
# User root
# IdentityFile /root/.ssh/id_rsa
#
# command:
# sshfs -o allow_other,IdentityFile=~/.ssh/id_rsa user@host:/home/user/ /mnt/share
#

SSHFS_RCFILE=~/.sshfsrc
SSHFS_VERBOSE=3
#SSHFS_OPTIONS="allow_other,default_permissions"
SSHFS_OPTIONS="allow_other"

for data in `cat ${SSHFS_RCFILE}`;
do
  name=$(echo ${data} | cut -f1 -d:)
  server=$(echo ${data} | cut -f2 -d:)
  remote_dir=$(echo ${data} | cut -f3 -d:)
  local_dir=$(echo ${data} | cut -f4 -d:)
  identity_file=$(echo ${data} | cut -f5 -d:)
  options=${SSHFS_OPTIONS}

  if [[ ${data::1} == '#' ]]; then continue; fi
  if [[ $name == $server ]]; then continue; fi
  if [[ ! -z $identity_file ]];
  then
   options+=",IdentityFile=~/.ssh/id_rsa"
  fi

  if [[ ! -z $remote_dir && ! -z $local_dir ]];
  then
    command=(sudo sshfs -o ${options} ${server}:${remote_dir} ${local_dir})
    ${command[@]}

    if [[ $SSHFS_VERBOSE -gt 0 ]]; then
      if [[ $SSHFS_VERBOSE -eq 1 ]];
      then
        echo "Mount ${server}${remote_dir} to ${local_dir}"
      else
        if [[ $SSHFS_VERBOSE -gt 1 ]]; then
          echo "Name: ${name}"
          echo "Server: ${server}"
          echo "Remote directory: ${remote_dir:-empty}"
          echo "Local dir: ${local_dir:-empty}"
          echo "Identity file: ${identity_file:-empty}"
        fi
        if [[ $SSHFS_VERBOSE -gt 2 ]];
        then
          echo "Command: ${command[@]}"
        fi
      fi
    fi
  fi

done
