// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
contract ownerShaip{
    address private owner;
    event ownershipTransfer(address indexed  previousowner,address indexed newOwner);

modifier onlyOwner(){
    require(msg.sender==owner,"not a owner");
    _;
}
constructor(){
    owner=msg.sender;
    emit ownershipTransfer(address(0), msg.sender);
}
function getOwner()external view returns (address){
    return owner;
}

function transferOwnership(address newOwner)external onlyOwner{
    require(newOwner != address(0), "address zero is not a newOwner");
    emit ownershipTransfer(owner, newOwner);
    owner=newOwner;
}
}