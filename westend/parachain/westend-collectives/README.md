# Command to generate chainspec:

1. Pull the non-raw collectives-westend in the cumulus repo
- `git clone git@github.com:paritytech/cumulus.git`

2. Update the necessary field `name`, `id`, `bootnodes`

3. Generate the raw chainspec from the Cumulus repo
- `polkadot-parachain build-spec --chain ./cumulus/parachains/chain-specs/collectives-westend.json --raw > chainspec.json`