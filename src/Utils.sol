// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { DSTest } from "ds-test/test.sol";
import { Vm } from "forge-std/Vm.sol";

//common utilities for forge tests
contract Utils is DSTest {
  Vm internal immutable vm = Vm(HEVM_ADDRESS);
  bytes32 internal nextUser = keccak256(abi.encodePacked("user address"));

  function getNextUserAddress() external returns (address payable) {
    //bytes32 to address conversion
    address payable user = payable(address(uint160(uint256(nextUser))));
    nextUser = keccak256(abi.encodePacked(nextUser));
    return user;
  }
  
  function getVm() public view returns (Vm) {
    return vm;
  }
}
