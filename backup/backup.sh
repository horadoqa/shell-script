#!/bin/bash

SOURCE="caminho do diretório original"
DESTINATION="caminho onse ficará o diretório"

cp -r $SOURCE $DESTINATION

echo "Backup cpncçuído em $(date)"

# Tornando o arquivo executável
# chmod +x backup.sh

# Agendando backup
# crontab -e 02*** <caminho do arquivo backup.sh>
