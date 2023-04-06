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
        uint16 cost;
        string name;
        string rarity;
    }

    constructor() {
        rarity["normal"] = 0.001;
        rarity["rare"] = 0.005;
        rarity["legendary"] = 0.01;

        uint[] storage names = ["Nicolas", "Jules", "Guillaume", "Antoine"];
        for (uint i = 0; i < names.length; i++) {
            createCharacter(names[i]);
        }
    }

    // Liste des Characters créés
    Character[] public characters; 

    mapping (string => uint) public rarity;
    mapping (uint => address) public characterToOwner;
    mapping (address => uint) internal numberOfCharacterByOwner;

    /**
     * Crée un nouvel NFT en l'associant à personne, il est accessible au premier acheteur
     * Méthode callable uniquement par le owner du Contract
     */
    function createCharacter(string memory _name) public onlyOwner {
        uint identifier = _generateIdentifier(_name); 
        string characterRarity;
        uint cost;
        (characterRarity, cost) = _determineRarity(_name);


        uint id = characters.push(Character(identifier, _name, rarity, cost));
        
        // On associe le Character à personne
        characterToOwner[id] = address(0x0);
        NewCharacter(id, _name, identifier);
    }


    /**
     * Récupérer les Characters by owner
    */
    function getCharactersByOwner() external view returns (uint[]) {
        uint[] memory charactersOfOwner = new uint[](numberOfCharacterByOwner[msg.sender]); 
        
        uint8 counter = 0;
        for (uint i = 0; i < characters.length; i++) {
            if (characterToOwner[i] == msg.sender) {
                charactersOfOwner[counter] = characters[i].identifier;
                counter++;
            }
        }

        return charactersOfOwner;
    }

    
    /**
     * Récupérer l'ensemble des Characters
    */
    function getAllCharacters() external view returns (Character[] memory) {
        return characters;
    }

    /**
     * Récupérer les Characters disponibles
    */
    function getCharactersAvailable() external view returns (Character[] memory) {
        uint[] memory result = new Character[](characters.length); 
    
        uint8 counter = 0;
        for (uint i = 0; i < characters.lenght; i++) {
            if (characterToOwner[i] == address(0x0)) {
                result[counter] = characters[i];
                counter++;
            }
        }

        return counter;
    }

    
    /**
     * Générer l'identifiant
     */
    function _generateIdentifier(string memory _str) private returns (uint) {
        return uint(keccak256(_str)) % (10 ^ 16);
    }

    /**
     * Générer l'identifiant
     */
    function _determineRarity(string memory _str) private returns (string rarity, uint cost) {
        bytes32 hashFromStr = keccak256(_str); 
        
        uint8 lastDigit = hashFromStr[hashFromStr.length - 1 : hashFromStr.length];

        if (lastDigit >= 48 && lastDigit <= 57) {
            if (lastDigit == 57) {
                return ("legendary", rarity["legendary"]);    
            }

            return ("rare", rarity["rare"]);
        }
        
        return ("normal", rarity["normal"]);
    } 
}