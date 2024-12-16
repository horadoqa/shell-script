# Shell script é

É um tipo de arquivo de texto que contém uma sequência de comandos a serem executados pelo *shell* (interprete de comandos) de um sistema operacional, como o *Bash* no Linux ou macOS. Esses comandos podem ser usados para automatizar tarefas repetitivas ou complexas, como a execução de programas, manipulação de arquivos, administração de sistemas e controle de processos.

Um shell script é basicamente um programa de computador simples, escrito em uma linguagem de script, que é interpretado e executado pelo shell. Ele pode conter:

1. **Comandos do sistema**: Comandos comuns usados no terminal, como `ls`, `cp`, `rm`, etc.
2. **Estruturas de controle**: Condições (`if`, `else`), loops (`for`, `while`), etc.
3. **Funções**: Blocos de código reutilizáveis.
4. **Variáveis**: Armazenamento de dados temporários durante a execução.

### Exemplo simples de shell script (em Bash):

```bash
#!/bin/bash
# Este é um comentário

# Exibe a data e hora atuais
echo "A data e hora atual são: $(date)"

# Cria um diretório
mkdir novo_diretorio

# Navega até o novo diretório
cd novo_diretorio

# Cria um arquivo de texto
echo "Olá, mundo!" > arquivo.txt
```

### Como executar um shell script:
1. Salve o arquivo com a extensão `.sh`, por exemplo, `script.sh`.
2. Torne o script executável com o comando:
   ```bash
   chmod +x script.sh
   ```
3. Execute o script com:
   ```bash
   ./script.sh
   ```

Shell scripts são amplamente usados em administração de sistemas, desenvolvimento de software e automação de tarefas em servidores e ambientes Unix-like.
