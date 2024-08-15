// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleLedger {
    // Struct to store transaction details
    struct Transaction {
        address from;
        address to;
        uint256 amount;
    }

    // Array to store all transactions
    Transaction[] public transactions;

    // Function to add a transaction
    function addTransaction(address _to, uint256 _amount) public {
        transactions.push(Transaction(msg.sender, _to, _amount));
    }

    // Function to retrieve transaction by index
    function getTransaction(uint256 _index) public view returns (address, address, uint256) {
        Transaction memory txn = transactions[_index];
        return (txn.from, txn.to, txn.amount);
    }
}
