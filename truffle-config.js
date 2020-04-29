module.exports = {
  networks: {
    live: {
      host: 'localhost',
      port: 8686,
      network_id: '*',
      gas: 8000000,
      gasPrice: 180e9,
      // following address needed to be replaced with unlocked account on gwan node
      from: '0xec4a0c8bf6b63e01a95e0e25048194180cdf8895'
  }
  },
  compilers: {
    solc: {
      version:"0.4.24",
      evmVersion:"byzantium",
      settings: {
        optimizer: {
          enabled: true,
          runs: 200   // Optimize for how many times you intend to run the code
        }   // ex:  "0.4.20". (Default: Truffle's installed solc)
    }   
}
}
};
