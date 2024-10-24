// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FitnessClubRewards {
    struct Member {
        uint points;
        bool isMember;
    }

    address public owner;
    mapping(address => Member) public members;

    event MembershipGranted(address indexed member);
    event PointsEarned(address indexed member, uint points);
    event PointsRedeemed(address indexed member, uint points);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    modifier onlyMember() {
        require(members[msg.sender].isMember, "Not a member");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function grantMembership(address _member) public onlyOwner {
        require(!members[_member].isMember, "Already a member");
        members[_member] = Member(0, true);
        emit MembershipGranted(_member);
    }

    function earnPoints(uint _points) public onlyMember {
        members[msg.sender].points += _points;
        emit PointsEarned(msg.sender, _points);
    }

    function redeemPoints(uint _points) public onlyMember {
        require(members[msg.sender].points >= _points, "Insufficient points");
        members[msg.sender].points -= _points;
        emit PointsRedeemed(msg.sender, _points);
    }
}