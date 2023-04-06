// contracts/CryptoCharacterHelper.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract CryptoCharacterHelper {
    uint createCharacterFee = 0.001 ether;

    // True si le client ne possède pas plus de 2 tokens
    modifier canGetMoreCharacter(uint _numberOfCharacter) {
        require(_numberOfCharacter < 2);
        _;
    } 

    // True si le client a envoyé le bon montant ou plus
    modifier sentEnoughEther() {
        require(msg.value >= createCharacterFee);
        _;
    }

    modifier isOwnerOf(address _owner) {
        require(msg.sender == _owner);
        _;
    }
}