//SPDX-License-Identifier: LGPL-3.0-only

//Version
pragma solidity ^0.8.24;

import "./interfaces/IResultado.sol";
    
//contract
contract Addition{

    //Object: to initialize it, it is necessary an interface + an address
    address public result;
    constructor(address result_){
        result = result_;
    }

    function suma(uint num1_, uint num2_) external{
        uint result_ = num1_ + num2_;
        IResultado(result).setResult(result_);
    }
}