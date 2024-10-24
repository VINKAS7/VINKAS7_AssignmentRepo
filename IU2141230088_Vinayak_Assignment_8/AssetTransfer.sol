// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AssetTransfer {
    struct Asset {
        string description;
        address currentOwner;
    }

    Asset[] public assets;

    event AssetRegistered(uint assetId, string description, address owner);
    event AssetTransferred(uint assetId, address from, address to);

    function registerAsset(string memory _description) public {
        uint assetId = assets.length;
        assets.push(Asset(_description, msg.sender));
        emit AssetRegistered(assetId, _description, msg.sender);
    }

    function transferAsset(uint _assetId, address _to) public {
        require(_assetId < assets.length, "Asset not found");
        require(assets[_assetId].currentOwner == msg.sender, "Only the owner can transfer this asset");

        assets[_assetId].currentOwner = _to;
        emit AssetTransferred(_assetId, msg.sender, _to);
    }

    function getAsset(uint _assetId) public view returns (string memory description, address owner) {
        require(_assetId < assets.length, "Asset not found");
        return (assets[_assetId].description, assets[_assetId].currentOwner);
    }
}