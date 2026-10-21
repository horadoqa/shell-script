#!/bin/bash

while read p; do
  userId=$p
  curl --location --request GET https://serverest.dev/usuarios/$userId
done <ids.txt