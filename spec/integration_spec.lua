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
    it('every all', function()
        local IsDataInDifferentSets = function(dataArray, groupArray)
            for i, group in ipairs(groupArray) do
                local flag = false
                for j, value in ipairs(dataArray) do
                    if _.includes(group, value) then
                        if flag then
                            return false
                        else
                            flag = true
                        end
                    end
                end
                if not flag then
                    return false
                end
            end
            return true
        end

        local values1 = {1, 2, 3, 4}
        local values2 = {1, 2, 3, 40}
        local values3 = {1, 2, 3, 5}
        local set1 = {1, 5, 10}
        local set2 = {2, 6, 8}
        local set3 = {4, 7, 9}
        local set4 = {3, 17, 29}
        local groups = {set1, set2, set3 , set4}

        assert.truthy(IsDataInDifferentSets(values1, groups))
        assert.falsy(IsDataInDifferentSets(values2, groups)) -- false because 40 is not in any set
        assert.falsy(IsDataInDifferentSets(values3, groups)) -- false because 1 and 5 are in the same set
    end)
end)