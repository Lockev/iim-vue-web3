// contracts/CryptoCharacterFactory.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract CryptoCharacter is ERC721 {
    
    uint256 public cost = 1 ether;  
    uint256 public maxSupply = 2;
    mapping (address => uint256) totalSupplyPerOwner;
    
    constructor(string memory _name, string memory _symbol, uint256 _cost) 
        ERC721(_name, _symbol) {        
        cost = _cost;

        characters.push(Character("Nicolas", address(0x0), "https://gateway.pinata.cloud/ipfs/Qmb7WGCT77uNa38oLJqRAkjDxQZsjuKnRFY3RKPPBe8gMv"));
        characters.push(Character("Nicolas2", address(0x0), "https://gateway.pinata.cloud/ipfs/QmQkz7R2RiNyGVckR2WuDNf37wucBBg1ywM3anPnngi4Tm"));
        characters.push(Character("Guillaume", address(0x0), "https://gateway.pinata.cloud/ipfs/QmaT5PtZGSDLGPMn6as6QGhiXRhfE9Rbky98cLj7yXyCTm"));
        characters.push(Character("Guillaume2", address(0x0), "https://gateway.pinata.cloud/ipfs/QmdrSSMQrmpZdFiHMWFrvSou8M7us993fo3mHucA65WU1S"));
        characters.push(Character("Gaelle", address(0x0), "https://gateway.pinata.cloud/ipfs/QmYfJNHPBMzoav65CwoZ38eJFpSRtWUM5MBKp6jTkm8Lqs"));
        characters.push(Character("Antoine", address(0x0), "https://gateway.pinata.cloud/ipfs/QmZjpkT68hh78yKBejtRutEDC2Gz2coUGV4cYuTVD1XTw6"));
        characters.push(Character("Lydia", address(0x0), "https://gateway.pinata.cloud/ipfs/QmbXGrva3sBefjC4GQdvgzxSCJ7hbZszt5b4RhKkwgGDYv"));
        characters.push(Character("Paul-Olivier", address(0x0), "https://gateway.pinata.cloud/ipfs/QmRguBErkDF6JEfkJogHwPxygVT1McLYzhrNPZvPdox5J9"));
        characters.push(Character("Ruben", address(0x0), "https://gateway.pinata.cloud/ipfs/QmT7X2pDWGs3TFiH5hiE58izrkfZb7opZJCPECkzzURGLk"));
        characters.push(Character("Jules", address(0x0), "https://gateway.pinata.cloud/ipfs/QmbPqHjupk669rgZCuJkvFSaWXrcNHbiovou6Tx8knWXUK"));
    }

    struct Character {
        string name;
        address owner;
        string img;
    }

    // Liste des Characters créés
    Character[] public characters; 

    function mint(uint256 _id) public payable {
        require(totalSupplyPerOwner[msg.sender] < 2, "Vous avez depasse le nombre de NFT achetable");
        require(msg.value >= cost, "Montant d'ether non correct");
        require(characters[_id].owner == address(0x0), "Le NFT que vous avez choisi est deja pris");

        characters[_id].owner = msg.sender;
        totalSupplyPerOwner[msg.sender]++;
        _safeMint(msg.sender, _id); 
    }

    function getCharacter(uint256 _id) external view returns (Character memory) {
        return characters[_id - 1];
    }

    function getCharacters() external view returns (Character[] memory) {
        return characters;
    }
}