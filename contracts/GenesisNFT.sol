// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract GenesisNFT is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    mapping(address => bool) private _hasMinted;

    constructor() ERC721("GenesisNFT", "GNFT") {}

    function mintGenesisNFT() external returns (uint256) {
        require(!_hasMinted[msg.sender], "You have already minted a token");

        _tokenIds.increment();
        uint256 tokenId = _tokenIds.current();

        _mint(msg.sender, tokenId);

        _hasMinted[msg.sender] = true;

        return tokenId;
    }
}
