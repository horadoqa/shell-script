# Loops em Shell Script

Neste guia, você vai aprender a usar **loops** no Bash para repetir comandos várias vezes, percorrer listas ou executar tarefas automaticamente.

Existem principalmente três tipos de loops no Bash:

1. **for**
2. **while**
3. **until**

---

## 1. Criando um novo arquivo

Vamos criar um arquivo chamado:

```bash
loops.sh
```

---

## 2. Loop **for**

O loop `for` percorre uma lista de valores ou números.

### Exemplo 1 – Números de 1 a 5

```bash
#!/bin/bash

echo "Loop for: números de 1 a 5"

for i in {1..5}; do
    echo "Número $i"
done
```

**Saída:**

```
Número 1
Número 2
Número 3
Número 4
Número 5
```

### Exemplo 2 – Percorrendo uma lista de nomes

```bash
#!/bin/bash

nomes=("Maria" "João" "Ana")

for nome in "${nomes[@]}"; do
    echo "Olá, $nome!"
done
```

**Saída:**

```
Olá, Maria!
Olá, João!
Olá, Ana!
```

---

## 3. Loop **while**

O loop `while` executa comandos enquanto uma condição for verdadeira.

### Exemplo 1 – Contador de 1 a 5

```bash
#!/bin/bash

contador=1

while [ $contador -le 5 ]; do
    echo "Contador: $contador"
    contador=$((contador + 1))
done
```

**Saída:**

```
Contador: 1
Contador: 2
Contador: 3
Contador: 4
Contador: 5
```

### Exemplo 2 – Leitura até digitar "sair"

```bash
#!/bin/bash

while true; do
    read -p "Digite algo (ou 'sair' para encerrar): " entrada
    if [[ $entrada == "sair" ]]; then
        echo "Encerrando..."
        break
    fi
    echo "Você digitou: $entrada"
done
```

---

## 4. Loop **until**

O loop `until` é o inverso do `while`: ele executa o bloco **enquanto a condição for falsa**.

### Exemplo – Contador de 1 a 5

```bash
#!/bin/bash

contador=1

until [ $contador -gt 5 ]; do
    echo "Contador: $contador"
    contador=$((contador + 1))
done
```

**Saída:**

```
Contador: 1
Contador: 2
Contador: 3
Contador: 4
Contador: 5
```

---

## 5. Comandos úteis dentro de loops

* `break` → encerra o loop imediatamente.
* `continue` → pula a iteração atual e continua com a próxima.
* Loops podem ser **aninhados** para criar comportamentos mais complexos.

---

## 6. Dê permissão de execução

```bash
chmod +x loops.sh
```

---

## 7. Execute o script

```bash
./loops.sh
```

---

🎉 **Parabéns!**

Agora você conhece os três tipos principais de loops no Bash (`for`, `while`, `until`) e pode:

* Repetir tarefas automaticamente
* Ler entradas do usuário em repetição
* Criar scripts mais dinâmicos e inteligentes

---
