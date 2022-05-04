#!/usr/bin/env bash

echo "Update & upgrade ports"
sudo portupgrade -arR
echo "----------------------"

echo "Cleaning ports"
sudo portsclean -C
echo "--------------"

#echo "Cleaning log files"
#sudo truncate -s 0 /var/log/*
#sudo m -f /var/log/*.*.*
#echo "------------------"

echo "Detect large files"
sudo find / -size +500M -print
echo "------------------"

echo "Detect 20 bigest files"
sudo du -ah / | sort -rh | head -20
echo "----------------------"

