#!/bin/bash

# Definindo variáveis
numero1=2
numero2=5

# SOMA
soma=$((numero1 + numero2))
echo "A soma de $numero1 + $numero2 = $soma"

# SUBTRAÇÃO
subtracao=$((numero2 - numero1))
echo "A subtração de $numero2 - $numero1 = $subtracao"

# MULTIPLICAÇÃO
multiplicacao=$((numero1 * numero2))
echo "A multiplicação de $numero1 x $numero2 = $multiplicacao"

# DIVISÃO
divisao=$((numero2 / numero1))
echo "A divisão de $numero2 / $numero1 = $divisao"

# MÓDULO (resto da divisão)
modulo=$((numero2 % numero1))
echo "O módulo de $numero2 % $numero1 = $modulo"

# POTÊNCIA (usando **)
potencia=$((numero1 ** numero2))
echo "$numero1 elevado a $numero2 = $potencia"