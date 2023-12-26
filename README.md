# Collection of Chain Specification
[https://paritytech.github.io/chainspecs](https://paritytech.github.io/chainspecs/)

A chain specification, or "chainspec", is a collection of configuration information that dictates which network a blockchain node will connect to, which entities it will initially communicate with, and what consensus-critical state it must have at genesis.

## Usage 
You can download chainspec and save it as `chainspec.json` file, then start the substrate node with the `--chain ./chainspec.json` flag.

> Note: for some nodes, you may save chainspec with a different name [see](https://github.com/PureStake/moonbeam/issues/1104#issuecomment-996787548)

> Note: for production, it is better to use chainspec provided in binary, ( example: `--chain kusama`) this repo is designed for test networks that reset often.

# List of Chainspecs
### Polkadot
- [Polkadot](polkadot/relaychain/chainspec.json)
- [Polkadot AssetHub](polkadot/parachain/asset-hub/chainspec.json)
- [Polkadot BridgeHub](polkadot/parachain/bridge-hub/chainspec.json)
- [Polkadot Collectives](polkadot/parachain/collectives/chainspec.json)

### Kusama
- [Kusama](kusama/relaychain/chainspec.json)
- [Kusama AssetHub](kusama/parachain/asset-hub/chainspec.json)
- [Kusama BridgeHub](kusama/parachain/bridge-hub/chainspec.json)

### Rococo
- [Rococo](rococo/relaychain/chainspec.json)
- [Rococo Rockmine](rococo/parachain/rockmine/chainspec.json)
- [Rococo adz](rococo/parachain/adz/chainspec.json)
- [Rococo Contracts](rococo/parachain/contracts/chainspec.json)
- [Rococo Moonbase](rococo/parachain/moonbase/chainspec.json)
- [Rococo Bridge-Hub](rococo/parachain/bridge-hub/chainspec.json)

### Westend
- [Westend](westend/relaychain/chainspec.json)
- [Westend AssetHub](westend/parachain/asset-hub/chainspec.json)
- [Westend BridgeHub](westend/parachain/bridge-hub/chainspec.json)
- [Westend Collectives](westend/parachain/westend-collectives/chainspec.json)

### Wococo
- [Wococo](wococo/relaychain/chainspec.json)
- [Wococo BridgeHub](wococo/parachain/bridge-hub/chainspec.json)
- [Wococo Westmint](wococo/parachain/wockmint/chainspec.json)
