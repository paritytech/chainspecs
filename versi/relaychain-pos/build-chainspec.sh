#!/bin/bash
TAG=master-91c4360c

DOCKER_IMAGE="docker.io/paritypr/polkadot-debug:$TAG"
echo $DOCKER_IMAGE
docker run $DOCKER_IMAGE  build-spec --chain westend-staging  > ./versi-base.json

# Merge versi-base.json and versi-override.json + Temporary workaround: patch id to `westend`
jq  -s '.[0] * .[1]'  versi-base.json versi-override.json | jq '.id = "westend"' | sed 's/1e+18/1000000000000000000/' > ./chainspec-plain.json

# Convert to raw chainspec
docker run --rm -v $(pwd):/dir:z -w /dir $DOCKER_IMAGE build-spec --chain /dir/chainspec-plain.json --raw  > ./chainspec.json

# Temporary workaround: patch id back to `versi_pos`
echo "$(jq '.id = "versi_pos"' chainspec.json)" > chainspec.json

# Clean up
rm versi-base.json
