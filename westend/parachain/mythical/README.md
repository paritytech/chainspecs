# WARNING: This is not final chainspec 
# Command to generate chainspec:
`
 1. Run following script to generate chainspec.json:
```
DOCKER_IMAGE=mythicalgamesengineering/parity:main@sha256:TODO

# 1. Chainspec is provided by developers, Convert to raw 
docker run --rm -v $(pwd):/dir -w /dir  $DOCKER_IMAGE  /usr/bin/mythical-node   build-spec --chain /dir/chainspec-nonraw.json --raw  > ./chainspec.json

```
