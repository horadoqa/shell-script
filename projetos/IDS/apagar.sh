#!/bin/bash

# URL base da API
BASE_URL="https://serverest.dev/usuarios"

# Verifica se o arquivo ids.txt existe
if [ ! -f ids.txt ]; then
  echo "Arquivo ids.txt não encontrado!"
  exit 1
fi

# Lê cada linha (ID) e executa o DELETE
while read -r ID; do
  if [ -n "$ID" ]; then
    echo "Deletando usuário com ID: $ID"
    curl -s -X DELETE "$BASE_URL/$ID"
    echo -e "\n---------------------------------------"
  fi
done < ids.txt
