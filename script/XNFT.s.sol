// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "forge-std/Script.sol";
import {XNFT} from "../src/XNFT.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployXNFT is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        HelperConfig helperConfig = new HelperConfig();
        (address router, address link, uint64 chainSelector) = helperConfig.activeNetworkConfig();
        vm.startBroadcast(deployerPrivateKey);

        XNFT xNft = new XNFT(router, link, chainSelector);

        console.log("XNFT deployed to ", address(xNft));

        vm.stopBroadcast();
    }
}
