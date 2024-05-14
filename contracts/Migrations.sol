pragma solidity >=0.4.21 <0.9.0;

// SPDX-License-Identifier: UNLICENSED

contract Migrations {
    address public owner;
    uint256 public last_completed_migration;

    constructor()   {
        owner = msg.sender;
    }

    modifier restricted() {
        require(msg.sender == owner, "Restricted to owner");
        _;
    }

    function setCompleted(uint256 completed) public restricted {
        last_completed_migration = completed;
    }
}
