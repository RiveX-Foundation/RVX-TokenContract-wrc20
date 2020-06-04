module.exports = {
  networks: {
    live: {
      host: 'localhost',
      port: 8686,
      network_id: '*',
      gas: 8000000,
      gasPrice: 180e9,
      from: '0xd0573f4fb4c0f021a2714ed77f483b8cde76771b'
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
