//SPDX-License-Identifier: LGPL-3.0-only

//Version
pragma solidity ^0.8.24;

//contract
contract Result{
    uint public result;

    function setResult(uint num_) external {
        result = num_;
    }
}