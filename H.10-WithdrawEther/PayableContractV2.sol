//SPDX-License-Identifier: LGPL-3.0-only

//Version
pragma solidity ^0.8.24;

    
//contract
contract PayableContractV2{

    //function + name +(arguments) + visibility + payable? + modifiers + value returned
    function sendEther() public payable {

    }
    
//payable is only necessary when sending eth to of the contract, to get send it out it is not necessary to be payable

    function withdrawEther(uint256 amount_) public {
        //recipient + .call + {value: ether value} + data

        (bool success, /*bytes memory data*/)= msg.sender.call{value: amount_}("");
        require(success, "Transfer failed");

    }
}