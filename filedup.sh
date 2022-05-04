#!/bin/sh

head() {
  echo "  __  _  _        _____                "
  echo " / _|(_)| |      |  __ \               "
  echo "| |_  _ | |  ___ | |  | | _   _  _ __  "
  echo "|  _|| || | / _ \| |  | || | | || '_ \ "
  echo "| |  | || ||  __/| |__| || |_| || |_) |"
  echo "|_|  |_||_| \___||_____/  \__,_|| .__/ "
  echo "                                | |    "
  echo "                                |_|    "
  echo
}

menu() {
  echo "[c] Check cache"
  echo "[f] Find duplicates"
  echo "[q] Quit"
}

head
menu
