local _ = require('lodash')
describe('Number module', function()
    it('should support inRange', function()
        assert.is.equal(true, _.inRange(-3, -4, 8))
        assert.is.equal(false, _.inRange(-3, -1, 8))
    end)
end)