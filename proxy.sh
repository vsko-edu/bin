#!/usr/bin/env bash

PROXY_PROTO="socks5"
PROXY_HOSTNAME="192.168.0.200"
PROXY_PORT=9050

if [ $# -lt 1 ] || [ $# -gt 1 ]; then
    echo -e "usage: source proxy.sh on|off"
else
    case $1 in
    on)
        export HTTP_PROXY="${PROXY_PROTO}://${PROXY_HOSTNAME}:${PROXY_PORT}"
        export HTTPS_PROXY="${PROXY_PROTO}://${PROXY_HOSTNAME}:${PROXY_PORT}"
        export ALL_PROXY="${PROXY_PROTO}://${PROXY_HOSTNAME}:${PROXY_PORT}"
        echo "Proxy on"
    ;;
    off)
        unset HTTP_PROXY
        unset HTTPS_PROXY
        unset ALL_PROXY
        echo "Proxy off"
    ;;
    esac
fi

