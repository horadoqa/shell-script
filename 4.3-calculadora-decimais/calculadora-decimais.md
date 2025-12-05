# Calculadora de Números Decimais em Shell Script

Neste guia, você vai criar uma **calculadora interativa** que permite ao usuário digitar dois números decimais e escolher a operação desejada.

---

## 1. Crie um novo arquivo

```bash
calculadora-decimal.sh
```

---

## 2. Escreva o código

```bash
#!/bin/bash

# Capturando valores do usuário
read -p "Digite o primeiro número: " num1
read -p "Digite o segundo número: " num2

# Escolhendo a operação
echo "Escolha a operação:"
echo "1 - Soma (+)"
echo "2 - Subtração (-)"
echo "3 - Multiplicação (*)"
echo "4 - Divisão (/)"
echo "5 - Potência (^)"
read -p "Digite o número da operação: " operacao

# Executando a operação usando bc
case $operacao in
    1)
        resultado=$(echo "$num1 + $num2" | bc)
        simbolo="+"
        ;;
    2)
        resultado=$(echo "$num1 - $num2" | bc)
        simbolo="-"
        ;;
    3)
        resultado=$(echo "$num1 * $num2" | bc)
        simbolo="*"
        ;;
    4)
        if [ "$num2" = "0" ]; then
            echo "Erro: divisão por zero não é permitida."
            exit 1
        fi
        resultado=$(echo "scale=2; $num1 / $num2" | bc)
        simbolo="/"
        ;;
    5)
        resultado=$(echo "$num1 ^ $num2" | bc)
        simbolo="^"
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

## 3. Dê permissão de execução

```bash
chmod +x calculadora-decimal.sh
```

---

## 4. Execute o script

```bash
./calculadora-decimal.sh
```

Exemplo de interação:

```
Digite o primeiro número: 5.5
Digite o segundo número: 2.3
Escolha a operação:
1 - Soma (+)
2 - Subtração (-)
3 - Multiplicação (*)
4 - Divisão (/)
5 - Potência (^)
Digite o número da operação: 1
```

---

## 5. Resultado esperado

```
Resultado: 5.5 + 2.3 = 7.8
```

---

### 📌 Observações importantes

* Usamos o comando **`bc`** para operações com decimais.
* `scale=2` define o número de casas decimais para divisões.
* A calculadora suporta: `+`, `-`, `*`, `/`, `^` (potência).
* Tratamento de **divisão por zero** está incluído para evitar erros.

---

🎉 **Parabéns!**
Agora você tem uma **calculadora interativa completa para números decimais** em Shell Script, pronta para experimentar todas as operações matemáticas.

---

