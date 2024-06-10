# Parity Chainspecs Collections

Source repository: [github.com/paritytech/chainspecs](https://github.com/paritytech/chainspecs)

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

- [Polkadot Acala](polkadot/parachain/acala/chainspec.json)
- [Polkadot Clover](polkadot/parachain/clover/chainspec.json)
- [Polkadot Moonbeam](polkadot/parachain/moonbeam/chainspec.json)
- [Polkadot Astar](polkadot/parachain/astar/chainspec.json)
- Polkadot Crust <!--- Need to fix repo  https://github.com/crustio/crust/issues/942 -->
- [Polkadot Parallel](polkadot/parachain/parallel/chainspec.json)
- [Polkadot Litentry](polkadot/parachain/litentry/chainspec.json)
- [Polkadot Composable](polkadot/parachain/composable/chainspec.json)
- [Polkadot Sora](polkadot/parachain/sora/chainspec.json)
- [Polkadot nodle](polkadot/parachain/nodle/chainspec.json)
- [Polkadot Bifrost](polkadot/parachain/bifrost/chainspec.json)
- [Polkadot Centrifuge](polkadot/parachain/centrifuge/chainspec.json)
- [Polkadot Interlay](polkadot/parachain/interlay/chainspec.json)
- [Polkadot HydraDX](polkadot/parachain/hydradx/chainspec.json)
- [Polkadot Phala](polkadot/parachain/phala/chainspec.json)
- [Polkadot Unique](polkadot/parachain/unique/chainspec.json)
- [Polkadot Integritee](polkadot/parachain/integritee/chainspec.json)
- [Polkadot Polkadex](polkadot/parachain/polkadex/chainspec.json)
- [Polkadot NeuroWeb](polkadot/parachain/neuroweb/chainspec.json)
- [Polkadot Darwinia](polkadot/parachain/darwinia/chainspec.json)
- [Polkadot Bitgreen](polkadot/parachain/bitgreen/chainspec.json)
- [Polkadot Ajuna](polkadot/parachain/ajuna/chainspec.json)
- [Polkadot OmniBTC](polkadot/parachain/omnibtc/chainspec.json)
- [Polkadot Aventus](polkadot/parachain/aventus/chainspec.json)
- [Polkadot Watr](polkadot/parachain/watr/chainspec.json)
- Polkadot OAK
- [Polkadot KILT Spiritnet](polkadot/parachain/kilt/chainspec.json)
- [Polkadot Frequency](polkadot/parachain/frequency/chainspec.json)
- [Polkadot Zeitgeist](polkadot/parachain/zeitgeist/chainspec.json)
- [Polkadot Hashed](polkadot/parachain/hashed/chainspec.json)
- [Polkadot Pendulum](polkadot/parachain/pendulum/chainspec.json)
- [Polkadot Subsocial](polkadot/parachain/subsocial/chainspec.json)
- [Polkadot Manta](polkadot/parachain/manta/chainspec.json)
- [Polkadot t3rn](polkadot/parachain/t3rn/chainspec.json)
- [Polkadot peaq](polkadot/parachain/peaq/chainspec.json)
- [Polkadot InvArch](polkadot/parachain/invarch/chainspec.json)
- [Polkadot Polimec](polkadot/parachain/polimec/chainspec.json)
- Polkadot Energy Web X
- [Polkadot Continuum](polkadot/parachain/continuum/chainspec.json)
- [Polkadot Logion](polkadot/parachain/logion/chainspec.json)
- [Polkadot Hyperbridge (Nexus)](polkadot/parachain/hyperbridge/chainspec.json)
- [Polkadot Mythos](polkadot/parachain/mythos/chainspec.json)
- 2,003
- 2,055
- 2,106
- 3,360
- 3,366


### Kusama
- [Kusama](kusama/relaychain/chainspec.json)
- [Kusama AssetHub](kusama/parachain/asset-hub/chainspec.json)
- [Kusama BridgeHub](kusama/parachain/bridge-hub/chainspec.json)
- [Kusama Coretime](kusama/parachain/coretime/chainspec.json)
- [Kusama People](kusama/parachain/people/chainspec.json)


### Paseo
- [Paseo](paseo/relaychain/chainspec.json)
- [Paseo AssetHub](paseo/parachain/asset-hub/chainspec.json)

### Rococo
- [Rococo](rococo/relaychain/chainspec.json)
- [Rococo AssetHub](rococo/parachain/asset-hub/chainspec.json)
- [Rococo Bridge-Hub](rococo/parachain/bridge-hub/chainspec.json)
- [Rococo Contracts](rococo/parachain/contracts/chainspec.json)
- [Rococo Coretime](rococo/parachain/coretime/chainspec.json)
- [Rococo Muse](rococo/parachain/mythical/chainspec.json)
- [Rococo People](rococo/parachain/people/chainspec.json)

### Westend
- [Westend](westend/relaychain/chainspec.json)
- [Westend AssetHub](westend/parachain/asset-hub/chainspec.json)
- [Westend BridgeHub](westend/parachain/bridge-hub/chainspec.json)
- [Westend Collectives](westend/parachain/collectives/chainspec.json)
- [Westend Coretime](westend/parachain/coretime/chainspec.json)
- [Westend Muse](westend/parachain/mythical/chainspec.json)
- [Westend People](westend/parachain/people/chainspec.json)
