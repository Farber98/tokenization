// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "forge-std/Test.sol";
import "../src/Cappucino.sol";

contract CappucinoTest is Test {
    Cappucino cappucino;
    address owner = address(0x1);
    address buyer = address(0x2);
    address buyer2 = address(0x3);

    function setUp() public {
        vm.startPrank(owner);
        cappucino = new Cappucino();
        vm.stopPrank();
    }

    function testNameIsCappucino() public {
        assertEq(cappucino.name(), "Cappucino");
    }

    function testSymbolIsKPU() public {
        assertEq(cappucino.symbol(), "KPU");
    }

    function testDecimalsAre18() public {
        assertEq(cappucino.decimals(), 18);
    }

    function testTotalSupplyIs100() public {
        assertEq(cappucino.totalSupply(), 100 * 10**cappucino.decimals());
    }

    function testTotalSupplyInOwnerAccountAndBuyerAccount() public {
        assertEq(cappucino.balanceOf(owner), cappucino.totalSupply());
        assertEq(cappucino.balanceOf(buyer), 0);
    }

    function testTransfer1TokenFromOwnerToBuyer() public {
        vm.startPrank(owner);

        cappucino.transfer(buyer, 1 * 10**cappucino.decimals());
        assertEq(
            cappucino.balanceOf(owner),
            cappucino.totalSupply() - 1 * 10**cappucino.decimals()
        );
        assertEq(cappucino.balanceOf(buyer), 1 * 10**cappucino.decimals());
        vm.stopPrank();
    }

    function testTransferMoreThanAvailableFromOwnerToBuyer() public {
        vm.startPrank(owner);
        vm.expectRevert(bytes("ERC20: transfer amount exceeds balance"));
        cappucino.transfer(buyer, 100000 ether);
        vm.stopPrank();
    }

    function testTransfer1TokenFromBuyerToBuyer2() public {
        testTransfer1TokenFromOwnerToBuyer();
        vm.startPrank(buyer);
        cappucino.transfer(buyer2, 1 * 10**cappucino.decimals());
        assertEq(cappucino.balanceOf(buyer), 0);
        assertEq(cappucino.balanceOf(buyer2), 1 * 10**cappucino.decimals());
        vm.stopPrank();
    }
}
