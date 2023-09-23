const { expect } = require("chai");

describe("GenesisNFT contract", function () {
  let genesisNFT;
  let user;

  beforeEach(async function () {
    const GenesisNFT = await ethers.getContractFactory("GenesisNFT");
    [user] = await ethers.getSigners();

    genesisNFT = await GenesisNFT.deploy();
    await genesisNFT.deployed();
  });

  describe("Minting", function () {
    it("Should mint a token to an address", async function () {
      await genesisNFT.connect(user).mintGenesisNFT();
      expect(await genesisNFT.ownerOf(1)).to.equal(user.address);
    });

    it("Should prevent multiple minting from the same address", async function () {
      await genesisNFT.connect(user).mintGenesisNFT();

      await expect(
        genesisNFT.connect(user).mintGenesisNFT()
      ).to.be.revertedWith("GenesisNFT::mintGenesisNFT: You have already minted a token");
    });
  });
});
