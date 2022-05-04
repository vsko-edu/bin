#!/bin/sh

BACKUP_DIR="/usr/backups"
INFO_DATA="${BACKUP_DIR}/.info"

if [ ! -d ${BACKUP_DIR} ]; then mkdir ${BACKUP_DIR}; fi

date >> ${INFO_DATA}
df -h >> ${INFO_DATA}

dump -0 -auLf - /home | gzip -q > ${BACKUP_DIR}/home.img.gz

