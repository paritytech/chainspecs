# Command to generate chainspec:
Wococo is same as westend but session is 10 min:
https://github.com/paritytech/polkadot/pull/6953
```
# Generate keys and accounts
export SUDO_SEED= # seed 
export VALIDATORS_ROOT_SEED= #base seed to derive from
export PREFIX=wococo-pos-bootnode-
./prepare-test-net.sh 4 > ./wococo-override.json

# generate base chainspec  
DOCKER_IMAGE=paritypr/polkadot-debug:6953-7f8af13c

docker run --rm -v $(pwd):/dir -w /dir $DOCKER_IMAGE  build-spec --chain westend-staging  > ./wococo-source.json

# override accounts and keys
jq  -s '.[0] * .[1]'  wococo-source.json wococo-override.json  > ./chainspec-nonraw.json

# jq  will write numbers in compact way with 1e+18, substrtate json parser dont support it. 
sed 's/1e+18/1000000000000000000/' -i ./chainspec-nonraw.json

#
# Update bootnodes, telemetryEndpoints
#

# convert to raw 
docker run --rm -v $(pwd):/dir -w /dir  $DOCKER_IMAGE build-spec --chain /dir/chainspec-nonraw.json --raw  > ./chainspec.json

#
# Update id
#

# Remove unused files
rm wococo-source.json
```