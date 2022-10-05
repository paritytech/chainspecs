# Command to generate chainspec:
Wococo should have session 10 min, but this changes are not ready yet: 
https://github.com/paritytech/polkadot/pull/6007
```
# Generate keys and accounts
export SECRET= # seed 
export PREFIX=wococo-pos-bootnode-
./prepare-test-net.sh 4 > ./wococo-override.json

# generate base chainspec  
docker run --rm -v $(pwd):/dir -w /dir paritypr/polkadot-debug:6007-96c59625 build-spec --chain wococo-local  > ./wococo-source.json

# override accounts and keys
jq  -s '.[0] * .[1]'  wococo-source.json wococo-override.json  > ./chainspec-nonraw.json

# jq  will write numbers in compact way with 1e+18, substrtate json parser dont support it. 
sed 's/1e+18/1000000000000000000/' -i ./chainspec-nonraw.json

#
# Update bootnodes 
#

# convert to raw 
docker run --rm -v $(pwd):/dir -w /dir  paritypr/polkadot-debug:6007-96c59625 build-spec --chain /dir/chainspec-nonraw.json --raw  > ./chainspec.json

# Remove unused files
rm wococo-source.json wococo-override.json
```