# Leitura Linha a Linha em Shell Script

### Usando `while read` para processar arquivos

Ler arquivos **linha por linha** é uma das tarefas mais comuns em Shell Script, seja para:

* processar dados
* analisar logs
* manipular listas
* automatizar importações

O método mais utilizado no Bash é:

```bash
while read linha; do
    comandos...
done < arquivo.txt
```

Este README explica todos os detalhes e boas práticas.

---

## 1. Estrutura básica

A estrutura padrão para leitura linha a linha:

```bash
while read linha; do
    echo "Linha lida: $linha"
done < arquivo.txt
```

---

## 2. Criando um arquivo de exemplo

```bash
echo -e "Maria\nJoão\nAna\nCarlos" > nomes.txt
```

Conteúdo:

```
Maria
João
Ana
Carlos
```

---

## 3. Exemplo básico de leitura

```bash
#!/bin/bash

while read nome; do
    echo "Olá, $nome!"
done < nomes.txt
```

**Saída:**

```
Olá, Maria!
Olá, João!
Olá, Ana!
Olá, Carlos!
```

---

## 4. Lendo múltiplas colunas

Exemplo de arquivo:

```
Maria 25
João 32
Ana 19
```

```bash
while read nome idade; do
    echo "$nome tem $idade anos"
done < pessoas.txt
```

---

## 5. Lendo sem perder espaços

Por padrão, o `read` remove espaços repetidos e backslashes.
Para evitar isso, use:

```bash
while IFS= read -r linha; do
    echo "$linha"
done < arquivo.txt
```

### O que significa?

| Configuração | Função                                       |
| ------------ | -------------------------------------------- |
| `IFS=`       | evita que o Bash “corte” a linha em palavras |
| `-r`         | mantém barras invertidas \ sem interpretação |
| `linha`      | variável que receberá o conteúdo             |

---

## 6. Verificando número da linha

```bash
contador=1

while IFS= read -r linha; do
    echo "Linha $contador: $linha"
    contador=$((contador + 1))
done < arquivo.txt
```

---

## 7. Testando conteúdo da linha

```bash
while IFS= read -r linha; do
    if [[ -z "$linha" ]]; then
        echo "(Linha vazia encontrada)"
    else
        echo "Conteúdo: $linha"
    fi
done < arquivo.txt
```

---

## 8. Lendo de um comando em vez de arquivo

```bash
ls -l | while read linha; do
    echo "Arquivo: $linha"
done
```

---

## 9. Lendo de uma variável multi-linha

```bash
texto="linha1
linha2
linha3"

while IFS= read -r linha; do
    echo ">> $linha"
done <<< "$texto"
```

(Observe os **três sinais de menor** `<<<`, chamados *here-string*.)

---

## 10. Lendo arquivo com nomes que contêm espaços

Exemplo: lista de músicas ou arquivos

```bash
while IFS= read -r arquivo; do
    echo "Arquivo: $arquivo"
done < lista.txt
```

---

## 11. Exemplo completo — Processando lista de tarefas

Arquivo `tarefas.txt`:

```
Comprar pão
Enviar relatório
Estudar Shell Script
```

Script:

```bash
#!/bin/bash

while IFS= read -r tarefa; do
    echo "Processando tarefa: $tarefa"
    sleep 1
done < tarefas.txt
```

---

## 12. Permissão de execução

```bash
chmod +x ler-arquivo.sh
```

---

## 13. Executando

```bash
./ler-arquivo.sh
```

---

## 📌 Boas práticas

* Sempre use **`IFS= read -r`** para preservar a linha original.
* Evite usar `cat arquivo | while read …` (subshell).
* Use `< arquivo` ou `<<< "$variavel"`.

---

🎉 **Parabéns!**
Agora você sabe como ler arquivos **linha por linha** usando `while read`, uma das técnicas mais úteis no Shell Script.


