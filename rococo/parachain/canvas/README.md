# Command to generate chainspec:

```shell
docker run --rm infoparity/polkadot-collator:5.2.0 build-spec  --chain canvas-rococo  > chainspec.json
docker run --rm infoparity/polkadot-collator:5.2.0 build-spec  --chain canvas-rococo  | md5sum -
2022-04-03 19:06:26 Building chain spec    
9b44a558f324cc83d89fefe481a8ccb4  -
```