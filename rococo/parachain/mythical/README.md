# WARNING: This is not final chainspec 
# Command to generate chainspec:
`
 1. Run following script to generate chainspec.json:
```
DOCKER_IMAGE=mythicalgamesengineering/parity:main@sha256:3838d673d264cf8a2d7381bdebb89299e146504e66af739db2fe0d9d60f0933d

# 1. generate base chainspec  
docker run $DOCKER_IMAGE /usr/bin/mythical-node build-spec --chain muse  > ./mythical-base.json

# 2. Merge mythical-base.json and mythical-override.json
jq  -s '.[0] * .[1]'  mythical-base.json mythical-override.json | sed 's/1e+27/1000000000000000000000000000/' > ./chainspec-nonraw.json

# 3. Convert to raw 
docker run --rm -v $(pwd):/dir -w /dir  $DOCKER_IMAGE  /usr/bin/mythical-node   build-spec --chain /dir/chainspec-nonraw.json --raw  > ./chainspec.json

# 4. Clean up
rm mythical-base.json
```
