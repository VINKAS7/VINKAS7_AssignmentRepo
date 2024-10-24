# Car Auction Smart Contract

## Overview

This contract allows car owners to list their cars for auction and allows participants to place bids. The car owner can end the auction, and the highest bidder wins the car.

### Key Functions

1. **listCar(string model, uint basePrice)**: Allows the car owner to list a car with a base price.
2. **placeBid(uint carId)**: Allows users to place bids on a listed car. Bids must be higher than the previous highest bid.
3. **endAuction(uint carId)**: Ends the auction and transfers the highest bid to the car owner.

### Events

- `CarListed`: Triggered when a new car is listed.
- `NewBid`: Triggered when a new bid is placed.
- `AuctionEnded`: Triggered when the auction ends and a winner is declared.