# Project: Create and Mint Token

In this project, we will create a smart contract using the "Solidity" programming language. The purpose of this project is to serve as a starting point for beginners who want to learn about Creating, minting tokens and understand how to access functions in a smart contract.

## Description

For this project, we will be using Remix - Ethereum IDE and Visual Studio Code. To download these software for Windows, you can follow the steps below:
URL for Visual Studio Code: https://code.visualstudio.com/
URL for Remix - Etherum IDE:https://github.com/ethereum/remix-desktop/releases
In this project we are going to use hardhat frame which provides a flexible and diverse Javascript-based framework for Ethereum blockchain developers.
URL to initialize the Hardhat framework with  Github project code:
In this project also we are going create 4 functions which are: function mint, function burn, function transfer, and function balanceOf. For this project defined 3 State variables which are string private name, string private symbol, and address private owner. We also defined constructor and modifier check the solidity code for more information.

## Getting Started

### Executing program

To run this program, you need to install and open Remix - Ethereum IDE and Visual Studio Code next you need create a folder by the name "you can enter any name" in the Visual Studio Code then open a terminal then type npm install --global hardhat command after that type npx hardhat init command then it type npx hardhat node then it will ask you for Welcome to Hardhat v2.14.0

 What do you want to do? ... 
> Create a JavaScript project
  Create a TypeScript project
  Create an empty hardhat.config.js
  Quit
> You can choose Create a JavaScript project then you need to type npm install --save-dev @nomicfoundation/hardhat-toolbox then you need to type npx hardhat node then it will display bunch of accounts with thier private keys and public keys. Now open Remix - Ethereum IDE then create a file by any name in the end add .sol for an example Project.sol then pasted the down below code then you need compile by clicking on SOLIDITY COMPILER then you need to click on DEPLOY & RUN TRANSACTIONS then click on ENVIRONMENT then select the Dev - Hardhat Provide then you need to deploy the contract by clicking on the deploy button then you can test the functions which is defined in the contract.

```javascript
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {

    
    string private name;
    string private symbol;
    address private owner;

   constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function!.");
        _;
    }

    mapping (address => uint) balance;

    event Mint (address indexed account, uint256 NumberOfTokens);
    event Burn (address indexed account, uint256 NumberOfTokens);
    event Transfer (address indexed account, address indexed to, uint256 NumberOfTokens);

    function mint(address to, uint256 amount) external onlyOwner {
        emit Mint (to, amount);
        balance [to] +=( amount);
    }

   function burn(uint256 amount) external {
        emit Burn (msg.sender, amount);
        balance[msg.sender] -= amount;
    }

    function transfer (address to, uint256 amount) external {
        require (balance [msg.sender] >0,"Your current balance should be greater than 0");
        emit Transfer (msg.sender, to, amount);
        balance [msg.sender] -= amount;
        balance [to] += amount;
    }

    function balanceOf (address account) external view returns (uint) {
        return balance [account];
    }
}


```

## Authors

Reahbar 
[@metacraftersio](https://twitter.com/metacraftersio)](https://github.com/Reahbar)](https://github.com/Reahbar)


## License

This project is licensed under the MIT License.
