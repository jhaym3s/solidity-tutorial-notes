// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract Kill{

    constructor()payable{}

   function destroy()external {
    selfdestruct(payable(msg.sender));
   }

   function testCall()external pure returns (uint){
       return 123;
   }
}

    contract Test{
        function getBalance()external view returns(uint){
            return address(this).balance;
        }

        function forceSendEther(Kill _kill)external {
            _kill.destroy();
        }
    }