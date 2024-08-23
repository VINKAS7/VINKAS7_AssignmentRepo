# Assignment README (IU2141230088-Vinayak)

## Submitting Date
23-08-2024 (23rd August-2024)

## Assignment Level
Easy

## Everything is followed as per steps
Yes

## Lottery Smart Contract

### Overview

This Solidity smart contract implements a simple lottery system on the Ethereum blockchain. Users can enter the lottery by sending a minimum of 1 ETH. A random winner is selected using a combination of the block's previous random number, the current timestamp, and the list of participants. The winner receives the entire lottery pot. 

### How it Works

1. **Initialization:**
   * The contract is deployed by a manager.
   * The `manager` address is stored.
   * An empty array `players` is initialized to store participants.

2. **Entering the Lottery:**
   * Users call the `enter()` function and send at least 1 ETH.
   * The sender's address is added to the `players` array.

3. **Random Number Generation:**
   * The `random()` function generates a pseudo-random number using the block's previous random number, timestamp, and the `players` array.

4. **Picking a Winner:**
   * Only the `manager` can call the `pickWinner()` function.
   * A random index is generated using the `random()` function.
   * The winner is determined based on the random index.
   * The entire lottery pot is transferred to the winner.
   * The `players` array is reset for the next lottery.

### Functions

* **`enter()`:** Allows users to enter the lottery.
* **`random()`:** Generates a random number.
* **`pickWinner()`:** Selects and rewards the winner.
* **`getPlayers()`:** Returns the list of participants.

### Modifiers

* **`restricted()`:** Ensures that only the manager can call certain functions.

### Deployment

To deploy this contract, use a suitable Ethereum development environment (e.g., Remix, Truffle, Hardhat) and provide the necessary configuration for the network you want to deploy to.

### Security Considerations

* **Randomness:** While the random number generation method provides a basic level of randomness, consider using Chainlink VRF for more secure and verifiable random numbers.
* **Gas Costs:** Be aware of gas costs associated with transactions and ensure that the contract is optimized for efficiency.
* **Vulnerabilities:** Regularly audit the contract for potential vulnerabilities and follow best practices for smart contract security.

**Note:** This is a basic implementation of a lottery contract. For more complex lottery systems, you might consider features like multiple lotteries, different ticket prices, or additional rules.