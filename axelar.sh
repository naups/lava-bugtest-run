#!/bin/bash

RPC_URL="https://tm.axelar.lava.build/lava-referer-491b106c-a5b7-4ebd-8a5c-ae7eca0e1a92/"

OUTPUT_DIR="logs"

axelar_data=$(curl -s -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","id":"1","method":"status"}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    
    echo "$axelar_data" >> "$OUTPUT_DIR/axelar.txt"
    
    echo "Axelar data fetched and saved to $OUTPUT_DIR/axelar.txt."
else
    echo "Failed to fetch Axelar data."
fi
