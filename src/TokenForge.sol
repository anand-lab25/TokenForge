// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TokenForge {
    string public name = "TokenForge";
    uint256 public totalSupply;

    function mint(uint256 amount) public {
        totalSupply += amount;
    }
}
