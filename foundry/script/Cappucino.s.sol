pragma solidity ^0.8.4;

import "forge-std/Script.sol";
import "../src/Cappucino.sol";

contract CappucinoDeploymentScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        Cappucino cappucino = new Cappucino();

        vm.stopBroadcast();
    }
}
