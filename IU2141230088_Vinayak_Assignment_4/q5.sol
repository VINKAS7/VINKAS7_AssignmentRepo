// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract DonationContract {
    // Mapping to store the balance of donations for each recipient
    mapping(address => uint256) public recipientBalances;

    // Event to log donations
    event DonationReceived(address indexed donor, address indexed recipient, uint256 amount);

    // Event to log withdrawals
    event FundsWithdrawn(address indexed recipient, uint256 amount);

    // Function to make a donation to a specific recipient
    function donate(address recipient) public payable {
        require(msg.value > 0, "Donation amount must be greater than zero");

        // Add the donated amount to the recipient's balance
        recipientBalances[recipient] += msg.value;

        // Emit the DonationReceived event
        emit DonationReceived(msg.sender, recipient, msg.value);
    }

    // Function for the recipient to withdraw their funds
    function withdrawFunds() public {
        uint256 balance = recipientBalances[msg.sender];
        require(balance > 0, "No funds available for withdrawal");

        // Reset the recipient's balance before transferring to prevent reentrancy attacks
        recipientBalances[msg.sender] = 0;

        // Transfer the funds to the recipient
        (bool success, ) = msg.sender.call{value: balance}("");
        require(success, "Transfer failed.");

        // Emit the FundsWithdrawn event
        emit FundsWithdrawn(msg.sender, balance);
    }

    // Function to check the current balance of a recipient
    function getRecipientBalance(address recipient) public view returns (uint256) {
        return recipientBalances[recipient];
    }
}