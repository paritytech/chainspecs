# Command to generate chainspec:

1. Pull the non-raw [collectives-westend](https://github.com/paritytech/cumulus/blob/bb94c0db4424ae0ed2c55a5ccdcfd880ca46a4a0/parachains/chain-specs/collectives-westend.json) chainspec.

2. Update chainspec:
```patch
wget https://raw.githubusercontent.com/paritytech/cumulus/bb94c0db4424ae0ed2c55a5ccdcfd880ca46a4a0/parachains/chain-specs/collectives-westend.json
patch collectives-westend.json patch-for-versi.patch
mv collectives-westend.json chainspec-nonraw.json
```
Private key are in vault: /kv/applications/parity-versi/versi-parachains

3.  Generate the raw chainspec from the Cumulus repo
```
git clone git@github.com:paritytech/cumulus.git
cd cumulus
git checkout master
cargo build --release
./target/release/polkadot-parachain build-spec --chain ../chainspec-nonraw.json --raw > chainspec.json
```

Note: During the time this raw chainspec is generated. The only working binary is the master.