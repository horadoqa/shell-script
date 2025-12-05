# Operadores

No Bash, dentro de **condições numéricas**, usamos operadores como `-gt`, `-lt`, `-eq` etc.
Essas siglas são **abreviações de palavras em inglês** e servem para comparar números inteiros.

Aqui está uma descrição detalhada:

| Operador | Significado                       | Exemplo         | Explicação                                   |
| -------- | --------------------------------- | --------------- | -------------------------------------------- |
| `-eq`    | equal (igual)                     | `[ $a -eq $b ]` | Verdadeiro se `$a` for igual a `$b`          |
| `-ne`    | not equal (diferente)             | `[ $a -ne $b ]` | Verdadeiro se `$a` **não** for igual a `$b`  |
| `-gt`    | greater than (maior que)          | `[ $a -gt $b ]` | Verdadeiro se `$a` for maior que `$b`        |
| `-ge`    | greater or equal (maior ou igual) | `[ $a -ge $b ]` | Verdadeiro se `$a` for maior ou igual a `$b` |
| `-lt`    | less than (menor que)             | `[ $a -lt $b ]` | Verdadeiro se `$a` for menor que `$b`        |
| `-le`    | less or equal (menor ou igual)    | `[ $a -le $b ]` | Verdadeiro se `$a` for menor ou igual a `$b` |

---

### Exemplo prático com `-gt`:

```bash
#!/bin/bash

a=10
b=5

if [ $a -gt $b ]; then
    echo "$a é maior que $b"
else
    echo "$a não é maior que $b"
fi
```

**Saída:**

```
10 é maior que 5
```

---

💡 **Dica:**
Esses operadores são **apenas para números inteiros**. Para decimais, você precisa usar `bc` ou expressões com `awk`.


