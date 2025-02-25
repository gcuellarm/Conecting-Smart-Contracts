//SPDX-License-Identifier: LGPL-3.0-only

//Version
pragma solidity ^0.8.24;

//contract
contract Result{
    uint public result;
    uint256 public fee;
    address public admin;

    constructor(address admin_){
        admin = admin_;
        fee = 5;
    }


    function setResult(uint num_) external {
        result = num_;
    }

    function setFee(uint256 newFee_) external{
        if(tx.origin != admin) revert();
        fee = newFee_;
    }
}