//SPDX-License-Identifier: LGPL-3.0-only

//Version
pragma solidity ^0.8.24;

    
//contract
contract PayableContract{

    //Payable-Receive-Fallback (one of them) is necessary for a contract to receive or send eth
    //function + name +(arguments) + visibility + payable? + modifiers + value returned
    function sendEther() public payable {

    }
}