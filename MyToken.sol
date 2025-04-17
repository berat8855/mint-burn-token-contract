// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) public allowances;
    uint public totalSupply;
    address public owner;

    event Transfer(address indexed from, address indexed to, uint amount);
    event Approval(address indexed owner, address indexed spender, uint amount);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Sadece owner kullanabilir");
        _;
    }

    function mint(address to, uint amount) public onlyOwner {
        balances[to] += amount;
        totalSupply += amount;
        emit Transfer(address(0), to, amount);
    }

    function burn(uint amount) public {
        require(balances[msg.sender] >= amount, "Yetersiz bakiye");
        balances[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }

    function approve(address spender, uint amount) public {
        allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
    }

    function transferFrom(address from, address to, uint amount) public {
        require(balances[from] >= amount, "Yetersiz bakiye");
        require(allowances[from][msg.sender] >= amount, "Yetersiz izin");

        balances[from] -= amount;
        balances[to] += amount;
        allowances[from][msg.sender] -= amount;

        emit Transfer(from, to, amount);
    }

    function balanceOf(address account) public view returns (uint) {
        return balances[account];
    }
}
