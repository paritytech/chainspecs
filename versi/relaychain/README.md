# Command to generate chainspec:
`
 1. Run: `docker run parity/polkadot:v0.9.19 build-spec --chain rococo-staging > chainspec.json`
 2. Replace `rococo` with `versi` in `chainspec.json` (Example: `"id": "rococo_v1_14"` -> `"id": "versi_v1_7"` ), update bootnodes. 