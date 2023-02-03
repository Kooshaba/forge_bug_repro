// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import {OwnableStorage} from "./OwnableStorage.sol";
import {LibA} from "./LibA.sol";
import {Utils} from "./Utils.sol";

import "forge-std/console.sol";

contract Run {
    function run() public {
        console.log("deployer", msg.sender);

        Utils u = new Utils();
        OwnableStorage s = new OwnableStorage();

        address otherUser = u.getNextUserAddress();
        console.log("otherUser", otherUser);

        s.transferOwnership(otherUser);

        u.getVm().startPrank(otherUser);
        LibA.publicSet(s, 1); // Fails
        LibA.internalSet(s, 2); // Succeeds
        u.getVm().stopPrank();
    }
}