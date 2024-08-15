// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NameStorage {
    // Variable to store the user's name
    string private name;

    // Function to store the user's name
    function setName(string memory _name) public {
        name = _name;
    }

    // Function to retrieve the user's name
    function getName() public view returns (string memory) {
        return name;
    }
}
