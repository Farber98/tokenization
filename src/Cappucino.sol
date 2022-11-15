// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "openzeppelin-contracts/token/ERC20/ERC20.sol";
import "openzeppelin-contracts/access/Ownable.sol";

contract Cappucino is ERC20, Ownable {
    constructor() ERC20("Cappucino", "KPU") {
        _mint(msg.sender, 100 * 10**decimals());
    }
}
