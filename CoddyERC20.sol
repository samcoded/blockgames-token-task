// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CodedToken is ERC20 {

uint256 initialSupply = 1000000e18;
    constructor() ERC20("Code Test", "CST") {
        _mint(msg.sender, initialSupply);
    }


    function buyToken(address receiver) public payable {
        uint256 amount = msg.value;

        // token exchange rate is 1 ETH to 1000e18 tokens
        // i.e 1e18 wei is 1000 tokens
        uint256 tokenAmount = amount * 1000;
        _mint(receiver, tokenAmount);
        // increment totalsupply
        initialSupply += tokenAmount;
    }
}
