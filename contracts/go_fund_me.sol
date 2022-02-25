pragma solidity ^0.8.10;

contract ComeFundMe{
    address public owner ;

    event Deposit(uint amount);
    event Withdraw(uint amount);
    constructor() {
        owner = msg.sender;
    }

    receive () payable external {
        emit Deposit(msg.value);
    }

   modifier onlyAdmin(){
        require (msg.sender == owner, "Not Authorised");
        _;
    }

    function withdrawFunds() external onlyAdmin{
        emit Withdraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    }
    

}