//SPDX-License-Identifier: LGPL-3.0-only

//Version
pragma solidity ^0.8.24;

import "./interfaces/IResultado.sol";
    
//contract
contract Addition{

    address public result;
    address public admin;
    uint256 public fee;

    constructor(address result_, address admin_){
        result = result_;
        admin = admin_;
        fee = 5;
    }

    function suma(uint num1_, uint num2_) external{
        uint result_ = num1_ + num2_;
        IResultado(result).setResult(result_);
    }

    function setFee(uint256 newFee_) external{
        if(msg.sender != admin) revert();
        fee = newFee_;
    }
}