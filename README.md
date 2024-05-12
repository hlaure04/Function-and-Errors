# Functions and Errors

## Description
**This project involves writing a smart contract in Solidity that implements the `require()`, `assert()`, and `revert()` statements. These statements are crucial for error handling in smart contracts. They help ensure that conditions are met before executing functions, and if not, they revert the state changes and provide an error message.

The contract includes a token system with `mint` and `burn` functions. The `mint` function allows an address to create new tokens, while the `burn` function allows an address to destroy tokens. Both functions implement the `require()`, `assert()`, and `revert()` statements to handle errors and ensure the integrity of the transactions.**

# Getting Launched
Installing Remix Online IDE
- Complete all required installations ahead of time.
- Get "ErrorHandling.sol" from the original file and transfer it.
- Go to https://remix.ethereum.org to start the IDE
- Go to the [.sol file to view the code](https://github.com/hlaure04/Smart-Contract/blob/main/SmartContract.sol) to view the code

# Code Preview
  
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract HandleErrors {

    // Public variables
    string public tokenName = "Laure04";
    string public tokenAbbreviation = "LRE";
    uint public totalSupply = 10;
    uint public minimumMintable = 100;

    // Mapping variable to keep track of balances
    mapping(address => uint) public balances;

    // Mint function
    function mint(address _address, uint _value) public {
        
        // Require statement checks if the caller of the function is the address trying to mint tokens
        // If not, it will revert the transaction and provide the error message
        require(_address == msg.sender, "One person can only make tokens.");

        // If the value is less than the minimum mintable amount, the transaction is reverted with an error message
        // Otherwise, the total supply and the balance of the address are increased
        if (_value < minimumMintable) {
            revert("Small token mintable amount includes to be reached or exceeded.");
        } else {
            totalSupply += _value;
            balances[_address] += _value;
        }         
    }

    // Burn function
    function burn(address _address, uint _value) public {

        // Assert statement checks if the balance of the address is greater than or equal to the value to be burned
        // If not, it will throw an error and revert the state changes
        assert(balances[_address] >= _value);
        totalSupply -= _value;
        balances[_address] -= _value;
    }    
}

# Authors
Heleana V. Laure
8213709@ntc.edu.ph
