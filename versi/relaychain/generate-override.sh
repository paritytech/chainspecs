#!/usr/bin/env bash
set -e
###
# Script to generate part of chainspec with keys and accounts.
###


if [ "$#" -ne 1 ]; then
	echo "Please provide the number of initial validators!"
	echo "Usage: $0 8 > ./versi-override.json"
	echo "export SUDO_SEED= # seed "
	echo "export DERIVATION_ROOT_SEED= #base seed to derive from"
	echo "./generate-override.sh 8 > ./versi-override.json"
	echo "NOTE: Update beefy manually subkey can not generate such key"
	exit 1
fi

PREFIX=versi-bootnode-

generate_address() {
	subkey inspect ${3:-} ${4:-} "$DERIVATION_ROOT_SEED//$PREFIX$1//$2" | grep "SS58 Address" | awk '{ print $3 }'
}

V_NUM=$(($1 - 1))

BALANCES='\"balances\":\n {"balances": [\n'
SESSION='"session": {\n   "keys": [\n'

SUDO_ADDRESS=$(subkey inspect $SUDO_SEED | grep "SS58 Address" | awk '{ print $3 }')
BALANCES+="  [\"${SUDO_ADDRESS}\", 1000000000000000000],\n"

for i in $(seq 0 $V_NUM); do
  if [ $i -eq $V_NUM ]
  then
    LAST=""
  else
    LAST=','
  fi
  STASH=$(generate_address $i stash)

  BALANCES+="  [\"${STASH}\", 100000000000000]${LAST}\n"

	SESSION+="[\n"
	SESSION+="  \"${STASH}\",\n"
	SESSION+="  \"${STASH}\",\n"
	SESSION+="  {\n"
	SESSION+="    \"grandpa\": \"$(generate_address $i grandpa '--scheme ed25519')\",\n"
	SESSION+="    \"babe\": \"$(generate_address $i babe '--scheme sr25519')\",\n"
	SESSION+="    \"im_online\": \"$(generate_address $i im_online '--scheme sr25519')\",\n"
	SESSION+="    \"para_validator\": \"$(generate_address $i para_validator '--scheme sr25519')\",\n"
	SESSION+="    \"para_assignment\": \"$(generate_address $i para_assignment '--scheme sr25519')\",\n"
	SESSION+="    \"authority_discovery\": \"$(generate_address $i authority_discovery '--scheme sr25519')\",\n"
	SESSION+="    \"beefy\": \"$(generate_address $i beefy '--scheme ecdsa')\"\n" #  <= producing wrong key
	SESSION+="  }\n]${LAST}\n"
done
BALANCES+="]}"
SESSION+='  ]\n}\n'

CHAINSPEC='{
   "name": "Versi",
   "id": "versi_v1_10",
   "bootNodes": [
      "/dns/versi-bootnode-0.parity-versi.parity.io/tcp/30333/p2p/12D3KooWMHy2qkBrpZVv11No8Ysfckab3cCkf1GWMTEVeAz3SQrC",
      "/dns/versi-bootnode-1.parity-versi.parity.io/tcp/30333/p2p/12D3KooWEQShxW9m9MVecXK5FHq8jaqAqukcjVTkgmnhH61LDMNu",
      "/dns/versi-bootnode-2.parity-versi.parity.io/tcp/30333/p2p/12D3KooWR1N3e5nwJaqAEn27ydg6dLian7LJYuHB6rx6rUuZWg3u",
      "/dns/versi-bootnode-3.parity-versi.parity.io/tcp/30333/p2p/12D3KooWJRjtuu5xzjU6WSKYcWC326i8HtVQsyYAVa6x2Ky2hukY",
      "/dns/versi-bootnode-4.parity-versi.parity.io/tcp/30333/p2p/12D3KooWHKy3VggzwJTMVuiAYJK3ARtfCYp8qYEjicHNF6py5TGG",
      "/dns/versi-bootnode-5.parity-versi.parity.io/tcp/30333/p2p/12D3KooWLQNS8ULhha5LLTWnSV3DHeXBfUFqr8vjNPGM9SAzBdgu",
      "/dns/versi-bootnode-6.parity-versi.parity.io/tcp/30333/p2p/12D3KooWGsHmcZFhu64ue51SzWNdWVaBdjpKvrURkRHNcX4sLAhh",
      "/dns/versi-bootnode-7.parity-versi.parity.io/tcp/30333/p2p/12D3KooWDbKdQoWsjDwegEc2XarYWaiTogyVkixE52nAiTXtiEVp"
   ],
   "genesis": {
      "runtimeGenesis": {
        "patch": {
          '"$BALANCES, ${SESSION}"',
          "configuration": {
            "config": {
              "async_backing_params": {
                "max_candidate_depth": 3,
                "allowed_ancestry_len": 2
              }
            }
          }
        }
      }
   }
}
'

printf "$CHAINSPEC" | jq | sed 's/1e+18/1000000000000000000/'
