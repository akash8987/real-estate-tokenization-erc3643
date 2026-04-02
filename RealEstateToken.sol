// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./IIdentityRegistry.sol";

/**
 * @title RealEstateToken
 * @dev Restricted ERC-20 for fractional property ownership.
 */
contract RealEstateToken is ERC20, Ownable {
    IIdentityRegistry public identityRegistry;

    event IdentityRegistryUpdated(address indexed newRegistry);

    constructor(
        string memory name, 
        string memory symbol, 
        address _identityRegistry
    ) ERC20(name, symbol) Ownable(msg.sender) {
        identityRegistry = IIdentityRegistry(_identityRegistry);
    }

    function setIdentityRegistry(address _identityRegistry) external onlyOwner {
        identityRegistry = IIdentityRegistry(_identityRegistry);
        emit IdentityRegistryUpdated(_identityRegistry);
    }

    /**
     * @dev Overrides transfer to enforce KYC compliance via Identity Registry.
     */
    function _update(address from, address to, uint256 value) internal override {
        if (from != address(0) && to != address(0)) {
            require(identityRegistry.isVerified(from), "Sender not verified");
            require(identityRegistry.isVerified(to), "Receiver not verified");
        }
        super._update(from, to, value);
    }

    function mint(address to, uint256 amount) external onlyOwner {
        require(identityRegistry.isVerified(to), "Recipient not verified");
        _mint(to, amount);
    }
}
