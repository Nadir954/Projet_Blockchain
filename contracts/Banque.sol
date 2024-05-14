pragma solidity ^0.8.0;

// SPDX-License-Identifier: UNLICENSED

import "./Token.sol";

/**
 * Titre Banque
 * Banque d'achat de jeton (1eth = 100 token)
 */
contract Banque {
    address private owner;
    address private token;

    /**
     * Définir le déployeur de contrat en tant que propriétaire et définir l'adresse du contrat de jeton
     */
    constructor(address tokenaddress) {
        token = tokenaddress;
        owner = msg.sender; // 'msg.sender' is sender of current call, contract deployer for a constructor
    }

    /**
     * Acheter 100 tokens pour 1 ethereum
     */
    function buy() external payable {
        require(msg.value == 1 ether, "invalid value -> 1eth = 100 token"); // check the amount paid for the purchase = 1eth
        address payable portefeuille = payable(owner); // converted the owner's address to a payable address
        portefeuille.transfer(msg.value); // transfer the amount received to the owner account

        require(
            Token(token).allowance(owner, address(this)) >= 100, // check the amount authorized by owner >= nb token user buy
            "owner not allowed"
        );
        require(
            Token(token).transferFrom(owner, msg.sender, 100), // token transfer
            "transfer fail"
        );
    }

    /**
     * Nombre de jetons disponibles à l'achat
     */
    function afficherBalance() external view returns (uint256) {
        return Token(token).allowance(owner, address(this)); // amount that the owner has authorized to be used by the contract
    }
}
