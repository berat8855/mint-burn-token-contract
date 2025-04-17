# mint-burn-token-contract
# Mint-Burn Custom ERC20 Token

This Solidity smart contract implements a basic ERC20-style token with the following features:

- `mint(address to, uint amount)` — Only the owner can mint new tokens
- `burn(uint amount)` — Any user can burn their own tokens
- `approve(address spender, uint amount)` — Token owner grants spending permission
- `transferFrom(address from, address to, uint amount)` — Spender transfers tokens with permission
- `onlyOwner` modifier — Protects admin-only functions like minting

## Deployment

Tested and verified on Remix IDE.  
Fully open-source and ready for Ethereum, BSC, or Polygon deployment.
