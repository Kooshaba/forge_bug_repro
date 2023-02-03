// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import {OwnableStorage} from "./OwnableStorage.sol";

library LibA {
    function publicSet(OwnableStorage _storage, uint256 x) public {
        _storage.set(x);
    }

    function internalSet(OwnableStorage _storage, uint256 x) internal {
        _storage.set(x);
    }
}