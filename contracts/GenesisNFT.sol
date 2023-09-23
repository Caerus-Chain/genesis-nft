// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract GenesisNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // Mapping from token ID to metadata URI
    mapping(uint256 => string) private _tokenURIs;

    // Mapping to track if an address has already minted a token
    mapping(address => bool) private _hasMinted;

    constructor() ERC721("GenesisNFT", "GNFT") {}

    function mintGenesisNFT(string memory tokenURI) external returns (uint256) {
        // Require that the address has not minted a token yet
        require(!_hasMinted[msg.sender], "You have already minted a token");

        _tokenIds.increment();
        uint256 tokenId = _tokenIds.current();

        _mint(msg.sender, tokenId);
        _setTokenURI(tokenId, tokenURI);

        // Mark the sender as having minted a token
        _hasMinted[msg.sender] = true;

        return tokenId;
    }

    function _setTokenURI(
        uint256 tokenId,
        string memory _tokenURI
    ) internal virtual override {
        require(_exists(tokenId), "URI set of nonexistent token");
        _tokenURIs[tokenId] = _tokenURI;
    }
}
