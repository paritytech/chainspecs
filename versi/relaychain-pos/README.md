# Command to generate chainspec:

Run following script to generate chainspec.json:

    DOCKER_IMAGE=docker.io/paritypr/polkadot-debug:7416-abab28bd #v1.0.0

# 1. generate base chainspec

    docker run $DOCKER_IMAGE  build-spec --chain westend-staging  > ./versi-base.json

# 2. Merge versi-base.json and versi-override.json

    jq  -s '.[0] * .[1]'  versi-base.json versi-override.json | sed 's/1e+18/1000000000000000000/' > ./chainspec-plain.json

# 3. Convert to raw 

    # Temporary workaround: patch id to `westend`
    echo "$(jq '.id = "westend"' chainspec-plain.json)" > chainspec-plain.json

    docker run --rm -v $(pwd):/dir:z -w /dir $DOCKER_IMAGE build-spec --chain /dir/chainspec-plain.json --raw  > ./chainspec.json

    # Temporary workaround: patch id back to `versi_pos`
    echo "$(jq '.id = "versi_pos"' chainspec.json)" > chainspec.json

# 4. Clean up

    rm versi-base.json
