#!/usr/bin/env bash
#
# SSHFS auto mount tool
#
# SSHFS_OPTIONS: allow_other,default_permissions,nonempty,uid=1000,gid=1000
#
# ~/.sshfsrc file:
# label1:user@host:/path/to/remote:/path/to/local
# label2:user@host:/path/to/remote:/path/to/local:/path/to/id_rsa
#
# ~/.ssh/config file:
# Host server
#   HostName ip
#   User root
#   IdentityFile /root/.ssh/id_rsa
#   AddKeysToAgent yes
#

SSHFS_RCFILE=~/.sshfsrc
SSHFS_SSH_CONFIG=~/.ssh/config
SSHFS_OPTIONS="allow_other"
SSHFS_VERBOSE=3

for data in $(cat $SSHFS_RCFILE);
do
  name=$(echo ${data} | cut -f1 -d:)
  server=$(echo ${data} | cut -f2 -d:)
  remote_dir=$(echo ${data} | cut -f3 -d:)
  local_dir=$(echo ${data} | cut -f4 -d:)
  identity_file=$(echo ${data} | cut -f5 -d:)
  params="-o ${SSHFS_OPTIONS}"

  if [[ ${data::1} == '#' ]]; then continue; fi
  if [[ $name == $server ]]; then continue; fi
  if [[ ! -z $identity_file ]];
  then
   params+=",IdentityFile=${identity_file}"
  fi

  if [[ ! -z $remote_dir && ! -z $local_dir ]];
  then
    if [[ ! -z $SSHFS_SSH_CONFIG ]];
    then
      params="-F ${SSHFS_SSH_CONFIG} ${params}"
    fi

    command="sshfs ${server}:${remote_dir} ${local_dir} ${params}"

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
          echo "Command: ${command}"
        fi
      fi
    fi

    eval $command

  fi

done
