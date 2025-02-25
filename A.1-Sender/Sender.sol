//SPDX-License-Identifier: LGPL-3.0-only

//Version
pragma solidity ^0.8.24;

//Contract
contract Sender{

    address public owner;

    constructor(){
        owner = msg.sender;


    }
}