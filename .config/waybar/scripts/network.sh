#!/usr/bin/env bash

INTERVAL=1  # seconds

IF=$(ip route | grep '^default' | awk '{print $5}')

case "$IF" in
    wlan*|wl*)
        NAME="Wi-Fi"
        ;;
    eth*|en*)
        NAME="LAN"
        ;;
    *)
        NAME="$IF"
        ;;
esac


if [ -z "$IF" ]; then
    echo '{"text": "Disconnected"}'
    exit
fi

CACHE="/tmp/network_$IF"
RX_NOW=$(cat /sys/class/net/$IF/statistics/rx_bytes)
TX_NOW=$(cat /sys/class/net/$IF/statistics/tx_bytes)

if [ -f "$CACHE" ]; then
    read -r RX_OLD TX_OLD < "$CACHE"
    RX_RATE=$(( (RX_NOW - RX_OLD) / INTERVAL ))
    TX_RATE=$(( (TX_NOW - TX_OLD) / INTERVAL ))
else
    RX_RATE=0
    TX_RATE=0
fi

# Save current counters for next run
echo "$RX_NOW $TX_NOW" > "$CACHE"

# Format rates
RX_FMT=$(numfmt --to=iec --suffix=B <<< "$RX_RATE")
TX_FMT=$(numfmt --to=iec --suffix=B <<< "$TX_RATE")

echo "{\"text\": \"$NAME ↓$RX_FMT/s ↑$TX_FMT/s\"}"
