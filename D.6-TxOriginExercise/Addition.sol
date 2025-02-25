//SPDX-License-Identifier: LGPL-3.0-only

//Version
pragma solidity ^0.8.24;

import "./interfaces/IResultado.sol";
    
//contract
contract Addition{

    //Objeto: para inicializarlo hace falta una interfaz y una dirección (interfaz + address)
    address public resultado;

    constructor(address resultado_){
        resultado = resultado_;
        
    }

    function suma(uint num1_, uint num2_) external{
        uint resultado_ = num1_ + num2_;
        IResultado(resultado).setResult(resultado_);
    }

    function setFee(uint256 newFee_) external{
        IResultado(resultado).setFee(newFee_);
    }
    
}