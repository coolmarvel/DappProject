var SaleAnimalToken = artifacts.require("./SaleAnimalToken.sol");

module.exports = function(deployer) {
  deployer.deploy(SaleAnimalToken);
};
