# Command used to generate chainspec:

     docker run --rm paritypr/polkadot-parachain-debug:master-735dd4d4 build-spec --chain statemine > chainspec.json

Note: new Bootnodes have been added but once fully tested the updated bootnode list will be pushed upstream in paritytech/cumulus.