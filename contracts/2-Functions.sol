//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Variables {
    uint256 public Myuint;
    address public myAd;

    function setUint(uint _myint) public
    {
        Myuint = _myint;
    }

    function setAddress(address _myaddress) public
    {
        myAd = _myaddress;
    }

    function getBalace() public view returns(uint)
    {
        return myAd.balance;
    }
}
