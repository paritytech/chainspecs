#!/usr/bin/env bash

# Source: https://github.com/paritytech/polkadot/blob/master/scripts/prepare-test-net.sh
# Usage:
# SECRET="***VALIDATORS_ROOT_SEED***" ./prepare-test-net.sh 7

set -e

if [ "$#" -ne 1 ]; then
	echo "Please provide the number of initial validators!"
	exit 1
fi

generate_account_id() {
	subkey inspect ${3:-} ${4:-} "$SECRET//$1//$2" | grep "Account ID" | awk '{ print $3 }'
}

generate_address() {
	subkey inspect ${3:-} ${4:-} "$SECRET//$1//$2" | grep "SS58 Address" | awk '{ print $3 }'
}

generate_public_key() {
	subkey inspect ${3:-} ${4:-} "$SECRET//$1//$2" | grep "Public" | awk '{ print $4 }'
}

generate_address_and_public_key() {
	ADDRESS=$(generate_address $1 $2 $3)
	PUBLIC_KEY=$(generate_public_key $1 $2 $3)

	printf "//$ADDRESS\nhex![\"${PUBLIC_KEY#'0x'}\"].unchecked_into(),"
}

generate_address_and_account_id() {
	ACCOUNT=$(generate_account_id $1 $2 $3)
	ADDRESS=$(generate_address $1 $2 $3)
	if ${4:-false}; then
		INTO="unchecked_into"
	else
		INTO="into"
	fi

	printf "//$ADDRESS\nhex![\"${ACCOUNT#'0x'}\"].$INTO(),"
}

V_NUM=$1

AUTHORITIES=""

for i in $(seq 0 $V_NUM); do
  NAME=versi-bootnode-$i
	AUTHORITIES+="(\n//$NAME\n"
	AUTHORITIES+="$(generate_address_and_account_id $NAME stash)\n"
	AUTHORITIES+="$(generate_address_and_account_id $NAME controller)\n"
	AUTHORITIES+="$(generate_address_and_account_id $NAME babe '--scheme sr25519' true)\n"
	AUTHORITIES+="$(generate_address_and_account_id $NAME grandpa '--scheme ed25519' true)\n"
	AUTHORITIES+="$(generate_address_and_account_id $NAME im_online '--scheme sr25519' true)\n"
	AUTHORITIES+="$(generate_address_and_account_id $NAME para_validator '--scheme sr25519' true)\n"
	AUTHORITIES+="$(generate_address_and_account_id $NAME para_assignment '--scheme sr25519' true)\n"
	AUTHORITIES+="$(generate_address_and_account_id $NAME authority_discovery '--scheme sr25519' true)\n"
	AUTHORITIES+="$(generate_address_and_public_key $NAME beefy '--scheme ecdsa' true)\n"
	AUTHORITIES+="),\n"
done

printf "$AUTHORITIES"