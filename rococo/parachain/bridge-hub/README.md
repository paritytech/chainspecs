# Command to generate chainspec:

1. Pull the branch https://github.com/paritytech/cumulus/tree/6988dc4f4e3c8699a60bb3e8c50da8fcef776936
2. Build the binary
- `cargo build --release`
```
./polkadot-parachain --version 
polkadot-parachain 0.9.300-6988dc4f4e3
```
or [download](https://storage.googleapis.com/parity-testnet-odd-releases/bridge-hub-cumulus/0930/polkadot-parachain) if binary is still available 

3.  Generate the chainspec
./polkadot-parachain build-spec --chain bridge-hub-rococo > chainspec.json

