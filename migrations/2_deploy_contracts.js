var TeamContract = artifacts.require("TeamContract");
var RVXToken = artifacts.require("RVXToken");

module.exports = function(deployer) {
  var rvxowner = "0x1506d7a71a502d9b7abfec80a43666295e9fb2eb"
  var creator="0x07dee23b955e7dffff6ba88e8dc632e38c4b23a8"; //creator of the contract
  var owner="0x6e023d8916e3aa71b8f18fb05f3f9168e90d95fd"; //funds get sent to this address
  var unlockdateteam = [1620568800,1623247200,1625839200,1628517600,1631196000,1633788000,1636466400,1639058400,1641736800,1644415200]; //specify unlock dates (ie. each month)
  var unlockdateprivate = [1594303200,1596981600,1599660000,1602252000,1604930400,1607522400]; //specify unlock dates (ie. each month)
  var unlockdateecosystem = [1620568800,1636466400,1652104800,1668002400,1683640800,1699538400];
  var unlockdatefoundation = [1620568800,1636466400,1652104800,1668002400];
  var unlockdatepartner = [1620568800,1623247200,1625839200,1628517600,1631196000,1633788000,1636466400,1639058400,1641736800,1644415200];
  var contractName="team";
  //deployer.deploy(TeamContract,creator,owner,unlockdate,contractName);
 deployer.deploy(RVXToken,rvxowner);


};
