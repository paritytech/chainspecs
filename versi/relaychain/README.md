# Command to generate chainspec:
`
 1. Run following script to generate chainspec.json:
```
DOCKER_IMAGE=docker.io/paritypr/polkadot-debug:5635-b2cb08a1

# 1. generate base chainspec  
docker run $DOCKER_IMAGE  build-spec --chain versi-staging  > ./versi-base.json

# 2. Merge versi-base.json and versi-override.json
jq  -s '.[0] * .[1]'  versi-base.json versi-override.json | sed 's/1e+18/1000000000000000000/' > ./chainspec-nonraw.json

# 3. Convert to raw 
docker run --rm -v $(pwd):/dir -w /dir  $DOCKER_IMAGE  build-spec --chain /dir/chainspec-nonraw.json --raw  > ./chainspec.json

# 4. Clean up
rm versi-base.json

```