# Command to generate chainspec:

1. Generate non-raw versi-statemine chainspec based on the statemine runtime:

- `polkadot-parachain  build-spec --chain statemine-genesis > versi-statemine-nonraw.json`

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

4. Build the raw chainspec:

- `polkadot-parachain build-spec --chain versi-statemine-nonraw.json --raw > versi-statemine.json`