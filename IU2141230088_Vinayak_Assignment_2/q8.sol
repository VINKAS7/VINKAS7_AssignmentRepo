// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventLogger {
    // Event declaration
    event MessageLogged(address sender, string message);

    // Function that logs an event
    function logMessage(string memory _message) public {
        emit MessageLogged(msg.sender, _message);
    }
}
