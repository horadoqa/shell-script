Aqui está um **README completo e didático** sobre como realizar operações e expressões matemáticas usando **`awk`** no Shell Script.

---

# Operações e Expressões com `awk` em Shell Script

O `awk` é uma das ferramentas mais poderosas no Linux para:

* cálculos com **decimais**
* manipulação de texto
* expressões lógicas
* formatação de saída

Neste guia, vamos focar no uso do `awk` para **operações matemáticas**, substituindo ou complementando o uso de `bc`.

---

## 📌 Por que usar `awk`?

Diferente do Bash, o `awk` suporta **números decimais de forma nativa** e permite:

* realizar cálculos diretamente
* definir variáveis internas
* imprimir valores formatados
* fazer comparações numéricas e textuais

Sem precisar de `bc`.

---

## 1. Criando um arquivo

```bash
expressoes-awk.sh
```

---

## 2. Exemplos básicos de operações

O `awk` usa a sintaxe:

```bash
awk 'BEGIN { expressões }'
```

### 🧮 2.1 Soma

```bash
#!/bin/bash

resultado=$(awk 'BEGIN { print 5.5 + 2.3 }')
echo "Soma: $resultado"
```

**Saída:**

```
Soma: 7.8
```

---

### ➖ 2.2 Subtração

```bash
resultado=$(awk 'BEGIN { print 10.7 - 3.2 }')
echo "Subtração: $resultado"
```

---

### ✖️ 2.3 Multiplicação

```bash
resultado=$(awk 'BEGIN { print 4.5 * 3.2 }')
echo "Multiplicação: $resultado"
```

---

### ➗ 2.4 Divisão

```bash
resultado=$(awk 'BEGIN { print 7.5 / 2.2 }')
echo "Divisão: $resultado"
```

---

## 3. Definindo variáveis no `awk`

Podemos passar variáveis do Shell para o `awk`.

### Exemplo:

```bash
num1=12.5
num2=4.2

resultado=$(awk -v a="$num1" -v b="$num2" 'BEGIN { print a + b }')
echo "Resultado: $resultado"
```

---

## 4. Comparações com `awk`

O `awk` permite comparar decimais facilmente:

### 🔍 4.1 Maior que

```bash
awk 'BEGIN { if (5.5 > 2.1) print "5.5 é maior"; }'
```

### 🔍 4.2 Menor que

```bash
awk 'BEGIN { if (3.1 < 4.8) print "3.1 é menor"; }'
```

### 🔍 4.3 Igualdade

```bash
awk 'BEGIN { if (2.5 == 2.5) print "São iguais"; }'
```

---

## 5. Formatação de números

Use `printf` dentro do `awk` para formatar casas decimais:

```bash
awk 'BEGIN { printf "%.2f\n", 10.56789 }'
```

**Saída:**

```
10.57
```

---

## 6. Expressões mais avançadas

### 📌 6.1 Potência

```bash
awk 'BEGIN { print 2 ^ 3 }'   # 2³ = 8
```

### 📌 6.2 Raiz quadrada

```bash
awk 'BEGIN { print sqrt(25) }'   # 5
```

### 📌 6.3 Valor absoluto

```bash
awk 'BEGIN { print abs(-9.3) }'
```

---

## 7. Usando `awk` em scripts interativos

Exemplo: mini calculadora com `awk`.

```bash
#!/bin/bash

read -p "Número 1: " n1
read -p "Número 2: " n2

echo "Escolha a operação:"
echo "1 - Soma"
echo "2 - Subtração"
echo "3 - Multiplicação"
echo "4 - Divisão"

read -p "Opção: " op

resultado=$(awk -v a="$n1" -v b="$n2" -v o="$op" '
BEGIN {
    if (o == 1) print a + b;
    else if (o == 2) print a - b;
    else if (o == 3) print a * b;
    else if (o == 4) print a / b;
    else print "Operação inválida";
}
')

echo "Resultado: $resultado"
```

---

## 8. Permissão de execução

```bash
chmod +x expressoes-awk.sh
```

---

## 9. Execute o script

```bash
./expressoes-awk.sh
```

---

## 📌 Observações importantes

* O `awk` **suporta decimais nativamente**, diferente do Bash.
* Use `-v` para passar variáveis externas.
* Use `printf` para formatar números.
* Expressões são escritas dentro de `BEGIN { }` quando não há arquivo de entrada.
* O `awk` também é utilizado para manipulação de arquivos

---

🎉 **Parabéns!**
Agora você sabe usar `awk` para cálculos, comparações e expressões matemáticas, tornando seus scripts Shell mais poderosos e flexíveis.

