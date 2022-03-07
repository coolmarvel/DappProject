// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

import "SaleAnimalToken.sol";

contract MintAnimalToken is ERC721Enumerable {
    constructor() ERC721("coolmarvelAnimals", "CAS") {}

    SaleAnimalToken public saleAnimalToken;

    mapping(uint256 => uint256) public animalTypes;

    struct AnimalTokenData {
        uint256 animalTokenId;
        uint256 animalType;
        uint256 animalPrices;
    }

    function MintAnimalToken() public {
        uint256 animalTokenId = totalSupply() + 1;

        uint256 animalType = uint256(
            keccak256(
                abi.encodePacked(block.timestamp, msg.sender, animalTokenId)
            )
        );

        animalTypes[animalTokenId] = animalTypes;

        _mint(msg.sender, animalTokenId);
    }

    function getAnimalTokens(address _animalTokenOwner)
        public
        view
        returns (AnimalTokenData[] memory)
    {
        uint256 balanceLength = balanceOf(_animalTokenOwner);

        require(balanceLength != 0, "Owner did not have token.");

        AnimalTokenData[] memory AnimalTokenData = new AnimalTokenData[](
            balanceLength
        );

        for (uint256 i = 0; i < balanceLength; i++) {
            uint256 animalTokenId = tokenOfOwnerByIndex(_animalTokenOwner, i);
            uint256 animalTypes = animalTypes[animalTokenId];
            uint256 animalPrice = saleAnimalToken.getAnimalTokenPrice(
                animalTokenId
            );
        }

        return AnimalTokenData;
    }

    function setSaleAnimalToken(address _saleAnimalToken) public {
        saleAnimalToken = SaleAnimalToken(_saleAnimalToken);
    }
}
