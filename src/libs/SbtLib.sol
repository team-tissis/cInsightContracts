// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

library SbtLib {
    bytes32 constant SBT_STRUCT_POSITION = keccak256("chaininsight");

    struct SbtStruct {
        address contractOwner;
        string name;
        string symbol;
        string baseURI;
        bytes32 validator;
        mapping(bytes4 => bool) interfaces;
        mapping(address => uint256) balances;
    }

    // get struct stored at posititon
    //https://solidity-by-example.org/app/write-to-any-slot/
    function sbtStorage() internal pure returns (SbtStruct storage sbtstruct) {
        /** メモ: @shion
         * slot: storageは32バイトの領域を確保するが，その領域をslotと呼ぶ
         * positionのstrunctを取得する
         */
        bytes32 position = SBT_STRUCT_POSITION;
        assembly {
            sbtstruct.slot := position
        }
    }
}