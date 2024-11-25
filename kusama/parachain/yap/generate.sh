set -ex

# Usage:
# export SEED=xxx
# for i in  `seq 3360 3388`; do ./generate.sh $i; done


PARAID=$1
IMAGE=docker.io/paritypr/polkadot-parachain-debug:6089-c86d6f60

BASE_DIR=../yap-$PARAID
BASE_CHAIN="yap-kusama-live-${PARAID}"
DOCKER_CMD="docker run -i -v $(pwd)/${BASE_DIR}:/dir -w /dir $IMAGE"


generate_address() {
  subkey inspect --scheme ${2} "$1" | grep "SS58 Address" | awk '{ print $3 }'
}
update_json(){
  cat <<< $(jq "$1+=$2" $3) > $3
}

mkdir -p $BASE_DIR
echo -e "PARAID=$PARAID\nIMAGE=$IMAGE\nBASE_CHAIN=$BASE_CHAIN" > $BASE_DIR/info.txt
echo '{"name": "Yap '$PARAID'","id": "yap-'$PARAID'"}' > $BASE_DIR/override1.json
last=0
for i in `seq 0 $last`; do
  HOSTNAME=kusama-yap-${PARAID}-node-${i}
  ID=$(subkey inspect-node-key --file <(cat yap_nodekey.yml | grep ${PARAID}-${i} | awk '{ print $2 }' | tr -d '\n' ))
  update_json .bootNodes "[\"/dns/${HOSTNAME}.parity-chains.parity.io/tcp/443/wss/p2p/${ID}\"]" $BASE_DIR/override1.json
  STASH=$(generate_address "${SEED}//collator//$HOSTNAME" sr25519)
  echo "AUTHORITY=$STASH" >> $BASE_DIR/info.txt
  update_json .genesis.runtimeGenesis.patch.aura.authorities "[\"${STASH}\"]" $BASE_DIR/override1.json
done

$DOCKER_CMD build-spec --chain $BASE_CHAIN > $BASE_DIR/base.json

jq  -s '.[0] * .[1] ' $BASE_DIR/base.json $BASE_DIR/override1.json | sed 's/1e+18/1000000000000000000/'  >  $BASE_DIR/plain.json

$DOCKER_CMD  build-spec --chain plain.json --raw  >  $BASE_DIR/chainspec.json

