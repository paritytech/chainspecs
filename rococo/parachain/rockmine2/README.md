# Command to generate chainspec:
`
 1. Run following script to generate chainspec.json:
```
DOCKER_IMAGE=paritypr/polkadot-parachain-debug:master-7f9f0799

# 1. generate base chainspec  
docker run $DOCKER_IMAGE  build-spec --chain statemine-genesis  > ./rockmine2-base.json

# 2. Merge rockmine2-base.json and rockmine2-override.json
jq  -s '.[0] * .[1]'  rockmine2-base.json rockmine2-override.json | sed 's/1e+18/1000000000000000000/' > ./chainspec-nonraw.json

# 3. Convert to raw 
docker run --rm -v $(pwd):/dir -w /dir  $DOCKER_IMAGE  build-spec --chain /dir/chainspec-nonraw.json --raw  > ./chainspec.json

# 4. Clean up
rm rockmine2-base.json
```
