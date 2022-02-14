// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AllErrors{

    function testRequired(uint x)external pure {
        require(x < 10, "x> 10");
        //code comes in here
    }

    function testRevert(uint x)external pure {
       if(x > 10){
           revert("x>10");
       }
    }
    
    function testAssert(address owner)external view{
        owner = msg.sender;
        assert(owner == msg.sender);
        // assert always gives a true value. If the value is false then the value is false 
    }

   // custom error
    error InsufficientBalance(uint balance, uint withdrawAmount);


    function testCustomError(uint _withdrawAmount) public view {
        uint bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});
        }
        //We use customErrors to save gas and they are used only wirh "revert"
    }
}