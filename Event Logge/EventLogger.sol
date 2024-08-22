// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
contract EventLogger{
    event LogUint(uint indexed value);
    event LogString(string indexed message);
    event LogAddress(address indexed account);
    event LogBool(bool indexed  status);
    function logUint(uint _value)public{
        emit LogUint(_value);
    }
    
    function logString(string memory _message)public{
        emit LogString(_message);
    }

    function logAddress(address _account)public{
    emit LogAddress(_account);
    }
    function logStatus(bool _status)public{
        emit LogBool(_status);
    }
}