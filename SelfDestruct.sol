// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract SelfDestruct{

 event Deposit(uint256 indexed  amount);
 event WithDraw(uint256 indexed  amount);
 
 address  public owner;

 constructor(){

    owner = msg.sender;

 }

 receive() external  payable {

   emit Deposit(msg.value);

 }

  error onlyOwner();

 //this function forcefully sends the all ether to owner of this contract by selfdestruct
 function withDraw() external {

     if(owner != msg.sender){

         revert onlyOwner();
     }

     emit WithDraw(address(this).balance);
     selfdestruct (payable (msg.sender));


 }

}