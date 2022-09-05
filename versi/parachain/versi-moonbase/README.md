> Note: Filename should start with `moonbase`, [see](https://github.com/PureStake/moonbeam/issues/1104#issuecomment-996787548)

# Command to generate chainspec:

```shell
docker run --rm purestake/moonbeam:v0.24.0 build-spec --chain moonbase-dev > ./moonbase-dev-plain.json
# Fix network name
sed 's/"id": "moonbase_dev"/"id": "moonbase_versi"/' -i ./moonbase-dev-plain.json
sed 's/"name": "Moonbase Development Testnet"/"name": "Versi Moonbase"/' -i ./moonbase-dev-plain.json
sed 's/"chainType": "Development"/"chainType": "Live"/' -i ./moonbase-dev-plain.json
sed 's/"relayChain": "dev-service"/"relayChain": "versi"/' -i ./moonbase-dev-plain.json
# Update parachian id 
sed 's/"paraId": 0/"paraId": 2023/' -i ./moonbase-dev-plain.json
sed 's/"parachainId": 0/"parachainId": 2023/' -i ./moonbase-dev-plain.json
# Update bootnodes
sed 's,"/ip4/127.0.0.1/tcp/30333/p2p/.*","/dns/versi-moonbase-bootnode-0/tcp/30334/p2p/12D3KooWEhqcd5K6QyzypTTCtBxPgYJj7wVbaVcCFqiUfgpneatL",' -i ./moonbase-dev-plain.json
# Replace alice key with VERSI_VALIDATORS_ROOT_SEED (https://gitlab.parity.io/parity/infrastructure/privileged/parity-testnet-validator-manager/-/blob/e559036e81204c4c953bef0ee4edc7b12390c690/.gitlab-ci.yml#L78)
# see "How to create eth key" section bellow 
sed 's/5GrwvaEF5zXb26Fz9rcQpDWS57CtERHpNehXCPcNoHGKutQY/5CGHDgtYpLNEKYX2NEnTNs9K1FTket4Pps5cofYeDDFFoZkY/' -i ./moonbase-dev-plain.json
sed 's/0xf24ff3a9cf04c71dbc94d0b566f7a27b94566cac/0x30fD167F364D9288D05C2561f1Ce77cb57748915/' -i ./moonbase-dev-plain.json
# replace bob key with VERSI_VALIDATORS_ROOT_SEED/1 (eth_path = "/m/44'/60'/0'/0/1")
sed 's/0x3cd0a705a2dc65e5b1e1205896baa2be8a07c6e0/0x3bACaB544ad548fca8925Cb84B2F9CDD62A3b33B/' -i ./moonbase-dev-plain.json
# Charleth account is also present in chainspect but since this is testnet we will keep it.
docker run --rm -v $(pwd)/moonbase-dev-plain.json:/moonbase-dev-plain.json purestake/moonbeam:v0.24.0 build-spec --chain /moonbase-dev-plain.json --raw > ./chainspec.json
mv ./moonbase-dev-plain.json chainspec-nonraw.json
```


# How to create eth key:
```python
#!/usr/bin/env python3

from substrateinterface import Keypair,KeypairType
seed = "bottom drive obey lake curtain smoke basket hold race lonely fit walk"
eth_path = "/m/44'/60'/0'/0/0"
print(Keypair.create_from_uri(seed + eth_path, crypto_type=KeypairType.ECDSA).ss58_address)
print(Keypair.create_from_uri(seed).ss58_address)

#0xf24FF3a9CF04c71Dbc94D0b566f7A27B94566cac
#5DfhGyQdFobKM8NsWvEeAKk5EQQgYe9AydgJ7rMB6E1EqRzV
```

