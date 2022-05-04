#!/usr/bin/sh
#

head() {
  echo "         _                 _                                  "
  echo " ___ ___| |_ _ _ _ ___ ___| |_    ___ ___ ___ ___ ___ ___ ___ "
  echo "|   | -_|  _| | | | . |  _| '_|  |_ -|  _| .'|   |   | -_|  _|"
  echo "|_|_|___|_| |_____|___|_| |_,_|  |___|___|__,|_|_|_|_|___|_|  "
  echo "                                        by nmap               "
  echo
  echo "[s] Scan address"
  echo "[l] List of addresses"
  echo "[p] Ping scanning"
  echo "[i] Information"
  echo "[h] Help"
  echo "[q] Quit"
}

info() {
  echo "* States of ports"
  echo "  open"
  echo "  closed"
  echo "  filtered"
  echo "  not filtered"
  echo "  open|filrered"
  echo "  close|filtered"
}

msg_addr() {
  echo "Scan $1 ..."
}

get_addr() {
  read -p "Address: " addr
  echo ${addr}
}

scan() {
  local addr=$(get_addr);
  msg_addr ${addr}
  nmap -sS ${addr}
}

list_scan() {
  local addr=$(get_addr);
  msg_addr ${addr}
  nmap -sL ${addr}
}

ping_scan() {
  local addr=$(get_addr);
  msg_addr ${addr}
  nmap -sP ${addr}
}

menu() {
  while read -p "Select action: " o;
  do
    case $o in
      "i") info; exit 1 ;;
      "s") scan; exit 1 ;;
      "l") list_scan; exit 1 ;;
      "p") ping_scan; exit 1 ;;
      "h") nmap; exit 1 ;;
      "q") exit 0 ;;
      *) echo "Selected only [s] [h] [q]"
    esac
  done
}

head
menu

