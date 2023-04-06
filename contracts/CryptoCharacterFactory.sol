// contracts/CryptoCharacterFactory.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./CryptoCharacterHelper.sol";

contract CryptoCharacterFactory is CryptoCharacterHelper, Ownable {
    using SafeMath for uint256;

    event NewCharacter(uint id, uint name, uint identifier);

    // Structure de notre Token Character
    struct Character {
        uint identifier;
        string name;
    }

    // Liste des Character créés
    Character[] public characters; 

    mapping (uint => address) public characterToOwner;
    mapping (address => uint) internal numberOfCharacterByOwner;

    /**
     * Crée un nouvel NFT en l'associant à personne, il est accessible au premier acheteur
     * Méthode callable uniquement par le owner du Contract
     */
    function createCharacter(string _name) public onlyOwner {
        uint identifier = _generateIdentifier(_name); 
        uint id = characters.push(Character(identifier, _name));
        
        // On associe le Character à personne
        characterToOwner[id] = address(0x0);
        NewCharacter(id, _name, identifier);
    }

    function getCharactersByOwner() external view returns (uint[]) {
        uint[] memory charactersOfOwner = new Character[](numberOfCharacterByOwner[msg.sender]); 
        
        uint8 counter = 0;
        for (uint i = 0; i < characters.length; i++) {
            if (characterToOwner[i] == msg.sender) {
                charactersOfOwner[counter] = characters[i].identifier;
                counter++;
            }
        }

        return charactersOfOwner;
    }

    function getAllCharacters() external view returns (Character[]) {
        return characters;
    }

    function _generateIdentifier(string _str) private returns (uint) {
        return uint(keccak256(_str)) % (10 ^ 16);
    }
}