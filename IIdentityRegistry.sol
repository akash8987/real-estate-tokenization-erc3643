// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IIdentityRegistry {
    function isVerified(address _userAddress) external view returns (bool);
    function contains(address _userAddress) external view returns (bool);
}
