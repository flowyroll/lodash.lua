local _ = require('lodash')
describe('Integration', function()
    it('verify if a nested structure has certain value. pick(at) + flatten + some', function()
        local msg = {
            _CMD_ID_ = 217292,
            att = 3,
            att_ally = {0, 0},
            def = 9,
            def_ally = {1, 3},
            fn = function()
            end
        }
        local result = _.flatten(_.at(msg, 'att', 'att_ally', 'def', 'def_ally'))
        assert.are.same({3, 0, 0, 9, 1, 3}, result)
        result = _.some(result, function(v) return v == 0 end)
        assert.truthy(result)
    end)
end)