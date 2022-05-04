#!/usr/bin/env bash
#
# Registering & verifing user
# megareg --register --email <user@email> --password "password" --name "username"
# megareg --verify 0koBj51Zp7boymyPppjNTg==:Boo1hQAAAAAAAAAAqXQHag==:GXL0njVJtAQ @LINK@
#

# Settings
login="user@email"
password="password"
id="--username $login --password $password"
mega_dir="/Root/backups"
backup_dir="/usr/backups"
backup_file="/usr/backups/backup.tar.gz"
clear_cache=1

# Clear cache
if [ $clear_cache -eq 1 ];
then
  rm /tmp/*.megatools.cache 2> /dev/null
fi

# Creates directory into mega
if [ `megals $id ${mega_dir} 2>/dev/null | wc -l` == 0 ];
then
  megamkdir $id ${mega_dir} 2>/dev/null
fi

# Run commands
#megadf $id
#megaput $id ${backup_file}
#megacopy $id --local ${backup_dir} --remote ${mega_dir}
#megarm $id ${mega_dir}
#megals --recursive $id /Root /Trash

