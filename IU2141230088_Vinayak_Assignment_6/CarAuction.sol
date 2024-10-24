// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CarAuction {
    struct Car {
        uint id;
        string model;
        uint basePrice;
        address payable owner;
    }

    struct Bid {
        address bidder;
        uint bidAmount;
    }

    Car[] public cars;
    mapping(uint => Bid) public highestBids;
    mapping(uint => bool) public auctionEnded;

    event CarListed(uint carId, string model, uint basePrice);
    event NewBid(uint carId, address bidder, uint bidAmount);
    event AuctionEnded(uint carId, address winner, uint winningBid);

    function listCar(string memory _model, uint _basePrice) public {
        uint carId = cars.length;
        cars.push(Car(carId, _model, _basePrice, payable(msg.sender)));
        emit CarListed(carId, _model, _basePrice);
    }

    function placeBid(uint _carId) public payable {
        require(_carId < cars.length, "Car not found");
        require(!auctionEnded[_carId], "Auction already ended");
        require(msg.value > highestBids[_carId].bidAmount, "Bid is too low");

        if (highestBids[_carId].bidAmount > 0) {
            payable(highestBids[_carId].bidder).transfer(highestBids[_carId].bidAmount);
        }

        highestBids[_carId] = Bid(msg.sender, msg.value);
        emit NewBid(_carId, msg.sender, msg.value);
    }

    function endAuction(uint _carId) public {
        require(_carId < cars.length, "Car not found");
        require(!auctionEnded[_carId], "Auction already ended");
        require(msg.sender == cars[_carId].owner, "Only the owner can end the auction");

        auctionEnded[_carId] = true;

        if (highestBids[_carId].bidAmount > 0) {
            cars[_carId].owner.transfer(highestBids[_carId].bidAmount);
            emit AuctionEnded(_carId, highestBids[_carId].bidder, highestBids[_carId].bidAmount);
        }
    }
}