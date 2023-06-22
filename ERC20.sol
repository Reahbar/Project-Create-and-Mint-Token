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

