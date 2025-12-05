#!/bin/bash

# URL da API
URL="https://serverest.dev/usuarios"

# Faz a requisição e salva os IDs onde nome == "Hora do QA"
curl -s "$URL" \
  | jq -r '.usuarios[] | select(.nome == "Hora do QA") | ._id' \
  > ids.txt

echo "IDs encontrados foram salvos em ids.txt"