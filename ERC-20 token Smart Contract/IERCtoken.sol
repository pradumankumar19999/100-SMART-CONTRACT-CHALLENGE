// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;
interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}
 contract ERC20Token is IERC20{
string public name='MyToken';
string public symbol='MTK';
uint8 public decimals=18;
uint256 private _totalSupply;
mapping(address => uint256)private _balance;
mapping (address =>mapping (address => uint256))private _allowance;

constructor(uint256 initialSupply){
_totalSupply=initialSupply *(10 ** uint256(decimals));
_balance[msg.sender]=_totalSupply;
emit Transfer(address(0),msg.sender,_totalSupply);
}

function totalSupply()public  view override  returns(uint256){
    return _totalSupply;
}
 function balanceOf(address account) external view override  returns (uint256){
        return _balance[account];
    }
    function transfer(address recipient, uint256 amount) external override returns (bool){
        require(recipient != address(0),"Erc20 Transfer to the zero Address");
        require(_balance[msg.sender]>amount, "ERC20 transfer amount exceed the balance");
        _balance[msg.sender] -= amount;
        _balance[recipient]  += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }
 function allowance(address owner, address spender) external view override returns (uint256){
 return _allowance[owner][spender];
 }

    function approve(address spender, uint256 amount)public override  returns (bool){
     require(spender != address(0),"ERC20 approve to the zero addresss");  
      _allowance[msg.sender][spender]=amount;
      emit Approval(msg.sender, spender,amount);
      return true;
    }
function transferFrom(address sender, address recipient, uint256 amount)public override  returns (bool){
require(sender != address(0),"Erc20 Transfer to the zero Address");
 require(recipient != address(0),"Erc20 Transfer to the zero Address");
  require(_balance[sender] >= amount,"ERC20 transfer amount exceed the balance");
  require(_allowance[sender][msg.sender] >= amount,"ERC20 transfer amount exceed the balance");
  _balance[sender] -=amount;
  _balance[recipient] += amount;
  _allowance[sender][msg.sender] -= amount;
  emit Transfer(sender, recipient, amount);
  return true;
}

}