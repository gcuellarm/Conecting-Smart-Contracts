//SPDX-License-Identifier: LGPL-3.0-only

//Version
pragma solidity ^0.8.24;

    
//contract
contract ContractB{

    receive() external payable {}

    //withdraw ether
    function withdrawEther(uint256 amount_) public {
        //recipient + .call + {value: ether value} + data
        (bool success, )= msg.sender.call{value: amount_}("");
        require(success, "Transfer failed");

    }

}