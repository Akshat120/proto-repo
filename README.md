# proto-repo
This repo simulates the working for github/workflow to automatically generates proto files from `./proto/*.proto`

## How it works ?
1. Edit/Create proto message file in `./proto/...`
2. Merge the changes in master
3. Observe the `./protogen/go/...` it must get changed.
