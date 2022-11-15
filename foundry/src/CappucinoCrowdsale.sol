pragma solidity ^0.6.0;

import "./Crowdsale.sol";

contract CappucinoCrowdsale is Crowdsale {
    constructor(
        uint256 rate, // rate in TKNbits
        address payable wallet,
        IERC20 token
    ) public Crowdsale(rate, wallet, token) {}
}
