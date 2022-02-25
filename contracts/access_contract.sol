// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;


contract AccessControl{
    //roles => account => bool


    event GrantRole(bytes32 indexed role , address indexed  account)
    event RovokeRole(bytes32 indexed role , address indexed  account)

    mapping(bytes32 => mapping(address => bool)) public roles;

    bytes32 private constant ADMIN = kaccak256(abi.encodePacked("ADMIN"));
    bytes32 private constant USER = kaccak256(abi.encodePacked("uSER"));

    modifier onlyAdmin(bytes32 _role){
        require (roles[_role][msg.sender], "Not Authorised");
        _;
    }

    constructor(){
        _setRoles(ADMIN, msg.sender);
    }

    function _setRoles(bytes32 _roles, address _account) internal {
        roles[_roles][account] = true;
        emit GrantRole(_roles, account);
    }

    function setRoles(bytes32 _roles, address _account) external onlyAdmin(ADMIN){
        _setRoles(_roles, _account);
    }

    function revokeRoles(bytes32 _roles, address _account) external onlyAdmin(ADMIN){
         roles[_roles][account] = true;
        emit RevokeRole(_roles, account);
    }


}