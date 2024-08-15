// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    // Variable to keep track of the count
    uint256 private count;

    // Function to increment the count
    function increment() public {
        count += 1;
    }

    // Function to retrieve the count
    function getCount() public view returns (uint256) {
        return count;
    }
}
