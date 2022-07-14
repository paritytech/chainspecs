# Command to generate chainspec:

1. Pull the non-raw [collectives-westend](https://github.com/paritytech/cumulus/blob/bb94c0db4424ae0ed2c55a5ccdcfd880ca46a4a0/parachains/chain-specs/collectives-westend.json) in the cumulus repo, then switch to `giles-collections-chainspecs` branch
- `git clone git@github.com:paritytech/cumulus.git
   cd cumulus
   git checkout giles-collections-chainspecs`

2. Build the binary
- `cargo build --release`

3.  Generate the raw chainspec from the Cumulus repo
- `./target/release/polkadot-parachain build-spec --chain ./cumulus/parachains/chain-specs/collectives-westend.json --raw > chainspec.json`

Note: During the time this raw chainspec is generated. The only working binary is the `giles-collections-chainspecs`. Both nonraw in this repo and giles-collections-chainspecs is the same.