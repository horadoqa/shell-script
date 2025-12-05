# Calculadora Interativa Avançada em Shell Script

Esta versão permite ao usuário **realizar várias operações consecutivas** sem precisar reiniciar o script.
Ela também valida entradas e suporta **números decimais**.

---

## 1. Crie um novo arquivo

```bash
calculadora-decimal-loop.sh
```

---

## 2. Escreva o código

```bash
#!/bin/bash

echo "=== Calculadora Interativa Decimal ==="

while true; do
    # Captura dos números
    read -p "Digite o primeiro número (ou 'sair' para encerrar): " num1
    if [[ $num1 == "sair" ]]; then
        echo "Encerrando a calculadora. Até logo!"
        exit 0
    fi

    read -p "Digite o segundo número: " num2

    # Escolha da operação
    echo "Escolha a operação:"
    echo "1 - Soma (+)"
    echo "2 - Subtração (-)"
    echo "3 - Multiplicação (*)"
    echo "4 - Divisão (/)"
    echo "5 - Potência (^)"
    echo "6 - Módulo (%)"
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
            if [[ $num2 == 0 ]]; then
                echo "Erro: divisão por zero não é permitida."
                continue
            fi
            resultado=$(echo "scale=2; $num1 / $num2" | bc)
            simbolo="/"
            ;;
        5)
            resultado=$(echo "$num1 ^ $num2" | bc)
            simbolo="^"
            ;;
        6)
            resultado=$(echo "$num1 % $num2" | bc)
            simbolo="%"
            ;;
        *)
            echo "Operação inválida! Tente novamente."
            continue
            ;;
    esac

    # Exibindo resultado
    echo -e "\nResultado: $num1 $simbolo $num2 = $resultado"
    echo "-------------------------------"
done
```

---

## 3. Dê permissão de execução

```bash
chmod +x calculadora-decimal-loop.sh
```

---

## 4. Execute o script

```bash
./calculadora-decimal-loop.sh
```

---

## 5. Funcionamento

* O usuário pode digitar dois números decimais.
* Escolher uma operação entre `+`, `-`, `*`, `/`, `^` ou `%`.
* O resultado é exibido.
* O script volta para o menu principal automaticamente.
* Para **sair**, basta digitar `sair` no primeiro número.

---

### 📌 Observações

* Usamos **`bc`** para cálculos decimais.
* `scale=2` define duas casas decimais nas divisões.
* O loop `while true` mantém a calculadora ativa até o usuário decidir encerrar.
* Há **validação de entrada** para divisão por zero e operações inválidas.

---

🎉 **Parabéns!**
Agora você possui uma **calculadora decimal interativa avançada** em Shell Script, capaz de fazer múltiplas operações de forma contínua e segura.

---

