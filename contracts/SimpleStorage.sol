pragma solidity >=0.8.0 <0.9.0;

// SPDX-License-Identifier: UNLICENSED

contract SimpleStorage {
    event StorageSet(string _message);

    uint256 public storedData;

    function set(uint256 x) public {
        storedData = x;

        emit StorageSet("Data stored successfully!");
    }
}
