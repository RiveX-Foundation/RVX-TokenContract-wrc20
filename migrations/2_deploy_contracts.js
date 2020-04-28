var TeamContract = artifacts.require("TeamContract");
var RVXToken = artifacts.require("RVXToken");

module.exports = function(deployer) {
  var creator=""; //creator of the contract
  var owner=""; //funds get sent to this address
  var unlockdate; //specify unlock dates (ie. each month)
  var contractName="team";
 // deployer.deploy(TeamContract,creator,owner,unlockdate,contractName);
  deployer.deploy(RVXToken,"0x07dee23b955e7dffff6ba88e8dc632e38c4b23a8");
};
