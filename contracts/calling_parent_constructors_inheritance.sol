// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;



contract A {
    string public name;

    constructor(string memory _name ){
        name = _name;
    }
}

contract B {
    string public class;

    constructor(string memory _class ){
        class = _class;
    }
}

contract C is A("name"),B("Jhaymes"){

}

contract D is A, B{
    constructor(string memory name, string memory class)A(name) B(class){

    }
}

///not that two methods can be used in one contract