pragma solidity 0.8.8;

// We first import some OpenZeppelin Contracts.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// We inherit the contract we imported. This means we'll have access
// to the inherited contract's methods.
contract MyEpicNFT is ERC721URIStorage {
  // Magic given to us by OpenZeppelin to help us keep track of tokenIds.
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  // We need to pass the name of our NFTs token and it's symbol.
  constructor() ERC721 ("SquareNFT", "SQUARE") {
    console.log("This is my NFT contract. Woah!");
  }

  // A function our user will hit to get their NFT.
  function makeAnEpicNFT() public {
     // Get the current tokenId, this starts at 0.
    uint256 newItemId = _tokenIds.current();

     // Actually mint the NFT to the sender using msg.sender.
    _safeMint(msg.sender, newItemId);

    // Set the NFTs data.
    _setTokenURI(newItemId, "data:application/json;base64,ewogICAgIm5hbWUiOiAiQ29zbWljVGhvckhhbW1lciIsCiAgICAiZGVzY3JpcHRpb24iOiAiYW4gTkZUIGZyb20gdGhlIGNvc21vcyIsCiAgICAiaW1hZ2UiOiAiZGF0YTppbWFnZS9zdmcreG1sO2Jhc2U2NCxQSE4yWnlCM2FXUjBhRDBpTlRFeWNIZ2lJR2hsYVdkb2REMGlOVEV5Y0hnaUlIWnBaWGRDYjNnOUlqQWdNQ0ExTVRJZ05URXlJaUI0Yld4dWN6MGlhSFIwY0RvdkwzZDNkeTUzTXk1dmNtY3ZNakF3TUM5emRtY2lQanh3WVhSb0lHWnBiR3c5SWlNd01EQWlJR1E5SWsweU5qWXVNRE16SURNeUxqUXliQzA0TlM0eU16Z2dPRFV1TWpNNGRqRTVMamM1T1V3eU9EVXVPRE15SURNeUxqUXlhQzB4T1M0M09UbDZiVFF4TGpVeU9DQXpMamN5T0V3eE9EUXVOVEl6SURFMU9TNHhPRFpzTVRZNExqSTVNU0F4TmpndU1qbE1ORGMxTGpnMU1pQXlNRFF1TkRRZ016QTNMalUySURNMkxqRTFlbTB4TnpJdU1ESWdNVGt3TGpBeVRETTNOQzQxTkRJZ016TXhMakl3TldneE9TNDNPVGxzT0RVdU1qTTRMVGcxTGpJek9IWXRNVGt1TnprNWVtMHRNak01TGprd015QXhNeTQyTWpkc0xUa3VPU0E1TGprZ016SXVOVEkzSURNeUxqVXlPQ0E1TGprdE9TNDVMVE15TGpVeU55MHpNaTQxTWpoNmJTMHlNaTQyTWpjZ01qSXVOakkzYkMweU15NDFNamdnTWpNdU5USTNhRFEzTGpBMU5Xd3RNak11TlRJM0xUSXpMalV5TjNwdExUUXhMalV5T0NBME1TNDFNamRzTFRJM0xqSTFOU0F5Tnk0eU5UWm9OalV1TURVMGJESTNMakkxTmkweU55NHlOVFpvTFRZMUxqQTFOWHB0TFRRMUxqSTFOU0EwTlM0eU5UWnNMVEkzTGpJMU5DQXlOeTR5TlRSb05qVXVNRFUwYkRJM0xqSTFOQzB5Tnk0eU5UUm9MVFkxTGpBMU5IcHRMVEkzTGpJMU5DQTBOUzR5TlRSc01qTXVOVEkzSURJekxqVXlOeUF5TXk0MU1qY3RNak11TlRJM2FDMDBOeTR3TlRSNmJTMHlNUzQzTWprZ015NDNNamhzTFRrdU9EazRJRGt1T0RrNUlETXlMalV5TnlBek1pNDFNamNnT1M0NE9UZ3RPUzQ0T1RndE16SXVOVEkzTFRNeUxqVXlOM3B0TFRNNExqYzJOeUF4T0M0NE9UbHNMVGN1TlRBMElESXlMalV4TWlBek55NHpPRGdnTXpjdU16ZzRJREl5TGpVeE1pMDNMalV3TkhZdE1USXVOREUwVERVMExqa3pJRFF4Tnk0d09EWklOREl1TlRFNGVpSXZQand2YzNablBnPT0iCn0=");
    // print to console if NFT is minted
    console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

    // Increment the counter for when the next NFT is minted.
    _tokenIds.increment();
  }
}