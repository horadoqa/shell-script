# Operações aritméticas em Shell Script 2

No guiaanterior, você aprendeu sobre **realizar operações matemáticas** em Shell Script, neste guia vamos **capturar valores do usuário** e criar uma **calculadora interativa**.

---

## 1. Crie um novo arquivo

Vamos criar um arquivo chamado:

```bash
calculadora.sh
```

---

## 2. Escreva o código inicial

```bash
#!/bin/bash

# Capturando valores do usuário
read -p "Digite o primeiro número: " num1
read -p "Digite o segundo número: " num2

# Capturando a operação desejada
echo "Escolha a operação:"
echo "1 - Soma (+)"
echo "2 - Subtração (-)"
echo "3 - Multiplicação (*)"
echo "4 - Divisão (/)"
read -p "Digite o número da operação: " operacao

# Realizando a operação
case $operacao in
    1)
        resultado=$((num1 + num2))
        simbolo="+"
        ;;
    2)
        resultado=$((num1 - num2))
        simbolo="-"
        ;;
    3)
        resultado=$((num1 * num2))
        simbolo="*"
        ;;
    4)
        if [ $num2 -eq 0 ]; then
            echo "Erro: divisão por zero não é permitida."
            exit 1
        fi
        resultado=$((num1 / num2))
        simbolo="/"
        ;;
    *)
        echo "Operação inválida!"
        exit 1
        ;;
esac

# Exibindo o resultado
echo -e "\nResultado: $num1 $simbolo $num2 = $resultado"
```

---

## 3. Entendendo o código

### 📌 `read`

Usado para capturar os números digitados pelo usuário:

```bash
read -p "Digite o primeiro número: " num1
```

### 📌 Operações aritméticas

* No Bash, usamos `$(( ))` para calcular expressões matemáticas:

```bash
resultado=$((num1 + num2))
```

* Suporta: `+`, `-`, `*`, `/`, `%` (módulo)

### 📌 `case`

Estrutura de decisão para escolher a operação com base na entrada do usuário.

---

## 4. Dê permissão de execução

```bash
chmod +x calculadora.sh
```

---

## 5. Execute o script

```bash
./calculadora.sh
```

Exemplo de interação:

```
Digite o primeiro número: 10
Digite o segundo número: 5
Escolha a operação:
1 - Soma (+)
2 - Subtração (-)
3 - Multiplicação (*)
4 - Divisão (/)
Digite o número da operação: 1
```

---

## 6. Resultado final

```
Resultado: 10 + 5 = 15
```

---

🎉 **Parabéns!**

Agora você sabe como:

* Capturar valores numéricos do usuário
* Realizar operações matemáticas no Bash
* Criar uma calculadora simples e interativa

O próximo passo pode ser aprender **operações com números decimais**, **loops para calcular várias operações**, ou **menus mais complexos**.

---

Se quiser, posso criar a **versão avançada desta calculadora** que já suporta **decimais e operações contínuas**, mantendo o estilo didático do README. Quer que eu faça isso?
