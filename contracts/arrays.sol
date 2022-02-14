// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Array {
    // Several ways to initialize an array
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3];
    // Fixed sized array, all elements initialize to 0
    uint[10] public FixedSizeArr;

    function get(uint i) public view returns (uint) {
        return arr[i];
    }

    // Solidity can return the entire array.
    // But this function should be avoided for
    // arrays that can grow indefinitely in length.
    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    function push(uint i) public {
        // Append to array
        // This will increase the array length by 1.
        arr.push(i);
    }

    function pop() public {
        // Remove last element from array
        // This will decrease the array length by 1
        arr.pop();
    }

    function getLength() public view returns (uint) {
        return arr.length;
    }

    function remove(uint index) public {
        // Delete does not change the array length.
        // It resets the value at index to it's default value,
        // in this case 0
        delete arr[index];
    }
    
    //if you want to change the length of the array then replace the index you want to change with the last value in the array and pop

    function deleteAndResize(uint deleteIndex)public {
    uint lastValue = arr2[arr2.length-1];
    arr2[deleteIndex] = lastValue;
        arr2.pop;
    }

    function examples() external pure returns (uint){
        // create array in memory, only fixed size can be created
        uint[] memory a = new uint[](5);
        return a[1];
    }

    
}
