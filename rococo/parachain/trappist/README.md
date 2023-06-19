# Command to generate chainspec:
`
 1. Run following script to generate chainspec.json:
```
DOCKER_IMAGE=paritytech/trappist:polkadot-v0.9.37-patched-2

# 1. generate base chainspec  
docker run $DOCKER_IMAGE trappist-node build-spec --chain trappist-rococo  > ./trappist-base.json

# 2. Merge trappist-base.json and trappist-override.json
jq  -s '.[0] * .[1]'  trappist-base.json trappist-override.json | sed 's/1e+18/1000000000000000000/' | sed 's/1.5e+18/1500000000000000000/' > ./chainspec-nonraw.json

# 3. Convert to raw 
docker run --rm -v $(pwd):/dir -w /dir  $DOCKER_IMAGE trappist-node  build-spec --chain /dir/chainspec-nonraw.json --raw  > ./chainspec.json

# 4. Clean up
rm trappist-base.json
```
