# Command used to generate chainspec:


ok, chainspec is updated here: https://github.com/paritytech/cumulus/pull/1999/files#diff-2f848f1d4c6572658bcfe643ad5af07dab70f70da55d75aa2f8910dc1233ccdc
PR: https://github.com/paritytech/cumulus/pull/1999
cmd:
```
./scripts/create_bridge_hub_kusama_spec.sh ./target/release/wbuild/bridge-hub-kusama-runtime/bridge_hub_kusama_runtime.compact.compressed.wasm 1002
```

(for real release, we need to release final wasm and regenerate chainspec because of code)
