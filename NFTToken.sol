// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

import "https://github.com/0xcert/ethereum-erc721/blob/master/src/contracts/tokens/nf-token-metadata.sol";
import "https://github.com/0xcert/ethereum-erc721/blob/master/src/contracts/ownership/ownable.sol";

contract newNFT is NFTokenMetadata, Ownable {

  constructor() {
    nftName = "MY-NEW-NFT";
    nftSymbol = "TES";
  }

  function mint(address _to, uint256 _tokenId, string calldata _uri) external onlyOwner {
    super._mint(_to, _tokenId);
    super._setTokenUri(_tokenId, _uri);
  }

}