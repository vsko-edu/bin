#!/usr/bin/env bash

echo "                             o                         8      "
echo "                             8                         8      "
echo ".oPYo. oPYo. o    o .oPYo.  o8P .oPYo. oPYo.    .oPYo. 8oPYo. "
echo "8    ' 8  \`' 8    8 8    8   8  8    8 8  \`'    Yb..   8    8 "
echo "8    . 8     8    8 8    8   8  8    8 8          'Yb. 8    8 "
echo "\`YooP' 8     \`YooP8 8YooP'   8  \`YooP' 8     88 \`YooP' 8    8 "
echo ":.....:..:::::....8 8 ....:::..::.....:..::::..::.....:..:::.."
echo ":::::::::::::::ooP'.8 ::::::::::::::::::::::::::::::::::::::::"
echo ":::::::::::::::...::..::::::::::::::::::::::::::::::::::::::::"

head() {
    echo "[l] List keys"
    echo "[g] Generate key"
    echo "[e] Encrypt files"
    echo "[d] Decrypt files"
    echo "[q] Quit"
}

msg_path() {
    read -p "Path to file: " path
    echo ${path}
}

list() {
    gpg --list-keys
}

encrypt() {
    local path=$(msg_path)
    gpg -r 'vsko@email.ua' -e ${path} && \
    echo "Created ${path}.gpg encryption file"
}

decrypt() {
    local path=$(msg_path)
    gpg -d ${path} && \
    echo "Created ${path} decryption file"
}

menu() {
    while read -p "Select option: " o;
    do
        case $o in
            l) list ;;
            e) encrypt ;;
            d) decrypt ;;
            q) exit 1 ;;
            *) echo "Option [${o}] not found"
        esac
    done
}

head
menu

