// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    // Mapping to store votes for each candidate
    mapping(string => uint256) private votes;

    // Function to vote for a candidate
    function vote(string memory _candidate) public {
        votes[_candidate] += 1;
    }

    // Function to get the votes of a candidate
    function getVotes(string memory _candidate) public view returns (uint256) {
        return votes[_candidate];
    }
}
