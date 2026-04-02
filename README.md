# Real Estate Tokenization (ERC-3643)

A professional-grade implementation for bringing Real World Assets (RWA) on-chain. This repository utilizes the ERC-3643 standard to represent fractional ownership of physical property. Unlike standard ERC-20s, these tokens are "Permissioned," meaning transfers only succeed if both the sender and receiver satisfy specific compliance rules (KYC/AML).

## Core Features
* **Identity Registry:** Links wallet addresses to verified ONCHAINID profiles.
* **Compliance Engine:** Automated checks for investor limits, regional restrictions, and accredited status.
* **Claim-Based Transfers:** Users must hold a valid "Claim" (issued by a trusted third party) to hold the token.
* **Flat Architecture:** Single-directory layout for the Token, Identity Registry, and Compliance modules.

## Workflow
1. **Verify:** Investors undergo KYC and receive a digital identity claim.
2. **Mint:** The property is appraised at $1,000,000 and 1,000,000 tokens are minted.
3. **Trade:** Tokens are traded; the contract checks the Identity Registry before every `transfer()`.
4. **Distribute:** Rental income is distributed to token holders proportionally.

## Setup
1. `npm install`
2. Deploy `IdentityRegistry.sol` and `RealEstateToken.sol`.
