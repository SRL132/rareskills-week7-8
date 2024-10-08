// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.0;

import "./mintable.sol";

/// @dev Run the template with
///      ```
///      solc-select use 0.8.0
///      echidna program-analysis/echidna/exercises/exercise3/template.sol --contract TestToken
///      ```
contract TestToken is MintableToken {
    address echidna = msg.sender;

    constructor() MintableToken(10_000) {
        owner = echidna;
    }

    //Add a property to check if echidna can mint more than 10,000 tokens.
    function echidna_test_balance() public view returns (bool) {
        return balances[msg.sender] <= 10_000;
    }

    function echidna_test_mintable() public view returns (bool) {
        return MintableToken(address(this)).totalMinted() <= 10_000;
    }
}
