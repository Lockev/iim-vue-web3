const CryptoCharacter = artifacts.require("CryptoCharacter");
const web3 = require('web3');


module.exports = function(deployer) {
  const name = 'CryptoCharacter';
  const symbol = 'CCH';
  const cost = web3.utils.toWei('0.0001', 'ether');

  deployer.deploy(CryptoCharacter, name, symbol, cost);
};
