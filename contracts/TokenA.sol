pragma solidity 0.6.12;

import "./libs/MockBEP20.sol";

contract TokenA is MockBEP20 {
    constructor() public MockBEP20("Token A", "TKA", 1000000000000000000000) {}
}