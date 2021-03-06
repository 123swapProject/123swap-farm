import "@123swap/123swap-lib/contracts/token/BEP20/BEP20.sol";

/**
 * @title TokenTimelock
 * @dev TokenTimelock is a token holder contract that will allow a
 * beneficiary to extract the tokens after a given release time
 */
contract TokenTimelock {
  // BEP20 basic token contract being held
  BEP20 public token;

  // beneficiary of tokens after they are released
  address public beneficiary;

  // timestamp when token release is enabled
  uint256 public releaseTime;

  constructor(BEP20 _token, address _beneficiary, uint256 _releaseTime) public {
    // solium-disable-next-line security/no-block-members
    require(_releaseTime > block.timestamp);
    token = _token;
    beneficiary = _beneficiary;
    releaseTime = _releaseTime;
  }

  /**
   * @notice Transfers tokens held by timelock to beneficiary.
   */
  function release() public {
    // solium-disable-next-line security/no-block-members
    require(block.timestamp >= releaseTime);

    uint256 amount = token.balanceOf(address(this));
    require(amount > 0);

    token.transfer(beneficiary, amount);
  }
}