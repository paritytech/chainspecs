# Command to generate chainspec:
`
 1. Run following script to generate chainspec.json:
```
DOCKER_IMAGE=harbor.parity-mgmt.parity.io/parity-internal/mythical-node:main-296e03cb

# 1. generate base chainspec  
docker run $DOCKER_IMAGE /usr/bin/mythical-node build-spec --chain mainnet-dev  > ./mythical-base.json

# 2. Merge mythical-base.json and mythical-override.json
jq  -s '.[0] * .[1]'  mythical-base.json mythical-override.json | sed 's/1.6e+17/160000000000000000/' > ./chainspec-nonraw.json

# 3. Convert to raw 
docker run --rm -v $(pwd):/dir -w /dir  $DOCKER_IMAGE  /usr/bin/mythical-node   build-spec --chain /dir/chainspec-nonraw.json --raw  > ./chainspec.json

# 4. Clean up
rm mythical-base.json
```
