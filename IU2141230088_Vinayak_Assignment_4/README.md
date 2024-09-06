# Assignment README (IU2141230088-Vinayak)

## Submitting Date
06-09-2024 (06th September-2024)

## Assignment Level
Easy

## Everything is followed as per steps
Yes

# Donation Smart Contract & SHA-256 Hash Generator

## Overview

This project contains two main components:

1. A **JavaScript** application that generates input strings whose SHA-256 hash starts with a specified prefix.
2. An **Ethereum smart contract** written in **Solidity**, which allows users to donate Ether to recipients and allows the recipients to withdraw those donations.

---

## 1. SHA-256 Hash Generator in JavaScript

### **JavaScript Code Explanation**

There are three variations of the SHA-256 hash generator in the code:

#### **Version 1: Basic SHA-256 Hash Finder**
This version brute forces input strings by hashing an integer (`i`) to find a SHA-256 hash that starts with `"00000"`.

```javascript
const crypto = require('crypto');

function findStringWithSHA256Prefix(prefix = '00000') {
    let i = 0;
    while (true) {
        const inputString = i.toString();  // Incrementing integer converted to string
        const hash = crypto.createHash('sha256').update(inputString).digest('hex');  // Generate SHA-256 hash
        if (hash.startsWith(prefix)) {  // Check if hash starts with '00000'
            console.log(`Input string: ${inputString}`);
            console.log(`SHA-256 hash: ${hash}`);
            return;
        }
        i++;  // Increment i for the next iteration
    }
}

findStringWithSHA256Prefix();
```

#### **Version 2: Hash Finder Using a Custom Name**
This version hashes a custom string (`name + i.toString()`) to find a hash that starts with `"00000"`. The name `vinayakkashyap14` is concatenated with an incremented number.

```javascript
const name = "vinayakkashyap14";

function findStringWithSHA256Prefix(prefix = '00000') {
    let i = 0;
    while (true) {
        const inputString = name + i.toString() + " ";  // Custom name + incremental number
        const hash = crypto.createHash('sha256').update(inputString).digest('hex');  // Generate SHA-256 hash
        if (hash.startsWith(prefix)) {
            console.log(`Input string: ${inputString}`);
            console.log(`SHA-256 hash: ${hash}`);
            return;
        }
        i++;
    }
}

findStringWithSHA256Prefix();
```

#### **Version 3: Hash Finder with a Custom Text**
This version finds the SHA-256 hash starting with `"00000"` for a string containing a message with transactions (`Dev => Karan | Rs 100, Karan => Darsh | Rs 10`), concatenated with a number.

```javascript
const text = "Dev => Karan | Rs 100, Karan => Darsh | Rs 10 ";

function findStringWithSHA256Prefix(prefix = '00000') {
    let i = 0;
    while (true) {
        const inputString = text + i.toString();  // Transaction text + incremental number
        const hash = crypto.createHash('sha256').update(inputString).digest('hex');  // Generate SHA-256 hash
        if (hash.startsWith(prefix)) {
            console.log(`Input string: ${inputString}`);
            console.log(`SHA-256 hash: ${hash}`);
            return;
        }
        i++;
    }
}

findStringWithSHA256Prefix();
```

### **How to Run the JavaScript Code**

1. Install Node.js on your machine if you haven't already.
2. Create a file (e.g., `sha256.js`) and copy the code.
3. Run the code with Node.js:
   ```
   node sha256.js
   ```

The script will generate input strings until it finds one that results in a SHA-256 hash starting with `"00000"`.

---

## 2. Donation Smart Contract in Solidity

### **Solidity Code Explanation**

The Ethereum smart contract allows users to donate Ether to specific recipients and enables recipients to withdraw their funds.

#### **Key Features**

1. **Donating Ether**:
   - Users can call the `donate()` function and specify a recipient's address, along with some Ether.
   - The recipient’s balance is updated in the `recipientBalances` mapping.

2. **Withdrawing Donations**:
   - Recipients can withdraw their donated Ether using the `withdrawFunds()` function.
   - It securely transfers the balance to the recipient and prevents reentrancy attacks by resetting the balance before transferring the funds.

3. **Viewing Balance**:
   - The contract has a `getRecipientBalance()` function that allows anyone to check the balance of a recipient.

#### **Smart Contract Code**

```solidity
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
```

### **How to Deploy and Interact with the Contract**

1. **Deploying the Contract**:
   - Use Remix IDE or tools like Hardhat to deploy the contract to the Ethereum blockchain.
   - Make sure you have Ether in your wallet to cover the deployment cost.

2. **Making Donations**:
   - Call the `donate()` function from your wallet, specifying the recipient's address and sending some Ether.
   
3. **Withdrawing Donations**:
   - The recipient can call `withdrawFunds()` to transfer the donated funds to their wallet.

4. **Checking Balance**:
   - Use the `getRecipientBalance()` function to check the donation balance for any recipient.

---

## Conclusion

This project combines the ability to brute-force SHA-256 hash inputs in JavaScript and a smart contract that handles donations and withdrawals in Solidity. You can run the JavaScript code locally using Node.js and deploy the Solidity contract on Ethereum-compatible networks.
