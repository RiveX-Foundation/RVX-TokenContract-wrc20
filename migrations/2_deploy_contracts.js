var TeamContract = artifacts.require("TeamContract");
var RVXToken = artifacts.require("RVXToken");
var USDT = artifacts.require("USDT");
var PrivateSaleContract = artifacts.require("PrivateSaleContract");
var EcosystemContract = artifacts.require("EcosystemContract");
var FoundationContract = artifacts.require("FoundationContract");
var PartnerContract = artifacts.require("PartnerContract");

module.exports = function(deployer) {
  var rvxowner = "0x1506d7a71a502d9b7abfec80a43666295e9fb2eb";
  var teamcreator = "0x99895bf4aa5055d81851c8fde1bf72c9743169e4";
  var foundationcreator = "0xb15ed1f34c228295a2d32ce6f2e1d3ad9afbca6f";
  var privatesalecreator = "0x3e651767f098f2b0a0b6f98843aef86a15393db5";
  var ecosystemcreator = "0x1fcd62d5525de15e2dde1aa66fbc7709c6412e79";
  var partnerscreator = "0x288ce10d2afe3f24d99280806c7b87541f49d657";

  var beneficiaryplaceholder = "0xd92e469a62c48bf12b9d49e3dee98173c24bee88";


  var unlockdateteam = [1620568800,1623247200,1625839200,1628517600,1631196000,1633788000,1636466400,1639058400,1641736800,1644415200]; //specify unlock dates (ie. each month)
  var unlockdateprivate = [1594303200,1596981600,1599660000,1602252000,1604930400,1607522400]; //specify unlock dates (ie. each month)
  var unlockdateecosystem = [1620568800,1636466400,1652104800,1668002400,1683640800,1699538400];
  var unlockdatefoundation = [1620568800,1636466400,1652104800,1668002400];
  var unlockdatepartner = [1620568800,1623247200,1625839200,1628517600,1631196000,1633788000,1636466400,1639058400,1641736800,1644415200];
  
  var teamname="Team";
  var foundationname="Foundation";
  var privatesalename="Private Sale";
  var ecosystemanme = "Ecosystem";
  var partnersname = "Partners";

 deployer.deploy(USDT);

 /*deployer.deploy(TeamContract,teamcreator,beneficiaryplaceholder,unlockdateteam,teamname);
 deployer.deploy(PrivateSaleContract,privatesalecreator,beneficiaryplaceholder,unlockdateprivate,privatesalename);
 deployer.deploy(EcosystemContract,ecosystemcreator,beneficiaryplaceholder,unlockdateecosystem,ecosystemanme);
 deployer.deploy(FoundationContract,foundationcreator,beneficiaryplaceholder,unlockdatefoundation,foundationname);
 deployer.deploy(PartnerContract,partnerscreator,beneficiaryplaceholder,unlockdatepartner,partnersname);*/

};
