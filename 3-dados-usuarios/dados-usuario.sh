#!/bin/bash

# Capturando valores digitados pelo usuário
read -p "Digite seu nome: " nome
read -p "Digite sua idade: " idade
read -p "Digite uma mensagem personalizada: " mensagem

# Exibindo todas as informações em uma única linha formatada
echo -e "\n--- Dados Informados ---"
echo -e "Nome: $nome\nIdade: $idade\nNúmero da sua inscrição: $RANDOM\nMensagem: $mensagem"