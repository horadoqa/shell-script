while true; do
  TOTAL=$(curl -s https://serverest.dev/usuarios | jq -r '.quantidade')
  echo $TOTAL
  sleep 60
done