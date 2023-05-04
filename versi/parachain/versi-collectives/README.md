# Command to generate chainspec:

1. Pull the non-raw [collectives-westend](https://github.com/paritytech/cumulus/blob/bb94c0db4424ae0ed2c55a5ccdcfd880ca46a4a0/parachains/chain-specs/collectives-westend.json) chainspec.

2. Update chainspec:
```patch
wget https://raw.githubusercontent.com/paritytech/cumulus/bb94c0db4424ae0ed2c55a5ccdcfd880ca46a4a0/parachains/chain-specs/collectives-westend.json
patch collectives-westend.json patch-for-versi.patch
mv collectives-westend.json versi-collectives-base.json
```
Private key are in vault: /kv/applications/parity-versi/versi-parachains

3. Add stps funded accounts

```
    jq  -s '.[0] * .[1]' versi-collectives-base.json ../overrides/stps-funded-accounts.json > ./chainspec-plain.json
```

4.  Generate the raw chainspec

```
DOCKER_IMAGE=paritypr/polkadot-parachain-debug:master-df681860
docker run --rm -v $(pwd):/dir:z -w /dir $DOCKER_IMAGE build-spec --chain /dir/chainspec-plain.json --raw  > ./chainspec.json
```
