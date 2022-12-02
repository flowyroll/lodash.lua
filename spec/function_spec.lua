local _ = require('lodash')
describe('Function module', function()
    it('should support after', function()
        local trueAfter3Call = _.after(3, function() return true end)
        assert.falsy(trueAfter3Call()) -- nil
        assert.falsy(trueAfter3Call()) -- nil
        assert.falsy(trueAfter3Call()) -- nil
        assert.is.equal(true, trueAfter3Call())
    end)
    it('should support ary', function()
        local sum = function(...)
            local t = _.table(...)
            local s = 0
            for i, v in ipairs(t) do
                s = s + v
            end
            return s;
        end

        local sumOnly3 =_.ary(sum, 3)
        assert.is.equal(6, sumOnly3(1, 2, 3, 4, 5))
    end)
    it('should support before', function()
        local trueBefore3Call = _.before(3, function(a) return a end)
        assert.is.equal(1, trueBefore3Call(1))
        assert.is.equal(2, trueBefore3Call(2))
        assert.is.equal(3, trueBefore3Call(3))
        assert.is.equal(3, trueBefore3Call(4)) -- Should return the last result
    end)
    it('should support modArgs', function()
        local increment = function(...)
            return _.args(_.map(_.table(...), function(n)
                return n + 1
            end))
        end

        local pow = function(...)
            return _.args(_.map(_.table(...), function(n)
                return n * n
            end))
        end

        local modded = _.modArgs(function(a)
            return a
        end, {increment, increment}, pow)

        assert.is.equal(25, modded(3))
        assert.is.equal(36, modded(4))
        assert.is.equal(49, modded(5))
    end)
    it('should support negate', function()
        local isEven = function (n)
            return n % 2 == 0
        end

        local isOdd = _.negate(isEven)

        assert.is.equal('{2, 4, 6}', _.str(_.filter({1, 2, 3, 4, 5, 6}, isEven)))
        assert.is.equal('{1, 3, 5}', _.str(_.filter({1, 2, 3, 4, 5, 6}, isOdd)))
    end)
    it('should support once', function()
        local createApp = function(version)
            -- print('App created with version '..version)
            return version
        end
        local initialize = _.once(createApp)
        assert.is.equal(1.1, initialize(1.1))
        assert.is.equal(1.1, initialize(1.2))
    end)
    it('should support rearg', function()
        local rearged = _.rearg(function(a, b, c)
            return {a, b, c};
        end, 2, 1, 3)
        assert.is.equal('{"b", "a", "c"}', _.str(rearged('a', 'b', 'c')))
        assert.is.equal('{"a", "b", "c"}', _.str(rearged('b', 'a', 'c')))
    end)
end)