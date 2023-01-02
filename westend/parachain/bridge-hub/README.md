# Command to generate chainspec:
`
 1. Run following script to generate chainspec.json [PR](https://github.com/paritytech/cumulus/pull/2051):
```
DOCKER_IMAGE=paritypr/polkadot-parachain-debug:2051-8d5cc119

# 1. generate chainspec  
docker run $DOCKER_IMAGE  build-spec --chain bridge-hub-westend  > ./chainspec.json
```
