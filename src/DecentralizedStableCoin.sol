// SPDX-License-Identifier: MIT

// This is considered an Exogenous, Decentralized, Anchored (pegged), Crypto Collateralized low volatility coin

// Layout of Contract:
// version
// imports
// interfaces, libraries, contracts
// errors
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

pragma solidity 0.8.28;

import {ERC20Burnable, ERC20} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/*
 * @title: DecentralizedStableCoin
 * @author: Otis Tran
 * @notice This contract implements a Decentralized Stable Coin (DSC) with algorithmic minting and burning.
 * @dev The DSC contract is governed by the DSCEngine contract. This contract implements the ERC20 interface with minting and burning functionalities.
 * Collateral: Exogenous (ETH & BTC)
 * Minting: Algorithmic
 * Relative Stability: Pegged to USD
 */
contract DecentralizedStableCoin is ERC20Burnable, Ownable {
    /**
     * @dev Error: The amount must be more than zero.
     */
    error DecentralizedStableCoin__MustBeMoreThanZero();
    /**
     * @dev Error: The burn amount exceeds the balance of the sender.
     */
    error DecentralizedStableCoin__BurnAmountExceedsBalance();
    /**
     * @dev Error: The address is the zero address.
     */
    error DecentralizedStableCoin__NotZeroAddress();

    /**
     * @notice Constructor for the Decentralized Stable Coin contract.
     * @dev This constructor sets the initial owner and initializes the ERC20 token with a name and symbol.
     */
    constructor() ERC20("Decentralized Stable Coin", "DSC") Ownable() {}

    /**
     * @notice Burn a specified amount of DSC tokens.
     * @param _amount The amount of tokens to burn.
     * @dev Only the owner can burn tokens. It checks that the amount is greater than zero and does not exceed the sender's balance.
     *
     */
    function burn(uint256 _amount) public override onlyOwner {
        uint256 balance = balanceOf(msg.sender);
        if (_amount <= 0) {
            revert DecentralizedStableCoin__MustBeMoreThanZero();
        }
        if (_amount > balance) {
            revert DecentralizedStableCoin__BurnAmountExceedsBalance();
        }
        super.burn(_amount);
    }

    /**
     * @notice Mint a specified amount of DSC tokens to a given address.
     * @param _to The address to mint the tokens to.
     * @param _amount The amount of tokens to mint.
     * @dev Only the owner can mint tokens. It checks that the address is not the zero address and the amount is greater than zero.
     * @return true if mint is successful.
     */
    function mint(address _to, uint256 _amount) external onlyOwner returns (bool) {
        if (_to == address(0)) {
            revert DecentralizedStableCoin__NotZeroAddress();
        }
        if (_amount <= 0) {
            revert DecentralizedStableCoin__MustBeMoreThanZero();
        }
        _mint(_to, _amount);
        return true;
    }
}
