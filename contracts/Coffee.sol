// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Coffee{

    struct Memo {
        string Name;
        string Message;
        uint timestamp;
        address from;
    }
    Memo[] memos;
    address payable owner;
    constructor(){
        owner = payable(msg.sender);
    }
    function buyCoffee (string calldata name , string calldata message) external payable{
        require(msg.value>0 , "Please pay more than 0 Ether");
        owner.transfer(msg.value);
        memos.push(Memo(name,message,block.timestamp,msg.sender));
    }
    function getMemos() public view returns(Memo[] memory){
        return memos;
    }
}