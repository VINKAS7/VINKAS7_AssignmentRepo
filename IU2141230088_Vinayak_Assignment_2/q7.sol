// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OwnerOnly {
    // Variable to store the owner’s address
    address private owner;

    // Constructor to set the contract deployer as the owner
    constructor() {
        owner = msg.sender;
    }

    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    // Function restricted to the owner
    function ownerFunction() public onlyOwner {
        // Function logic
    }
}
