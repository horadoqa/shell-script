# Operações Aritméticas em Shell Script

Neste guia, você vai aprender a **realizar operações matemáticas** em Shell Script, incluindo soma, subtração, multiplicação, divisão e alguns exemplos adicionais.

---

## 1. Crie um novo arquivo

Vamos criar um arquivo chamado:

```bash
operacoes-aritmeticas.sh
```

---

## 2. Escreva o código inicial

```bash
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
```

---

## 3. Dê permissão de execução

```bash
chmod +x operacoes-aritmeticas.sh
```

---

## 4. Execute o script

```bash
./operacoes-aritmeticas.sh
```

Você verá uma saída como:

```
A soma de 2 + 5 = 7
A subtração de 5 - 2 = 3
A multiplicação de 2 x 5 = 10
A divisão de 5 / 2 = 2
O módulo de 5 % 2 = 1
2 elevado a 5 = 32
```

---

## 📌 Observações importantes

* **`$(( ))`** é usado para operações aritméticas no Bash.
* Operações suportadas:

  * `+` soma
  * `-` subtração
  * `*` multiplicação
  * `/` divisão (inteira)
  * `%` módulo (resto da divisão)
  * `**` potência
* Para divisões com **números decimais**, será necessário usar o comando `bc`:

```bash
resultado=$(echo "scale=2; 5/2" | bc)
echo $resultado  # Saída: 2.50
```

---
