#!/usr/bin/env bash
#
# Backup and upload to mega.nz
#
# TODO
# - Added packing tar simple files in pool (testing as now)
#

# Settings
login="user@email"
password="password"
id="--username $login --password $password"
clear_cache=1
verbose=1
mega_dir="/Root/vsko-server"
backup_dir="/usr/backups"
backup_pool=(
#  /home/vsko/bin/
#  /usr/local/etc
#  /etc/rc.conf
  /home/vsko/max_kulik
)

for path in ${backup_pool[*]};
do
  archive="$(echo $path | tr '/' '-' | sed 's/^-//g;s/-$//g').tar.gz"
  echo "Create $archive from $path"
  tar czfP ${backup_dir}/${archive} ${path}
done

# Clear cache
if [ $clear_cache -eq 1 ];
then
  rm /tmp/*.megatools.cache 2> /dev/null
fi

# Removies backup directory into mega
megarm $id ${mega_dir} 2>/dev/null

# CreatesÑbackup  directory into mega
if [ `megals $id ${mega_dir} 2>/dev/null | wc -l` == 0 ];
then
  megamkdir $id ${mega_dir} 2>/dev/null
fi

# Copies to mega storage
megacopy $id --local ${backup_dir} --remote ${mega_dir}

# Show all backups
megals --recursive $id ${mega_dir}

