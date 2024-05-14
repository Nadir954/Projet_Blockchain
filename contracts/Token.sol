pragma solidity ^0.8.0;

// SPDX-License-Identifier: UNLICENSED

import "./ERC20Basic.sol";

contract Token is ERC20Basic {
    string public symbol = "AUT";
    string public name = "AuthenticityToken";
    uint8 public decimal = 15;

    using SafeMath for uint256;
    uint256 totalSupply_;

    constructor(uint256 total) {
        totalSupply_ = total;
        __balanceOf[msg.sender] = totalSupply_;
    }

    mapping(address => uint256) private __balanceOf;
    mapping(address => mapping(address => uint256)) private __allowances;

    function totalSupply() external view override returns (uint256) {
        return totalSupply_;
    }

    function balanceOf(address _addr) external view override returns (uint256 balance) {
        return __balanceOf[_addr];
    }

    function transfer(address _to, uint256 _value) external override returns (bool success) {
        require(_value <= __balanceOf[msg.sender], "Insufficient balance");
        __balanceOf[msg.sender] -= _value;
        __balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) external override returns (bool success) {
        require(_value <= __balanceOf[_from], "Insufficient balance");
        require(_value <= __allowances[_from][msg.sender], "Allowance exceeded");
        __balanceOf[_from] -= _value;
        __allowances[_from][msg.sender] -= _value;
        __balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) external override returns (bool success) {
        require(__allowances[msg.sender][_spender] == 0 || _value == 0, "Approval already set or value is not zero");
        __allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) external view override returns (uint256 remaining) {
        return __allowances[_owner][_spender];
    }
}

library SafeMath {
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "Subtraction overflow");
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "Addition overflow");
        return c;
    }
}
