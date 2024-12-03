#!/usr/bin/env bash
set -e
###
# Script to generate chainspec with keys.
###

NAME="westend-penpal"
BASE_CHAIN="penpal-westend-2042"
IMAGE=parity/polkadot-parachain:1.16.0
LAST_COLLATOR=1 # starting from 0
DOMAIN=parity-testnet.parity.io

DOCKER_CMD="docker run -i -v $(pwd):/dir -w /dir $IMAGE"
keys_file=${NAME}_nodekey.yml

generate_address() {
  subkey inspect --scheme ${2} "$1" | grep "SS58 Address" | awk '{ print $3 }'
}
update_json(){
  cat <<< $(jq "$1+=$2" $3) > $3
}

SEED=$(subkey generate --output-type=json | jq -r .secretPhrase)
echo "${NAME}_collator_root_seed: $SEED" | sed 's/-/_/g' > ${keys_file}

echo -e "IMAGE=$IMAGE\nBASE_CHAIN=$BASE_CHAIN" > info.txt
echo '{}' > override.json
for i in `seq 0 $LAST_COLLATOR`; do
  HOSTNAME=$NAME-node-${i}
  NODEID_KEY=$(subkey generate-node-key)
  echo "${NAME}_collator_nodekey_${i}: $NODEID_KEY" | sed 's/-/_/g' >> ${keys_file}
  ID=$(subkey inspect-node-key --file <( echo -n $NODEID_KEY ))
  update_json .bootNodes "[\"/dns/${HOSTNAME}.${DOMAIN}/tcp/443/wss/p2p/${ID}\"]" override.json
  STASH=$(generate_address "${SEED}//collator//$HOSTNAME" sr25519)
  echo "AUTHORITY=$STASH" >> info.txt
  update_json .genesis.runtimeGenesis.patch.collatorSelection.invulnerables "[\"${STASH}\"]" override.json
  update_json .genesis.runtimeGenesis.patch.session.keys "[[\"${STASH}\",\"${STASH}\",{\"aura\": \"${STASH}\"}]]"  override.json
done

$DOCKER_CMD build-spec --chain $BASE_CHAIN > base.json

jq  -s '.[0] * .[1] ' base.json override.json | sed 's/1e+18/1000000000000000000/'  >  plain.json

$DOCKER_CMD  build-spec --chain plain.json --raw  >  chainspec.json

