// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/Test.sol";
import "../src/TokenForge.sol";

contract TokenForgeTest is Test {
    TokenForge forge;

    function setUp() public {
        forge = new TokenForge();
    }

    function testMint() public {
        forge.mint(10);
        assertEq(forge.totalSupply(), 10);
    }
}
