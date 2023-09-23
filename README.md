# GenesisNFT Contract
`GenesisNFT` is a genesis NFT smart contract that allows users to mint their own unique NFT tokens. The contract ensures that each user can mint only one NFT.

### Methods:
1. **mintGenesisNFT()**
- Mints a new unique NFT for the message sender.
- The caller must not have minted a token before.

## Prerequisites
- **Node.js** v12+ LTS and npm (comes with Node)
- **Hardhat**

## Installation
Clone the repository:
```
git clone https://github.com/Caerus-Chain/genesis-nft
```
Navigate to the project folder:
```
cd genesis-nft
```
Install dependencies:
```
npm install
```

## Set Up Configuration:
1. Review the `.example.env` file.
2. Create a `.env` file based on the example and adjust the values as needed.

For Linux or macOS:
```
cp .example.env .env
```
For Windows:
```
copy .example.env .env
```

## Compilation
Compile the smart contracts using Hardhat:
```
npx hardhat compile
```

## Quick Start Guide
### 1. Testing
Run the following command to execute the contract tests. Make sure you've written the tests in your Hardhat project's `test` directory.
```
npx hardhat test
```

### 2. Deployment:
Run the following command to compile the contracts using the Solidity compiler and deploy the `GenesisNFT` to your Caerus network.
```
npx hardhat run scripts/deploy.js --network caerus
```

## Conclusion
If you would like to contribute to the project, please fork the repository, make your changes, and then submit a pull request. We appreciate all contributions and feedback!