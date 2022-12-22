# Command to generate chainspec:
`
 1. Run following script to generate chainspec.json:
```
DOCKER_IMAGE=paritypr/polkadot-parachain-debug:2013-a7dd1fcd

# 1. generate base chainspec  
docker run $DOCKER_IMAGE  build-spec --chain westmint-genesis  > ./wockmint-base.json

# 2. Merge wockmint-base.json and wockmint-override.json
jq  -s '.[0] * .[1]'  wockmint-base.json wockmint-override.json | sed 's/1e+18/1000000000000000000/' > ./chainspec-nonraw.json

# 3. Convert to raw 
docker run --rm -v $(pwd):/dir -w /dir  $DOCKER_IMAGE  build-spec --chain /dir/chainspec-nonraw.json --raw  > ./chainspec.json

# 4. Clean up
rm wockmint-base.json
```
