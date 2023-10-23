# Command to generate chainspec:

Run following script to generate chainspec.json:

# 1.a generate base chainspec

    DOCKER_IMAGE=***
    EPOCH_DURATION_IN_BLOCKS=***
    ./generate-chainspec-with-fast-rococo.sh

# 1.b generate overrides (if not already present)

    SUDO_SEED=***
    DERIVATION_ROOT_SEED=***
    ./generate-override.sh 8 > ./versi-override.json

# 2. Merge chainspec-rococo-staging-plain.json and versi-override.json

    jq  -s '.[0] * .[1]' chainspec-rococo-staging-plain.json versi-override.json | sed 's/1e+18/1000000000000000000/' > ./chainspec-plain.json

# 3. Convert to raw 

    docker run --rm -v $(pwd):/dir:z -w /dir $DOCKER_IMAGE build-spec --chain /dir/chainspec-plain.json --raw  > ./chainspec.json
