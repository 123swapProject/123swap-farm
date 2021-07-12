pragma solidity 0.6.12;

import "./libs/MockBEP20.sol";

contract TokenB is MockBEP20 {
    constructor() public MockBEP20("Token B", "TKB", 1000000000000000000000) {}
}