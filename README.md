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
- [Polkadot Crust](polkadot/parachain/crust/chainspec.json)
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
- [Kusama Encointer](kusama/parachain/encointer/chainspec.json)
- [Kusama Karura](kusama/parachain/karura/chainspec.json)
- [Kusama Bifrost](kusama/parachain/bifrost/chainspec.json)
- [Kusama Khala](kusama/parachain/khala/chainspec.json)
- [Kusama Shiden](kusama/parachain/shiden/chainspec.json)
- [Kusama SORA](kusama/parachain/sora/chainspec.json)
- Kusama Crust
- [Kusama Moonriver](kusama/parachain/moonriver/chainspec.json)
- Kusama Genshiro
- [Kusama Robonomics](kusama/parachain/robonomics/chainspec.json)
- [Kusama Calamari](kusama/parachain/calamari/chainspec.json)
- [Kusama Parallel Heiko](kusama/parachain/heiko/chainspec.json)
- [Kusama Picasso](kusama/parachain/picasso/chainspec.json)
- [Kusama Basilisk](kusama/parachain/basilisk/chainspec.json)
- [Kusama QUARTZ by UNIQUE](kusama/parachain/quartz/chainspec.json)
- [Kusama Pioneer](kusama/parachain/pioneer/chainspec.json)
- [Kusama Crab](kusama/parachain/crab/chainspec.json)
- [Kusama Litmus](kusama/parachain/litmus/chainspec.json)
- Kusama Mangata
- [Kusama Kabocha](kusama/parachain/kabocha/chainspec.json)
- [Kusama Turing Network](kusama/parachain/turing/chainspec.json)
- [Kusama Bajun Network](kusama/parachain/bajun/chainspec.json)
- Kusama Imbue Network
- [Kusama GM](kusama/parachain/gm/chainspec.json)
- [Kusama InvArch Tinkernet](kusama/parachain/invarch/chainspec.json)
- Kusama DAO IPCI
- Kusama ZERO Canary
- [Kusama Acurast Canary](kusama/parachain/acurast/chainspec.json)
- [Kusama Krest](kusama/parachain/krest/chainspec.json)
- [Kusama Quantum Portal Network](kusama/parachain/quantum/chainspec.json)
- [Kusama Kreivo - By Virto](kusama/parachain/kreivo/chainspec.json)
- [Kusama t1rn](kusama/parachain/t1rn/chainspec.json)
- [Kusama K-Laos](kusama/parachain/klaos/chainspec.json)
- Kusama Curio
- [Kusama Hyperbridge (Messier)](kusama/parachain/messier/chainspec.json)
- Kusama Xode
- Kusama Yerba Network
- 2,233
- 2,275
- 3,338
- 3,343
- 3,350


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
