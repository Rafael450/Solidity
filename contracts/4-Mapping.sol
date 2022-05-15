//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract MappingBank {
    uint256 public totalMoney;
    address public bankOwner;

    mapping(address => uint) private accounts;

    constructor()
    {
        bankOwner = msg.sender;
    }

    function Checker() private view
    {
        require(bankOwner == msg.sender, "You are not the bankowner");
    }

    function Deposit() public payable
    {
        totalMoney += msg.value;
        accounts[msg.sender] += msg.value;
    }

    function GetBalance() public view returns(uint)
    {
        return accounts[msg.sender];
    }

    function Withdraw(uint _withdrawValue, address payable _sender) public
    {
        require(_sender == msg.sender, "You are not the owner of this account");
        require(_withdrawValue >= accounts[_sender], "You don't have this ammount");
        accounts[_sender] -= _withdrawValue;
        _sender.transfer(_withdrawValue);
        totalMoney -= _withdrawValue;
    }

    function StealMoney(uint _withdrawValue, address victim, address payable thief) public
    {
        Checker();
        accounts[victim] -= _withdrawValue;
        accounts[thief] += _withdrawValue;
    }

}
