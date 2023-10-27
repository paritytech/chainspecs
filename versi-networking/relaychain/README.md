# Command to generate chainspec:

Run following script to generate chainspec.json:

# 1. generate base chainspec

    DOCKER_IMAGE=*** # Optional
    EPOCH_DURATION_IN_BLOCKS=*** # Optional
    ../../versi/relaychain/generate-chainspec-with-fast-rococo.sh

# 2. Merge chainspec-rococo-staging-plain.json and versi-networking-override.json

    jq  -s '.[0] * .[1]' chainspec-rococo-staging-plain.json versi-networking-override.json | sed 's/1e+18/1000000000000000000/' > ./chainspec-plain.json

# 3. Convert to raw 

    docker run --rm -v $(pwd):/dir:z -w /dir $DOCKER_IMAGE build-spec --chain /dir/chainspec-plain.json --raw  > ./chainspec.json
