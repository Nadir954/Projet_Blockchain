const path = require('path');

module.exports = {
  contracts_build_directory: path.join(__dirname, "vapp/src/contracts"),

  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    },
    develop: {
      port: 8545
    }
  },

  compilers: {
    solc: {
      version: "0.8.0", // Utilisez la version de Solidity compatible avec votre contrat
      settings: {
        optimizer: {
          enabled: true,
          runs: 200
        },
      }
    }
  }
};
