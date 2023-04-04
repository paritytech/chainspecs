# Command to generate chainspec:

Note skip to step 4 for updating the runtime only.

1. Generate non-raw versi-statemine chainspec based on the statemine runtime:

- `polkadot-parachain  build-spec --chain statemine-genesis > chainspec-nonraw.json`

2. Edit the following fields manually:

```
  "bootNodes": [
    "/dns/versi-statemint-bootnode-0.parity-versi.parity.io/tcp/30333/p2p/12D3KooWArVF3yebxyysskMnbiYRXZ8Q8BWLwupFeUnsoU7rWKFt",
    "/dns/versi-statemint-bootnode-1.parity-versi.parity.io/tcp/30333/p2p/12D3KooWBW6JopiZ2ezZwWAMGgn8U9T2V2Zg4TwaFxYuudAk88G2"
  ],
  "properties": {
    "ss58Format": 42,
    "tokenDecimals": 12,
    "tokenSymbol": "VRS"
  },
  "relay_chain": "versi",
  "para_id": 1000,
```

3. Edit the `session.keys` and `collatorSelection.invulneables` based on the SS58 address output from:

- `subkey inspect "$ROOT_SEED//collator//versi-statemint-bootnode-0"`
- `subkey inspect "$ROOT_SEED//collator//versi-statemint-bootnode-1"`


4. Update chainspec to the latest runtime

Get the latest runtime as an hex encoded string with:

  RUNTIME_URL=https://github.com/paritytech/cumulus/releases/download/parachains-v9380/
  curl -Lo runtime.wasm $RUNTIME_URL
  python -c 'print("0x" + open("runtime.wasm", "rb").read().hex())'

Edit `.genesis.runtime.system.code` chainspec key with the new runtime code.

5. Build the raw chainspec:

  polkadot-parachain build-spec --chain chainspec-nonraw.json --raw > chainspec.json

6. Cleanup

  rm runtime.wasm