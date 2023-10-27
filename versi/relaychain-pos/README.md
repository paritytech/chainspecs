# Command to generate chainspec:

Run following script to generate chainspec.json:

Important note: Westend based chainspecs ids must start by the `westend` string.

# 1.a generate base chainspec

    DOCKER_IMAGE=***
    EPOCH_DURATION_IN_BLOCKS=***
    CHAIN_NAME=westend-staging
    ../relaychain/generate-chainspec-with-fast-rococo.sh

# 2. Merge chainspec-westend-staging-plain.json and versi-override.json

    jq  -s '.[0] * .[1]' chainspec-westend-staging-plain.json versi-override.json > ./chainspec-plain.json

# 3. Convert to raw

    docker run --rm -v $(pwd):/dir:z -w /dir $DOCKER_IMAGE build-spec --chain /dir/chainspec-plain.json --raw  > ./chainspec.json
