pragma solidity ^0.8.20;

contract RevertingReceiver {
    receive() external payable {
        revert(" transaction for ETH failed");
    }
}
