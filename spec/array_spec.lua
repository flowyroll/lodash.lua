local _ = require('lodash')
describe('Array module', function()
    it('should support chunk', function() 
        local expected = '{{"x", "y", "z", 1}, {2, 3, 4, true}, {false}}' 
        local actual = _.str(_.chunk({'x', 'y', 'z', 1, 2, 3, 4, true , false}, 4))
        assert.are.equal(expected, actual)

        expected = '{{"x", "y", "z"}, {1, 2, 3}, {4, true, false}}'
        actual = _.str(_.chunk({'x', 'y', 'z', 1, 2, 3, 4, true , false}, 3)) 
        assert.are.equal(expected, actual)
    end)
    it('should support join', function() 
        local expected = 'x,y,z' 
        -- local actual = _.join({'x', 'y', 'z', 1, 2, 3, 4, true , false})
        local actual = _.join({'x', 'y', 'z'})
        assert.are.equal(expected, actual)

        assert.are.equal('x y z', _.join({'x', 'y', 'z'}, ' '))
    end)
end)