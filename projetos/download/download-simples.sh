#!/bin/bash

URL="https://update.code.visualstudio.com/commit:ce099c1ed25d9eb3076c11e4a280f3eb52b4fbeb/server-linux-x64/stable"
OUTPUT="vscode-server.tar.gz"

while true; do
    echo "Tentando baixar em $(date)..."

    wget "$URL" -O "$OUTPUT"

    if [ $? -eq 0 ]; then
        echo "Download concluído com sucesso!"
        break
    else
        echo "Falhou. Tentando novamente em 10 segundos..."
        sleep 10
    fi
done