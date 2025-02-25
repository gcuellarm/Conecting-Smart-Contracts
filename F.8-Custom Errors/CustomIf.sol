//SPDX-License-Identifier: LGPL-3.0-only

//Version
pragma solidity ^0.8.24;


error SenderNotAdmin(address);


//contract
contract RequireTest{

    address public admin;

    constructor(address admin_) {
        admin = admin_;
    }


    //Function + if check: msg.sender = admin
    function checkAdmin() public view{
        if(msg.sender != admin) revert();
    }

    //Function + require check: msg.sender = admin
    function checkAdminRequire() public view{
        require(msg.sender == admin, "Msg.sender is not the admin.");
    }

    //Punto 7, If custom:
    function checkAdminCustomErrors() public view{
        if(msg.sender != admin) revert SenderNotAdmin(msg.sender);
    }
}