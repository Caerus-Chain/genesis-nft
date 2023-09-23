const hre = require("hardhat");

async function main() {
  // Deploy the contract
  const GenesisNFT = await hre.ethers.getContractFactory("GenesisNFT");
  const genesisNFT = await GenesisNFT.deploy();

  await genesisNFT.deployed();

  console.log("GenesisNFT deployed to:", genesisNFT.address);
}

// If the script fails, the promise will reject, causing the process to exit
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
