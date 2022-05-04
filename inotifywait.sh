#!/usr/bin/env bash

if [ $# -lt 1 ]; then
  echo "usage: $(basename $0) <directory>"
  exit 1
fi

inotifywait -mr ${1} --timefmt '%Y-%m-%d %H:%M:%S' --format '%T %w %f %e' -e create,modify,attrib,move,delete |
while read time path file action; do
  echo "$time $path $file $action"
  #echo "$time $path $file $action" >> /inotifywait.log
done

