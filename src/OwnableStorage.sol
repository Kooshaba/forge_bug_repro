// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract OwnableStorage {
    address public owner;
    uint256 public x;

    constructor () {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Ownable: caller is not the owner");
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        owner = newOwner;
    }

    function set(uint256 _x) public onlyOwner {
        x = _x;
    }

    function get() public view returns (uint256) {
        return x;
    }
}