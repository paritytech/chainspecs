# Command to generate chainspec:

 1. Run following script to generate chainspec.json:

    DOCKER_IMAGE=docker.io/paritypr/polkadot-debug:6664

# 1. generate base chainspec

    docker run $DOCKsER_IMAGE build-spec --chain buenos-staging  > ./buenos-base.json

# 2. Merge buenos-base.json and buenos-override.json

    jq  -s '.[0] * .[1]'  buenos-base.json buenos-override.json | sed 's/1e+18/1000000000000000000/' > ./chainspec-nonraw.json

# 3. Convert to raw 

    docker run --rm -v $(pwd):/dir:z -w /dir $DOCKER_IMAGE build-spec --chain /dir/chainspec-nonraw.json --raw  > ./chainspec.json

# 4. Clean up

    rm buenos-base.json
