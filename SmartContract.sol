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
