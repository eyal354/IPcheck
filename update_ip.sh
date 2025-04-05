#!/bin/bash

# Settings
REPO_DIR="$HOME/IPcheck"
IP_FILE="public_ip.txt"
CURRENT_IP=$(curl -s ifconfig.me)

cd "$REPO_DIR" || exit 1

if [ -f "$IP_FILE" ]; then
    LAST_IP=$(cat "$IP_FILE")
else
    LAST_IP=""
fi

if [ "$CURRENT_IP" != "$LAST_IP" ]; then
    echo "$CURRENT_IP" > "$IP_FILE"
    git add "$IP_FILE"
    git commit -m "Update IP: $CURRENT_IP"
    git push origin main
fi
