pragma solidity ^0.8.0;

// SPDX-License-Identifier: UNLICENSED

interface ERC20Basic {
    function totalSupply() external view returns (uint256);

    function balanceOf(address who) external view returns (uint256);

    function transfer(address to, uint256 value) external returns (bool);

    function transferFrom(address from, address to, uint256 value) external returns (bool);

    function approve(address spender, uint256 value) external returns (bool);

    function allowance(address owner, address spender) external view returns (uint256);

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}
