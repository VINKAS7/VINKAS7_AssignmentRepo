# Asset Transfer Smart Contract

## Overview

This contract enables users to register and transfer ownership of assets.

### Key Functions

1. **registerAsset(string description)**: Allows users to register a new asset.
2. **transferAsset(uint assetId, address to)**: Allows the owner of an asset to transfer ownership to another address.
3. **getAsset(uint assetId)**: Returns the description and owner of the asset.

### Events

- `AssetRegistered`: Triggered when a new asset is registered.
- `AssetTransferred`: Triggered when an asset is transferred to a new owner.
