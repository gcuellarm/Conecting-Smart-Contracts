# 🖇️ Connecting Smart Contracts.
The aim of this project is to try and improve new skills connecting smart contracts. New things such as msg.sender/tx.origin, send/withdraw functions or send/transfer/call functions are used in this part to explore new concepts in solidity.


## 📃 Concepts
The things worked out in this project are:

| Sender | Custom Errors | **Origin** *exercise*   |
|:-----------:|:-----------:|:-----------:|
| **Interfaces**    | **Payable functions**    | **Require**    |
| **Sender** *exercise*   | **Withdrawing Ether**   |**Send** -**Transfer** - **Call**    |



## 🔎 Contract Details
### 👤 Sender
The first one is focused on the msg.sender theoretical part, to see who or what is the sender (or owner in our case).

### ⛓️‍ Interfaces
This part shows how to connect two (or more) smart contracts in order to use a function (or more) from a different contract. To accomplish this, we need to create a new folder to keep the interface, which will look like this:
```solidity
interface IResultado{
    function setResult(uint num_) external;       
}
```
As it can be seen in that code, we are stating a function that must have been created first in a contract:
```solidity
contract Result{
    uint public result;
    function setResult(uint num_) external {
        result = num_;
    }
}
```
Now, to make use of this "setResult" function, we go to our main contract and import the interface so we can get an instance of iT:
```solidity
import "./interfaces/IResultado.sol";
contract Addition{
    address public resultado;
    constructor(address resultado_){
        resultado = resultado_;
    }

    function suma(uint num1_, uint num2_) external{
        uint resultado_ = num1_ + num2_;
        IResultado(resultado).setResult(resultado_);
    }
}
```
Let's emphasize in the important line:
```solidity
IResultado(resultado).setResult(resultado_);
```

### ✏️‍ Exercise with interfaces and msg.sender
In this exercise we mix the two previous points seen. It is the same calculator we have in the second point (using the interface the same way), but in this case a fee can be set but only if msg.sender is admin. Admin is needed to initialize the contract, being sent at the start. In case the address setting the fee is not the admin's address it will revert.
```solidity
function setFee(uint256 newFee_) external{
    if(msg.sender != admin) revert();
    fee = newFee_;
}
```

### ✏️‍ Exercise with interfaces and tx.origin
The concept here is the same we have seen in the previous section, but this time the address allowed to set the fee must be the origin of the process. With this we can see the difference between the sender and the origin.
```solidity
function setFee(uint256 newFee_) external{
    if(tx.origin != admin) revert();
    fee = newFee_;
}
```

### 🔒‍ Require
Require bring us the opportunity to check a condition and sending back a message in case the condition is not true. It needs more *gas* than "if" but is more interesting. In case the condition is not met, the function will not be executed:
```solidity
function checkAdminRequire() public view{
    require(msg.sender == admin, "Msg.sender is not the admin.");
}
```

### ✅❌ Custom Errors
In this section, all the three ways to check conditions are compared, trying the custom error for the first time. First of all, out of the contract scope we define the error (with the type of parameter that will be checked):
```solidity
error SenderNotAdmin(address);
```
To test it, we create a normal if but when we add the "revert()" function, we omit the "()" and call the error created previously with the parameter:
```solidity
function checkAdminCustomErrors() public view{
    if(msg.sender != admin) revert SenderNotAdmin(msg.sender);
}
```

### 💸 Payable functions
A payable function is necessary if we want our contract to be able to receive ether (payments in general). Knowing this, the structure of a function now is the next one:  
*function + name + (arguments) + visibility + payable? + modifiers + value returned*:
```solidity
function sendEther() public payable {}
```

### ↖️💲 Withdrawing Ether
To withdraw ether, we need the following structure for our function:  
``` solidity
"recipient + .call + {value: ether value} + data":

function withdrawEther(uint256 amount_) public {
    (bool success, /*bytes memory data*/)= msg.sender.call{value: amount_}("");
    require(success, "Transfer failed");
}
```

### ↗️💲 Send, transfer and call
These three functions can be used to send Ether, but actually only one of them is recommended (and more efficient). **Send()** gives back a boolean showing success or failure but if the cost of *gas* >= 2300 it will fail. **Transfer()** works the same way as *send()* (will not execute if *gas* >= 2300), but without the success/failure boolean. **Call()** is the most recommended option. It doesn't need to implement interfaces and needs no extra information to send ether.  
**send()**:
```solidity
address payable recipient = 0xAddress;
bool sent = recipient.send(1 ether);
```
**transfer()**:
```solidity
address payable recipient = 0xAddress;
recipient.transfer(1 ether);
```
**call()**:
```solidity
(bool success, )= msg.sender.call{value: amount_}("");
require(success, "Transfer failed");
```


## Tech Stack

**Client:** Solidity

**IDE:** Visual Studio Code, Remix IDE


## Authors

- [@gcuellarm](https://www.github.com/gcuellarm)
