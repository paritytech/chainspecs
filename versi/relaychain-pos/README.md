# Command to generate chainspec:

Run following script to generate chainspec.json:

    DOCKER_IMAGE=docker.io/parity/polkadot:v0.9.42

# 1. generate base chainspec

    docker run $DOCKER_IMAGE  build-spec --chain westend-staging  > ./versi-base.json

# 2. Merge versi-base.json and versi-override.json

    jq  -s '.[0] * .[1]'  versi-base.json versi-override.json | sed 's/1e+18/1000000000000000000/' > ./chainspec-nonraw.json

# 3. Convert to raw 

    docker run --rm -v $(pwd):/dir:z -w /dir $DOCKER_IMAGE build-spec --chain /dir/chainspec-nonraw.json --raw  > ./chainspec.json

# 4. Clean up

    rm versi-base.json
