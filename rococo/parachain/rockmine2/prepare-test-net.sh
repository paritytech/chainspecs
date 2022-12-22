#!/usr/bin/env bash
set -e
###
# Script to generate part of chainspec with keys and accounts.
###


if [ "$#" -ne 1 ]; then
	echo "Please provide the number of initial validators!"
	echo "Usage:"
	echo "export VALIDATORS_ROOT_SEED= #base seed to derive from"
	echo " $0 4 "
	exit 1
fi

PREFIX=rococo-rockmine2-collator-node-

generate_address() {
	subkey inspect "$VALIDATORS_ROOT_SEED//collator//$PREFIX$1" | grep "SS58 Address" | awk '{ print $3 }'
}


V_NUM=$(($1 - 1))
BOOTNODES='\"bootNodes\": [\n'
BOOTNODES_KEY_LIST=''
BALANCES='\"balances\":\n {"balances": [\n'
INVULNERABLES='"invulnerables": [\n'
SESSION='"session": {\n   "keys": [\n'

SUDO_ADDRESS=$(subkey inspect "$VALIDATORS_ROOT_SEED" | grep "SS58 Address" | awk '{ print $3 }')
BALANCES+="  [\"${SUDO_ADDRESS}\", 1000000000000000000]\n"

for i in $(seq 0 $V_NUM); do
  if [ $i -eq $V_NUM ]
  then
    LAST=""
  else
    LAST=','
  fi

  NODEID_KEY=$(subkey generate-node-key)
  NODEID=$(subkey inspect-node-key --file <( echo -n $NODEID_KEY ))
  BOOTNODES_KEY_LIST+="${PREFIX}nodekey-${i}: ${NODEID_KEY}\n"
  BOOTNODES+="\"/dns/${PREFIX}${i}.parity-testnet.parity.io/tcp/30333/p2p/${NODEID}\"${LAST}"

  STASH=$(generate_address $i)
  INVULNERABLES+="  \"${STASH}\"${LAST}\n"

	SESSION+="[\n"
	SESSION+="  \"${STASH}\",\n"
	SESSION+="  \"${STASH}\",\n"
	SESSION+="  {\n"
	SESSION+="    \"aura\": \"${STASH}\"\n"
	SESSION+="  }\n]${LAST}\n"
done
BALANCES+="]}"
SESSION+='  ]\n}\n'
INVULNERABLES+="]"
BOOTNODES+="]"

CHAINSPEC='{
  "name": "Rockmine2",
  "id": "statemine-rococo2",
  '"${BOOTNODES}"',
  "properties": {
    "tokenDecimals": 12,
    "tokenSymbol": "ROC"
  },
  "relay_chain": "rococo",
  "para_id": 1004,
  "genesis": {
    "runtime": {
      '"${BALANCES}"',
      "parachainInfo": {
        "parachainId": 1004
      },
      "collatorSelection": {
        '"${INVULNERABLES}"'
      },
      '"${SESSION}"'
    }
  }
}
'

printf "$CHAINSPEC" | jq | sed 's/1e+18/1000000000000000000/' > ./rockmine2-override.json
printf "${BOOTNODES_KEY_LIST}" | sed 's/-/_/g' > ./rockmine2_nodekey.yml