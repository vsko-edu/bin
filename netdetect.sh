#!/usr/local/bin/bash

echo "           _    ____        _              _             "
echo " ___  ___ | |_ |    \  ___ | |_  ___  ___ | |_  ___  ___ "
echo "|   || -_||  _||  |  || -_||  _|| -_||  _||  _|| . ||  _|"
echo "|_|_||___||_|  |____/ |___||_|  |___||___||_|  |___||_|  "

LISTEN=$(netstat -an | grep LISTEN | tr -s ' ' | cut -f 4 -d ' ' | uniq)
ADDRESSES=""

echo
echo "Detect all network listeners"
echo "----------------------------"
for l in ${LISTEN};
do
    PORTS+="$(echo $l | rev | cut -f1 -d '.' | rev) "
    ADDRESSES+="$(echo $l | grep -E -o '([0-9]{1,3}[\.]){3}[0-9]{1,3}') "
    echo ${l}
done

echo "------"
echo "Addresses: $(echo $ADDRESSES | tr ' ' '\n' | sort | uniq | tr '\n' ' ')"
echo "Ports: $(echo $PORTS | tr ' ' '\n' | uniq | sort -g | tr '\n' ' ')"

echo
echo "Detect all network interfaces"
echo "-----------------------------"
ifconfig -l

