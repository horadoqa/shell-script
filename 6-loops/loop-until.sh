#!/bin/bash

contador=1

until [ $contador -gt 5 ]; do
    echo "Contador: $contador"
    contador=$((contador + 1))
done