set -eu

# Set $DERIVATION_ROOT_SEED in shell
START_INDEX=1300
PARA_COUNT=100
STOP_INDEX=$((START_INDEX + PARA_COUNT))
PARA_NAME="versi-glutton-collator"

cat <<EOF
{
  "genesis": {
    "runtime": {
      "session": {
        "keys": [
EOF

for ((i=$START_INDEX;i<=$STOP_INDEX;i++)); do
  NODE_0_AURA=`subkey inspect "${DERIVATION_ROOT_SEED}//collator//${PARA_NAME}-${START_INDEX}-node-0" --output-type json | jq -r .ss58Address`
  NODE_1_AURA=`subkey inspect "${DERIVATION_ROOT_SEED}//collator//${PARA_NAME}-${START_INDEX}-node-1" --output-type json | jq -r .ss58Address`
  cat <<EOF
[
  "${NODE_0_AURA}",
  "${NODE_0_AURA}",
  {
    "aura": "${NODE_0_AURA}"
  }
],
[
  "${NODE_1_AURA}",
  "${NODE_1_AURA}",
  {
    "aura": "${NODE_1_AURA}"
  }
],
EOF
done

cat <<EOF

        ]
      }
    }
  }
}
EOF