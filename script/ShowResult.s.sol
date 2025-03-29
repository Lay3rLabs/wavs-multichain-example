// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

import {SimpleTrigger} from "contracts/WavsTrigger.sol";
import {SimpleSubmit} from "contracts/WavsSubmit.sol";
import {ITypes} from "interfaces/ITypes.sol";
import {Common} from "script/Common.s.sol";
import {console} from "forge-std/console.sol";

/// @dev Script to show the result of a trigger
contract ShowResult is Common {
    function run(string calldata serviceTriggerAddr) public view {
        SimpleTrigger trigger = SimpleTrigger(vm.parseAddress(serviceTriggerAddr));


        ITypes.TriggerId triggerId = trigger.nextTriggerId();
        console.log("Next TriggerId", ITypes.TriggerId.unwrap(triggerId));
    }

    function getData(string calldata serviceHandlerAddr, uint64 trigger) public view {
        SimpleSubmit submit = SimpleSubmit(vm.parseAddress(serviceHandlerAddr));

        ITypes.TriggerId triggerId = ITypes.TriggerId.wrap(1);
        bytes memory data = submit.getData(triggerId);
        console.log("Data:", string(data));
    }
}
