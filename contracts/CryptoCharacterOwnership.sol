// contracts/CryptoCharacterHelper.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "./CryptoCharacterFactory.sol";


contract CryptoCharacterOwnership is ERC721, CryptoCharacterFactory {
    using SafeMath for uint256;

    event CharacterBought(address _owner, uint _tokenId); 

    constructor() ERC721("CryptoCharacter", "CCH") {}


    function buyCharacter(uint _tokenId) public payable canGetMoreCharacter(numberOfCharacterByOwner[msg.sender]) sentEnoughEther {
        require(characterToOwner[_tokenId] == address(0x0));
        
        characterToOwner[_tokenId] = msg.sender;
        numberOfCharacterByOwner[msg.sender] = numberOfCharacterByOwner[msg.sender].add(1); 

        CharacterBought(msg.sender, _tokenId);
    }

    // Si isOwnerOf(characterToOwner[_tokenId]) ne fonctionne pas alors inverser l'héritage.
    function transfer(address _to, uint256 _tokenId) public isOwnerOf(characterToOwner[_tokenId]) {
        _transfer(msg.sender, _to, _tokenId);
    }


    function _transfer(address _from, address _to, uint256 _tokenId) private {
        numberOfCharacterByOwner[_from] = numberOfCharacterByOwner[_from].sub(1);
        numberOfCharacterByOwner[_to] = numberOfCharacterByOwner[_to].add(1);
        characterToOwner[_tokenId] = _to;

        // From IERC721.sol file
        Transfer(_from, _to, _tokenId);
    }
}
