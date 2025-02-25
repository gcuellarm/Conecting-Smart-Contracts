//SPDX-License-Identifier: LGPL-3.0-only

//Version
pragma solidity ^0.8.24;

    
//contract
contract PayableContractV2{

    //function + name +(arguments) + visibility + payable? + modifiers + value returned
    function sendEther() public payable {

    }

/*
1. send(): returns a boolean that show if the transaction has succeded or not. It will fail if more than 2300 gas is spent.
2. transfer(): this won't return a boolean that show if the transaction has succeded or not. It will fail if more than 2300 gas is spent.
3. call(): this is the most recommended option. No needs to implement interfaces to call functions from other contracts. Ether can be sent with no need to write parameters.
*/

//payable is only necessary when sending eth to of the contract, to  send it out it is not necessary to be payable

    function withdrawEther(uint256 amount_) public {
        //recipient + .call + {value: ether value} + data

        (bool success, /*bytes memory data*/)= msg.sender.call{value: amount_}("");
        require(success, "Transfer failed");

    }
}


/*
1. fallback: if "call" has data, or if the data part has a signature function from other contract, then fallback() will be called (if "fallback" and "receive" are available)
2. receive(): if data is empty then receive() will be called. This is the most common option.
In case none of them are available in a smart contract, ether can't be received.
*/