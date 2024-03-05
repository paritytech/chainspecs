#!/bin/bash -eu
set -ex
# Original author: @michalkucharczyk
# Taken from https://raw.githubusercontent.com/paritytech/polkadot-sdk/d55ae688a8d0769966a125fde2f0dd6cc7f8e762/polkadot/scripts/update-chain-spec-with-fast-rococo.sh
# Sample script showing how to update the chain-spec 'code' field with the pre-built rococo runtime blob with
# non-standard epoch duration.

CURRENT_DIR=$(pwd)
CHAIN_NAME="${CHAIN_NAME:-rococo-staging}"
DOCKER_IMAGE="${DOCKER_IMAGE:-paritypr/polkadot-debug:master-a71f018c}"
EPOCH_DURATION_IN_BLOCKS="${EPOCH_DURATION_IN_BLOCKS:-100}"

if [ -z $DOCKER_IMAGE ]; then
  usage
fi

OUTPUT_ROOT_DIR=exported-runtimes/

# polkadot command:
POLKADOT_CMD="docker run --rm -v $CURRENT_DIR:/dir -w /dir $DOCKER_IMAGE"

# extract rococo runtime with adjusted epoch diration from docker image
docker export $(docker create $DOCKER_IMAGE) | \
  tar --transform="s|polkadot/runtimes/|$OUTPUT_ROOT_DIR/|" -xf - polkadot/runtimes/rococo-runtime-$EPOCH_DURATION_IN_BLOCKS/rococo_runtime.wasm

# path to extracted rococo runtime:
WASM_RUNTIME_BLOB_PATH=$OUTPUT_ROOT_DIR/rococo-runtime-$EPOCH_DURATION_IN_BLOCKS/rococo_runtime.wasm

# do hexdump of runtime:
hexdump -v -e '/1 "%02x"' $WASM_RUNTIME_BLOB_PATH > $WASM_RUNTIME_BLOB_PATH.hex

# get chain spec:
$POLKADOT_CMD build-spec --chain $CHAIN_NAME > $CURRENT_DIR/chainspec-$CHAIN_NAME-source.json

# replace runtime in chainspec with newly built runtime with overwritten epoch duration:
jq --rawfile code $WASM_RUNTIME_BLOB_PATH.hex '.genesis.runtimeGenesis.code = "0x" + $code' > $CURRENT_DIR/chainspec-$CHAIN_NAME-plain.json < $CURRENT_DIR/chainspec-$CHAIN_NAME-source.json 

# jq will write numbers in compact way with 1e+18, substrate json parser dont support it.
sed 's/1e+18/1000000000000000000/' -i $CURRENT_DIR/chainspec-$CHAIN_NAME-plain.json

# generate raw
#$POLKADOT_CMD build-spec --chain ./chainspec-$CHAIN_NAME-plain.json --raw > $CURRENT_DIR/chainspec-$CHAIN_NAME-raw.json
