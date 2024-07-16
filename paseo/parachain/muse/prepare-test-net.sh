#!/usr/bin/env bash
set -e
###
# Script to generate part of chainspec with keys and accounts.
###



COLLATOR_ROOT_SEED=$(subkey generate | grep 'Secret phrase'| cut -d '`' -f2)
PREFIX=paseo-muse-collator-node-

generate_address() {
	subkey inspect  "$COLLATOR_ROOT_SEED//collator//$PREFIX$1" | grep "SS58 Address" | awk '{ print $3 }'
}


V_NUM=1 # 2 collators
BOOTNODES='\"bootNodes\": [\n'
BOOTNODES_KEY_LIST="${PREFIX}root-seed: $COLLATOR_ROOT_SEED\n"
INVULNERABLES='"invulnerables": [\n'
SESSION='"session": {\n   "keys": [\n'

for i in $(seq 0 $V_NUM); do
  if [ $i -eq $V_NUM ]
  then
    LAST=""
  else
    LAST=','
  fi

  NODEID_KEY=$(subkey generate-node-key)
  NODEID=$(subkey inspect-node-key --file <( echo -n $NODEID_KEY ))
  BOOTNODES_KEY_LIST+="# ${NODEID}\n${PREFIX}nodekey-${i}: ${NODEID_KEY}\n"
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
SESSION+='  ]\n}\n'
INVULNERABLES+="]"
BOOTNODES+="]"

CHAINSPEC='{
  '"${BOOTNODES}"',
  "relay_chain": "rococo",
  "genesis": {
    "runtimeGenesis": {
      "collatorSelection": {
        '"${INVULNERABLES}"'
      },
      '"${SESSION}"'
    }
  }
}
'

printf "$CHAINSPEC" | jq > ./muse-override.json
printf "${BOOTNODES_KEY_LIST}" | sed 's/-/_/g' > ./muse_nodekey.yml