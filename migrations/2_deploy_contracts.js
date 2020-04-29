var TeamContract = artifacts.require("TeamContract");
var RVXToken = artifacts.require("RVXToken");

module.exports = function(deployer) {
  var creator="0x07dee23b955e7dffff6ba88e8dc632e38c4b23a8"; //creator of the contract
  var owner="0x6e023d8916e3aa71b8f18fb05f3f9168e90d95fd"; //funds get sent to this address
  var unlockdate = [1588158619,1588162080,1588165680]; //specify unlock dates (ie. each month)
  var contractName="team";
  deployer.deploy(TeamContract,creator,owner,unlockdate,contractName);
 // deployer.deploy(RVXToken,"0x6e023d8916e3aa71b8f18fb05f3f9168e90d95fd");
};
