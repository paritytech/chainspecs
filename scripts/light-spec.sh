#!/usr/bin/env bash
#
# Writes <dir>/light.json, the light client spec of the chain whose raw spec is
# <dir>/raw.json: the same spec with the genesis storage replaced by the genesis
# state root, read from the genesis header in <dir>/genesis-head (or
# genesis-state). Rerun it whenever raw.json changes.
#
#   scripts/light-spec.sh paseo/parachain/asset-hub-next

set -euo pipefail

dir=${1%/}
head_file=""
for name in genesis-head genesis-state; do
  [ -f "$dir/$name" ] && head_file="$dir/$name"
done
[ -n "$head_file" ] || { echo "$dir has no genesis-head or genesis-state" >&2; exit 1; }

# The SCALE header: a 32-byte parent hash, the compact block number, then the state root.
header=$(tr -d '[:space:]' < "$head_file")
[[ $header =~ ^0x0{64}00([0-9a-f]{64}) ]] || { echo "$head_file is not a genesis header" >&2; exit 1; }

jq --arg root "0x${BASH_REMATCH[1]}" '.genesis = {stateRootHash: $root}' "$dir/raw.json" > "$dir/light.json"
echo "wrote $dir/light.json, state root 0x${BASH_REMATCH[1]}"
