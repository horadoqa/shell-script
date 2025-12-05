# Operações com números decimais em Shell Script

No Bash, a aritmética padrão `$(( ))` **trabalha apenas com números inteiros**.
Para trabalhar com decimais, usamos o comando `bc` (basic calculator).

---

## 1. Crie um novo arquivo

```bash
decimais.sh
```

---

## 2. Escreva o código

```bash
#!/bin/bash

# Números decimais
num1=5.5
num2=2.3

# Soma
soma=$(echo "$num1 + $num2" | bc)
echo "Soma: $num1 + $num2 = $soma"

# Subtração
subtracao=$(echo "$num1 - $num2" | bc)
echo "Subtração: $num1 - $num2 = $subtracao"

# Multiplicação
multiplicacao=$(echo "$num1 * $num2" | bc)
echo "Multiplicação: $num1 * $num2 = $multiplicacao"

# Divisão com 2 casas decimais
divisao=$(echo "scale=2; $num1 / $num2" | bc)
echo "Divisão: $num1 / $num2 = $divisao"
```

---

## 3. Dê permissão de execução

```bash
chmod +x decimais.sh
```

---

## 4. Execute o script

```bash
./decimais.sh
```

Saída esperada:

```
Soma: 5.5 + 2.3 = 7.8
Subtração: 5.5 - 2.3 = 3.2
Multiplicação: 5.5 * 2.3 = 12.65
Divisão: 5.5 / 2.3 = 2.39
```

---

### 📌 Observações

* **`bc`** é usado para cálculos com decimais.
* `scale=2` define a quantidade de casas decimais.
* Você pode fazer **qualquer operação matemática** suportada pelo `bc`, incluindo potência e funções trigonométricas.

---

