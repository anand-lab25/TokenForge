// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TokenForge {
    //ERC-20ish metadata
    string public constant name = "TokenForge";
    string public constant symbol = "TF";
    uint8 public constant decimals = 18;
    uint256 public totalSupply;
    //error
    error ZeroDeposit();
    error InsufficientBalance();
    error WithdrawFailed();
    //mapping
    mapping(address => uint256) public balanceOf;

    //constructor
    constructor() {}

    event Transfer(
        address indexed from,
        address indexed to,
        uint256 totalAmount
    );
    event Deposit(address indexed to, uint256 totalAmount);
    event Withdraw(address indexed from, uint256 amount);

    function deposit() public payable {
        if (msg.value == 0) revert ZeroDeposit();
        //mint wei in ratio 1:1
        balanceOf[msg.sender] += msg.value;
        totalSupply += msg.value;
        emit Deposit(msg.sender, msg.value);
        emit Transfer(address(0), msg.sender, msg.value);
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        if (balanceOf[msg.sender] < amount) revert InsufficientBalance();
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }

    function withdraw(uint256 amount) public {
        if (balanceOf[msg.sender] < amount) revert InsufficientBalance();
        balanceOf[msg.sender] -= amount;
        (bool success, ) = msg.sender.call{value: amount}("");
        if (!success) revert WithdrawFailed();
        totalSupply -= amount;
        emit Withdraw(msg.sender, amount);
    }

    function getTotalSupply() external view returns (uint256 amount) {
        return totalSupply;
    }

    /// @notice Convenience: send ETH directly to mint.
    receive() external payable {
        deposit();
    }
}
