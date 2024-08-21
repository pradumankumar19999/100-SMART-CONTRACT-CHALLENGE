// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
contract helloWorld{
    string private _message;
    event MessageUpdated(string message);

    constructor(string memory _initialMessage){
        _message=_initialMessage;
        emit MessageUpdated(_initialMessage);
    }
    function setMessage(string calldata _newMessage)external {
        _message=_newMessage;
        emit MessageUpdated(_newMessage);
    }
    function getMessage()external view returns(string memory){
     return _message;
    }

}