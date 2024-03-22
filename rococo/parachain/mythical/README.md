# WARNING: This is not final chainspec 
# Command to generate chainspec:
`
 1. Run following script to generate chainspec.json:
```
DOCKER_IMAGE=mythicalgamesengineering/parity:v1.8.0-testnet

# 1. generate base chainspec  
docker run mythicalgamesengineering/parity:v1.8.0-testnet /usr/bin/mythos-node build-spec --chain muse  > ./mythical-base.json

# 2. Merge mythical-base.json and mythical-override.json
jq  -s '.[0] * .[1]'  mythical-base.json mythical-override.json | sed 's/1.5e+26/150000000000000000000000000/'  | sed 's/1e+21/1000000000000000000000   /' > ./chainspec-nonraw.json

# 3. Convert to raw 
docker run --rm -v $(pwd):/dir -w /dir  $DOCKER_IMAGE  /usr/bin/mythos-node   build-spec --chain /dir/chainspec-nonraw.json --raw  > ./chainspec.json

# 4. Clean up
rm mythical-base.json
```
