local _ = require('lodash')
describe('Array module', function()
    it('should support at', function()
        assert.is.equal('{"1", "2", "b"}', _.str(_.at({'1', '2', '3', '4', a='a', b='b'}, {1, 2}, 'b')))
    end)
    it('should support countBy', function()
        local s = _.countBy({4.3, 6.1, 6.4}, function(n) 
            return math.floor(n)
        end)
        assert.are.same({["4"]=1, ["6"]=2}, s)
    end)
    it('should support every', function()
        assert.is.equal(false, _.every({1, 2, 3, 4, '5', 6}, _.isNumber))
        assert.is.equal(true, _.every({1, 2, 3, 4, 5, 6}, _.isNumber))
    end)
    it('should support filter', function()
        assert.is.equal('{1, 2, 3, 4, 6}', _.str(_.filter({1, 2, 3, 4, '5', 6, '7'}, _.isNumber)))
    end)
    it('should support find', function()
        local s = _.find({{a = 1}, {a = 2}, {a = 3, x = 1}, {a = 2}, {a = 3, x = 2}}, function(v)
            return v.a == 3
        end)
        assert.are.same({["a"]=3, ["x"]=1}, s)
    end)
    it('should support findLast', function()
        local s = _.findLast({{a = 1}, {a = 2}, {a = 3, x = 1}, {a = 2}, {a = 3, x = 2}}, function(v)
            return v.a == 3
        end)
        assert.are.same({["a"]=3, ["x"]=2}, s)
    end)
    it('should support forEach', function()
        local t = {1, 2, 3, 4, 5, b='b', 6, c = 'c'}
        local s = ''
        _.forEach(t, function(n)
            s = s .. n
        end)
        assert.is.equal('123456bc', s)
    end)
    it('should support forEachRight', function()
        local t = {1, 2, 3, 4, 5, b='b', 6, c = 'c'}
        local s = ''
        _.forEachRight(t, function(n)
            s = s .. n
        end)
        assert.is.equal('cb654321', s)
    end)
    it('should support groupBy', function()
        local s = _.groupBy({4.3, 6.1, 6.4}, function(n) 
        return math.floor(n)
        end)
        assert.are.same({["4"]={4.3}, ["6"]={6.1, 6.4}}, s)
    end)
    it('should support includes', function()
        assert.is.equal(false, _.includes({1, 2, 'x', 3, ['5']=4, x=3, 5}, 'z'))
        assert.is.equal(true, _.includes({1, 2, 'x', 3, ['5']=4, x=3, 5}, 'x'))
    end)
    it('should support indexBy', function()
        local keyData = {
            {dir='l', a=1},
            {dir='r', a=2}
        }
        local s = _.indexBy(keyData, function(n)
            return n.dir
        end)
        assert.are.same({["l"]={["dir"]="l", ["a"]=1}, ["r"]={["dir"]="r", ["a"]=2}}, s)
    end)
end)
