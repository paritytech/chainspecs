# Command to generate chainspec:

1. Generate non-raw rococo-dummy-parachain chainspec based on the default (rococo-parachain) runtime:

```shell
docker run --rm docker.io/paritypr/polkadot-parachain-debug:master-c4c7fa09 build-spec > chainspec-nonraw.json
```

2. Edit the following fields manually:

```
  "bootNodes": [
    "/dns/rococo-dummy-parachain-bootnode-0.parity-testnet.parity.io/tcp/30333/p2p/12D3KooWKiaAJ2BWKajVMwnNnjqEB9be6Pq9ryPPUMU2tKWQdJGg",
    "/dns/rococo-dummy-parachain-bootnode-1.parity-testnet.parity.io/tcp/30333/p2p/12D3KooWKiaAJ2BWKajVMwnNnjqEB9be6Pq9ryPPUMU2tKWQdJGg"
  ],
  "relay_chain": "rococo",
  "para_id": 1900,
    "genesis": {
    "runtime": {
      [...]
      "sudo": {
        "key": "5DwBmEFPXRESyEam5SsQF1zbWSCn2kCjyLW51hJHXe9vW4xs"
      },
      "parachainInfo": {
        "parachainId": 1900
      },
      "balances": {
        "balances": [
          [
            "5D5NTZaxuakHTa61WDWpsbegdNFGkyy2qKS1eaVXNiPeFLen",
            1152921504606846976
          ],
          [
            "5G79yme464c49DqZrfxDoy5QREchPNtMPdqiyQ9XLmNgQzxT",
            1152921504606846976
          ]
        ]
      },
      "aura": {
        "authorities": [
          "5D5NTZaxuakHTa61WDWpsbegdNFGkyy2qKS1eaVXNiPeFLen",
          "5G79yme464c49DqZrfxDoy5QREchPNtMPdqiyQ9XLmNgQzxT"
        ]
      },
```

4. Build the raw chainspec:

```
   docker run --mount type=bind,src=./,target=/data --rm docker.io/paritypr/polkadot-parachain-debug:master-c4c7fa09 build-spec --chain /data/chainspec-nonraw.json --raw > chainspec.json
```


- `polkadot-parachain build-spec --chain versi-statemine-nonraw.json --raw > versi-statemine.json`