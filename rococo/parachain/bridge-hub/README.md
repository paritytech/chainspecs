# Command to generate chainspec:

1. Pull the branch [bko-bridges-deps-as-subtree](https://github.com/paritytech/cumulus/tree/bko-bridges-deps-as-subtree) in the cumulus repo
- `git clone git@github.com:paritytech/cumulus.git
   cd cumulus
   git checkout bko-bridges-deps-as-subtree`

2. Build the binary
- `cargo build --release`

3.  Generate the non-raw chainspec from the Cumulus repo
- `./target/release/polkadot-parachain build-spec --chain bridge-hub-rococo --disable-default-bootnode > ./chainspec-non-raw.json`

4. Update the necessary field for bootnodes, keys, and etc.

5. Generate the raw chainspec from the non-raw
- `./target/release/polkadot-parachain build-spec --chain ./chainspec-non-raw.json > ./chainspec.json`


Note: During the time this raw chainspec is generated. The only working binary is the `bko-bridges-deps-as-subtree`.

