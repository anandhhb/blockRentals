const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

const blockRentalModule = buildModule("blockRentalModule", (m) => {
  const blockrental = m.contract("blockRental");

  return { blockrental };
});

module.exports = blockRentalModule;