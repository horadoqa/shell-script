#!/bin/bash

verificar_diretorio() {
    local dir=$1
    if [ -d "$dir" ]; then
        echo "O diretório $dir existe."
        return 0
    else
        echo "O diretório $dir não existe."
        return 1
    fi
}

verificar_diretorio "/tmp"
verificar_diretorio "/nao_existe"
verificar_diretorio "/destino"