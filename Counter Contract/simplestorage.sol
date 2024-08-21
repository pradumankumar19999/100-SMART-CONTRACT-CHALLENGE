// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
contract simpleStorage{
    uint256 private storedNumber;
    event NumberUpadated(uint256 newNumber);

    function storeNumber(uint256 newnumber)external{
        storedNumber=newnumber;
        emit NumberUpadated(newnumber);
    }
    function retrieveNumber()external view returns(uint256){
        return storedNumber;
    }
}