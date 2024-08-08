// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";

contract HelperConfig is Script {
    NetworkConfig public activeNetworkConfig;

    struct NetworkConfig {
        address router;
        address link;
        uint64 chainSelector;
    }

    constructor() {
        if (block.chainid == 421614) {
            activeNetworkConfig = _getArbitrumSepoliaConfig();
        } else if (block.chainid == 11155111) {
            activeNetworkConfig = _getSepoliaConfig();
        }
    }

    function _getArbitrumSepoliaConfig() internal pure returns (NetworkConfig memory ArbitrumSepoliaConfig) {
        ArbitrumSepoliaConfig = NetworkConfig({
            router: 0x2a9C5afB0d0e4BAb2BCdaE109EC4b0c4Be15a165,
            link: 0xb1D4538B4571d411F07960EF2838Ce337FE1E80E,
            chainSelector: 3478487238524512106
        });
    }

    function _getSepoliaConfig() internal pure returns (NetworkConfig memory SepoliaConfig) {
        SepoliaConfig = NetworkConfig({
            router: 0x0BF3dE8c5D3e8A2B34D2BEeB17ABfCeBaf363A59,
            link: 0x779877A7B0D9E8603169DdbD7836e478b4624789,
            chainSelector: 16015286601757825753
        });
    }
}
