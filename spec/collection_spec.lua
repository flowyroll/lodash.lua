local _ = require('lodash')
describe('Collections', function()
    it('should support chunk', function() 
        assert.are.equal( _.str(_.chunk({'x', 'y', 'z', 1, 2, 3, 4, true , false}, 4)) 
            , '{{"x", "y", "z", 1}, {2, 3, 4, true}, {false}}' )
        assert.are.equal( _.str(_.chunk({'x', 'y', 'z', 1, 2, 3, 4, true , false}, 3)) 
            , '{{"x", "y", "z"}, {1, 2, 3}, {4, true, false}}' )
    end)
    it('should report failed test', function() 
        assert.are.equal( _.str(_.chunk({'x', 'y', 'z', 1, 2, 3, 4, true , false}, 4)) 
            , '{{"x", "y", "z" {2, 3, 4, true}, {false}}' )
    end)
end)