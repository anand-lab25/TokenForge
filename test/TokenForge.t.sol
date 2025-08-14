// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/Test.sol";
import "../src/TokenForge.sol";

contract TokenForgeTest is Test {
    TokenForge forge;
    address janet = address(0xBC11);
    address james = address(0xAB115);

    function setUp() public {
        forge = new TokenForge();
        vm.deal(janet, 10 ether);
        vm.deal(james, 10 ether);
    }

    function testDeposit() public {
        vm.prank(janet);
        forge.deposit{value: 1 ether}();
        assertEq(forge.balanceOf(janet), 1 ether);
        assertEq(forge.totalSupply(), 1 ether);
    }

    function testTransfer() public {
        vm.prank(james);
        forge.deposit{value: 1 ether}();
        forge.transfer(janet, 0.5 ether);
        assertEq(forge.balanceOf(janet), 0.5 ether);
        assertEq(forge.balanceOf(james), 0.5 ether);
    }

    function testZeroDepositReverts() public {
        vm.expectRevert(TokenForge.ZeroDeposit.selector);
        forge.deposit{value: 0}();
    }

    function testInsufficientTransferReverts() public {
        vm.prank(james);
        forge.deposit{value: 1 ether}();
        vm.expectRevert(TokenForge.InsufficientBalance.selector);
        forge.transfer(janet, 2 ether);
    }
}
