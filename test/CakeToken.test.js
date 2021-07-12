const { assert } = require("chai");

const OneTwoThreeToken = artifacts.require('OneTwoThreeToken');

contract('OneTwoThreeToken', ([alice, bob, carol, dev, minter]) => {
    beforeEach(async () => {
        this.cake = await OneTwoThreeToken.new({ from: minter });
    });


    it('mint', async () => {
        await this.cake.mint(alice, 1000, { from: minter });
        assert.equal((await this.cake.balanceOf(alice)).toString(), '1000');
    })
});
