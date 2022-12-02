local _ = require('lodash')
describe('Utility', function()
    it('support union find', function()
        local unionfind = _.unionFind.create()
        unionfind:union(1, 2)
        unionfind:union(4, 6)
        unionfind:union(7, 4)

        assert.truthy(unionfind:connected(6, 7)) -- return true
        assert.truthy(unionfind:connected(4, 7)) -- return true
        assert.truthy(unionfind:connected(6, 4)) -- return true
        assert.falsy(unionfind:connected(6, 1)) -- return false
        assert.falsy(unionfind:connected(7, 2)) -- return false
    end)
    it('support union find 2', function()
        local unionfind = _.unionFind.create()
        local union1 = {2, 4, 6}
        local union2 = {1, 3, 5}
        local sample1 = 4
        local sample2 = 3
        local sample3 = 2
        local unionArray = function(unionFind, array)
            _.forEach(_.zip(_.initial(array), _.tail(array)), function(v)
                unionFind:union(v[1], v[2])
            end)
        end
        unionArray(unionfind, union1)
        unionArray(unionfind, union2)

        assert.falsy(unionfind:connected(sample1, sample2))
        assert.truthy(unionfind:connected(sample1, sample3))
    end)
    it('support union find 2', function()
        local unionfind = _.unionFind.create()
        unionfind:union(1, 1)

        assert.truthy(unionfind:connected(1, 1)) -- return true
        assert.falsy(unionfind:connected(1, 2)) -- return false
    end)
end)