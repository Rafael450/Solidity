//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract PausingDeletingConstructor {
    address owner;
    bool paused;

    constructor() 
    {
        owner = msg.sender;
    }

    function Requirements() private view
    {
        require(owner == msg.sender, "Not the owner!");
        require(paused == false, "The contract is paused by the owner!");
    }

    function WithdrawAll(address payable _receiver) public
    {
        Requirements();
        _receiver.transfer(address(this).balance);
    }

    function DestroyContract(address payable _receiver) public
    {
        Requirements();
        selfdestruct(_receiver);
    }



}
