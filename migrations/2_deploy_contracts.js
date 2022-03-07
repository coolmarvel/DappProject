var MintAnimalToken = artifacts.require("./MintAnimalToken.sol");

module.exports = function(deployer) {
  deployer.deploy(MintAnimalToken);
};
