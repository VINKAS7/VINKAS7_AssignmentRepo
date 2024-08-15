// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Greeting {
    // Variable to store the greeting message
    string private greetingMessage;

    // Function to set a personalized greeting
    function setGreeting(string memory _greeting) public {
        greetingMessage = _greeting;
    }

    // Function to retrieve the greeting message
    function getGreeting() public view returns (string memory) {
        return greetingMessage;
    }
}
