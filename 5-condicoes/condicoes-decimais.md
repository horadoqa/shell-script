# Operações com Números Decimais em Shell Script usando `bc`

O Bash **não suporta cálculos com números decimais nativamente**, apenas inteiros.
Por isso, para realizar operações como:

* soma com casas decimais
* subtração
* multiplicação
* divisão com precisão
* comparação entre números decimais

…precisamos usar uma ferramenta externa chamada **`bc`**.

---

## 📌 O que é `bc`?

`bc` (Basic Calculator) é uma calculadora de precisão arbitrária disponível na maioria das distribuições Linux.
Ela permite fazer operações matemáticas com decimais e até funções avançadas, como:

* potência
* raízes
* escala (número de casas decimais)

---

## 1. Criando um arquivo

```bash
operacoes-decimais.sh
```

---

## 2. Escrevendo o script

Aqui estão exemplos completos de como usar `bc` para cálculos decimais.

---

## 🧮 2.1 Soma com decimais

```bash
#!/bin/bash

a=5.5
b=2.3

resultado=$(echo "$a + $b" | bc -l)
echo "Resultado da soma: $resultado"
```

**Saída:**

```
Resultado da soma: 7.8
```

---

## ➖ 2.2 Subtração

```bash
resultado=$(echo "$a - $b" | bc -l)
echo "Resultado da subtração: $resultado"
```

**Saída:**

```
Resultado da subtração: 3.2
```

---

## ✖️ 2.3 Multiplicação

```bash
resultado=$(echo "$a * $b" | bc -l)
echo "Resultado da multiplicação: $resultado"
```

**Saída:**

```
Resultado da multiplicação: 12.65
```

---

## ➗ 2.4 Divisão com precisão

Você pode definir quantas casas decimais quer com o parâmetro `scale`.

```bash
resultado=$(echo "scale=4; $a / $b" | bc -l)
echo "Resultado da divisão: $resultado"
```

**Saída:**

```
Resultado da divisão: 2.3913
```

---

## 3. Comparação de números decimais

O Bash não compara floats diretamente, então usamos `bc` para retornar 1 (verdadeiro) ou 0 (falso).

---

### 🔍 3.1 Maior que

```bash
if (( $(echo "$a > $b" | bc -l) )); then
    echo "$a é maior que $b"
fi
```

---

### 🔍 3.2 Menor que

```bash
if (( $(echo "$a < $b" | bc -l) )); then
    echo "$a é menor que $b"
fi
```

---

### 🔍 3.3 Igual

```bash
if (( $(echo "$a == $b" | bc -l) )); then
    echo "$a é igual a $b"
fi
```

---

## 4. Exemplo completo — Mini calculadora com decimais

```bash
#!/bin/bash

read -p "Digite o primeiro número: " n1
read -p "Digite o segundo número: " n2

echo "Escolha a operação:"
echo "1 - Soma"
echo "2 - Subtração"
echo "3 - Multiplicação"
echo "4 - Divisão"
read -p "Opção: " op

case $op in
    1) resultado=$(echo "$n1 + $n2" | bc -l) ;;
    2) resultado=$(echo "$n1 - $n2" | bc -l) ;;
    3) resultado=$(echo "$n1 * $n2" | bc -l) ;;
    4) resultado=$(echo "scale=4; $n1 / $n2" | bc -l) ;;
    *) echo "Opção inválida!"; exit ;;
esac

echo "Resultado: $resultado"
```

---

## 5. Dê permissão de execução

```bash
chmod +x operacoes-decimais.sh
```

---

## 6. Execute o script

```bash
./operacoes-decimais.sh
```

---

## 📌 Observações importantes

* `-l` ativa precisão estendida no `bc`.

* `scale=X` define quantas casas decimais usar.

* Para comparar decimais, sempre use:

  ```bash
  (( $(echo "expressao" | bc -l) ))
  ```

* Sem `bc`, o Bash **não** calcula nada com ponto decimal.

---

🎉 **Parabéns!**
Agora você sabe como manipular **números decimais no Shell Script** usando a ferramenta `bc`.

