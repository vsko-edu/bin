#!/usr/bin/env bash

backup_dir="/usr/backups"
backup_pool=(
  /home/vsko/bin/backup
  /usr/local/etc
)

for p in ${backup_pool[*]};
do
  ar="$(echo $p | tr '/' '-' | cut -c 2-).tar.gz"
  #echo "Create $ar from $p"
  #tar czfP ${backup_dir}/${ar} ${p}
done

# Create tar.bz2 archive with full path
#tar cjvfP backup.tar.bz2 /home/vsko/bin/backup
#tar czvfP backup.tar.gz /home/vsko/bin/backup
#tar cJvfP backup.tar.xz /home/vsko/bin/backup

# Extract tar.bz2 archive with full path
#tar xjfP backup.tar.bz2
#tar xzfP backup.tar.gz

