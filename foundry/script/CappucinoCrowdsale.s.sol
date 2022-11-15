pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "../src/CappucinoCrowdsale.sol";

contract CappucinoCrowdsaleDeploymentScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address tokenAddress = vm.envAddress("TOKEN_ADDRESS");
        address walletAddress = vm.envAddress("WALLET_ADDRESS");
        vm.startBroadcast(deployerPrivateKey);

        CappucinoCrowdsale cappucino = new CappucinoCrowdsale(
            1 * 10**18,
            payable(walletAddress),
            IERC20(tokenAddress)
        );

        vm.stopBroadcast();
    }
}
