// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CeloHTRegistry
 * @notice Registry transparan pou inisyativ CeloHT
 * @dev Pa gen token, pa gen levée de fonds
 */
contract CeloHTRegistry {
    address public admin;

    struct Initiative {
        string name;
        string pillar; // Education | Agents | Reforestation
        string metadataURI;
        uint256 createdAt;
    }

    Initiative[] public initiatives;

    event InitiativeAdded(uint256 indexed id, string name, string pillar);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    constructor(address _admin) {
        admin = _admin;
    }

    function addInitiative(
        string calldata name,
        string calldata pillar,
        string calldata metadataURI
    ) external onlyAdmin {
        initiatives.push(Initiative({
            name: name,
            pillar: pillar,
            metadataURI: metadataURI,
            createdAt: block.timestamp
        }));
        emit InitiativeAdded(initiatives.length - 1, name, pillar);
    }

    function totalInitiatives() external view returns (uint256) {
        return initiatives.length;
    }
}