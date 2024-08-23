// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    // Declaration of the Lottery contract
    address public manager;
    // The address of the manager who deploys the contract
    address[] public players;
    // An array to keep track of all participants in the lottery

    constructor() {
        // Constructor function is executed once when the contract is deployed
        manager = msg.sender;
        // Sets the manager to the address that deployed the contract
    }

    function enter() public payable {
        // Function that allows users to participate in the lottery
        require(msg.value >= 1 ether, "Minimum entry fee is 1 ETH");
        // Ensures that the amount of Ether sent is at least 1 ETH. If not, the transaction is reverted with the provided message.
        players.push(msg.sender);
        // Adds the address of the participant (msg.sender) to the players array
    }

    function random() private view returns (uint) {
        // Function to generate a pseudo-random number
        return uint(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, players)));
        // Combines previous block randomness (prevrandao), current block timestamp, and the players array to generate a pseudo-random number
        // The random number is hashed using keccak256 and then converted to uint
    }

    function pickWinner() public restricted {
        // Function to pick a winner from the lottery participants
        require(players.length > 0, "No players to select a winner");
        // Ensures that there is at least one player in the lottery; if not, the transaction is reverted with the provided message.

        uint index = random() % players.length;
        // Uses the random number generated to pick an index. The modulus operation ensures the index is within the bounds of the players array.
        address winner = players[index];
        // Gets the winner's address from the players array using the randomly generated index
        
        payable(winner).transfer(address(this).balance);
        // Transfers the entire balance of the contract to the winner's address. The `payable` keyword allows the address to receive Ether.

        // Reset the players array for the next lottery
        players = new address[](0);
        // Initializes a new empty array of addresses, effectively resetting the players list for the next round
    }

    modifier restricted() {
        // Modifier to restrict function access to only the manager
        require(msg.sender == manager, "Only the manager can call this");
        // Checks if the sender of the transaction (msg.sender) is the manager. If not, the transaction is reverted with the provided message.
        _;
        // Placeholder for the function body. The code inside the function where the modifier is used will execute here.
    }

    function getPlayers() public view returns (address[] memory) {
        // Function to get the list of players
        return players;
        // Returns the current list of players as an array of addresses
    }
}