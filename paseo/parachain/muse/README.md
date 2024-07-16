
# Command to generate chainspec:
`
 1. Run following script to generate chainspec.json:
```
DOCKER_IMAGE=mythicalgamesengineering/parity:v1.13.2

# 1. generate base chainspec  
docker run $DOCKER_IMAGE /usr/bin/mythos-node build-spec --chain muse  > ./muse-base.json

# 2. Merge muse-base.json and muse-override.json
jq  -s '.[0] * .[1]'  muse-base.json muse-override.json | sed 's/1.5e+26/150000000000000000000000000/'  | sed 's/1e+21/1000000000000000000000/' | sed 's/1e+20/100000000000000000000/'  > ./chainspec-nonraw.json

# 3. Convert to raw 
docker run --rm -v $(pwd):/dir -w /dir  $DOCKER_IMAGE  /usr/bin/mythos-node   build-spec --chain /dir/chainspec-nonraw.json --raw  > ./chainspec.json

# 4. Clean up
rm muse-base.json

docker run --rm -v $(pwd):/dir -w /dir  $DOCKER_IMAGE  /usr/bin/mythos-node export-genesis-state --chain /dir/chainspec-nonraw.json > ./genesis-state
docker run --rm -v $(pwd):/dir -w /dir  $DOCKER_IMAGE  /usr/bin/mythos-node export-genesis-wasm  --chain /dir/chainspec-nonraw.json > ./genesis-wasm
```
