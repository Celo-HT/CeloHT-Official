// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

/**
 * @title CeloHTRegistryV2
 * @notice Public-interest registry for CeloHT initiatives
 * @dev No token, no funds, no fundraising
 */
contract CeloHTRegistryV2 is Initializable, AccessControlUpgradeable, PausableUpgradeable, UUPSUpgradeable {
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");
    bytes32 public constant OPERATOR_ROLE = keccak256("OPERATOR_ROLE");

    struct Initiative {
        string name;
        string pillar; // Education | Agents | Reforestation
        string metadataURI;
        uint64 createdAt;
        bool active;
    }

    Initiative[] private initiatives;

    event InitiativeAdded(uint256 indexed id, string name, string pillar);
    event InitiativeStatus(uint256 indexed id, bool active);

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(address admin) external initializer {
        __AccessControl_init();
        __Pausable_init();
        __UUPSUpgradeable_init();

        _grantRole(DEFAULT_ADMIN_ROLE, admin);
        _grantRole(ADMIN_ROLE, admin);
    }

    function addInitiative(
        string calldata name,
        string calldata pillar,
        string calldata metadataURI
    ) external whenNotPaused onlyRole(ADMIN_ROLE) {
        initiatives.push(Initiative({
            name: name,
            pillar: pillar,
            metadataURI: metadataURI,
            createdAt: uint64(block.timestamp),
            active: true
        }));
        emit InitiativeAdded(initiatives.length - 1, name, pillar);
    }

    function setStatus(uint256 id, bool active) external onlyRole(ADMIN_ROLE) {
        require(id < initiatives.length, "Invalid id");
        initiatives[id].active = active;
        emit InitiativeStatus(id, active);
    }

    function pause() external onlyRole(ADMIN_ROLE) { _pause(); }
    function unpause() external onlyRole(ADMIN_ROLE) { _unpause(); }

    function totalInitiatives() external view returns (uint256) {
        return initiatives.length;
    }

    function getInitiative(uint256 id) external view returns (Initiative memory) {
        require(id < initiatives.length, "Invalid id");
        return initiatives[id];
    }

    function _authorizeUpgrade(address) internal override onlyRole(DEFAULT_ADMIN_ROLE) {}
}