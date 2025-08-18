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
        assertEq(forge.balanceOf(address(0)), 0);
        vm.prank(janet);
        forge.deposit{value: 1 ether}();
        assertEq(forge.balanceOf(janet), 1 ether);
        assertEq(forge.totalSupply(), 1 ether);
    }

    function testTransfer() public {
        vm.prank(james);
        forge.deposit{value: 1 ether}();
        vm.prank(james);
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

    function testDepositEmitsEventsCorrectly() public {
        vm.prank(janet);
        vm.expectEmit(true, true, false, true);
        emit TokenForge.Deposit(janet, 1 ether);
        vm.expectEmit(true, true, false, true);
        emit TokenForge.Transfer(address(0), janet, 1 ether);
        forge.deposit{value: 1 ether}();
    }

    function testTransferEmitsEvents() public {
        vm.prank(janet);
        forge.deposit{value: 1 ether}();
        vm.expectEmit(true, true, false, true);
        emit TokenForge.Transfer(address(janet), address(james), 0.5 ether);
        vm.prank(janet);
        forge.transfer(address(james), 0.5 ether);
        assertEq(forge.balanceOf(james), 0.5 ether);
        assertEq(forge.balanceOf(janet), 0.5 ether);
    }

    function testFuzzTransfer(address to, uint256 amount) public {
        amount = bound(amount, 1 wei, 1 ether);
        vm.assume(to != address(0));
        vm.assume(to != james);
        vm.assume(to != janet);
        vm.prank(james);
        forge.deposit{value: 1 ether}();
        vm.prank(james);
        forge.transfer(to, amount);
        assertEq(forge.balanceOf(james), 1 ether - amount);
        assertEq(forge.balanceOf(to), amount);
    }

    function testTotalSupplyAfterMultipleDeposits() public {
        vm.prank(janet);
        forge.deposit{value: 2 ether}();
        vm.prank(james);
        forge.deposit{value: 3 ether}();
        assertEq(forge.totalSupply(), 5 ether);
    }
}
