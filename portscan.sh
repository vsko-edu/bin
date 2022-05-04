#!/usr/bin/env bash

cmd=$(basename $0)

usage() {
  echo "usage: ${cmd} <filelist> | <host> <port>"
}

if [ $# -eq 1 ] || [ $# -eq 2 ]; then
  if [ $# -eq 1 ]; then
    for t in `cat $1`
    do
      host=$(echo $t | cut -f1 -d:)
      port=$(echo $t | cut -f2 -d:)
      nc -zv $host $port
    done
  fi
  if [ $# -eq 2 ]; then
    host=$1
    port=$2
    nc -zv $host $port
  fi
else
  usage
fi

exit 1

