// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IDContratoD {
    function setFee(uint256 _fee) external;
    function getFee() external view returns (uint256);
}

contract ContratoA {
    address payable public contractB;
    address public contractD;
    uint256 public fee;
    
    constructor(address _contractB, address _contractD) {
        contractB = payable(_contractB);
        contractD = _contractD;
    }

    // Receive Ether from ContractC
    receive() external payable {}


    // Function that checks the fee and sends ether to contractB if it's valid
    function sendAEtherToContratoB(uint256 amountToSend_) external {
        uint256 currentFee = IDContratoD(contractD).getFee();
        require(currentFee <= 5, "Fee is higher than 5, Ether can't be sent.");

        uint256 balanceA = address(this).balance;
        
        // transfer() to send ether to contractB
        contractB.transfer(amountToSend_);
        
        // Verificar que el saldo de A haya disminuido
        require(address(this).balance == balanceA - amountToSend_, "Contract A balance didn't adjust properly.");
    }

//retirar ether
    function withdrawEther(uint256 amount_) public {
        //recipient + .call + {value: ether value} + data

        (bool success, )= msg.sender.call{value: amount_}("");
        require(success, "Transfer failed");

    }
}