local _ = require('lodash')
describe('Collection module', function()
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
    it('should support indexBy(actually should be keyBy)', function()
        local keyData = {
            {dir='l', a=1},
            {dir='r', a=2}
        }
        local s = _.indexBy(keyData, function(n)
            return n.dir
        end)
        assert.are.same({["l"]={["dir"]="l", ["a"]=1}, ["r"]={["dir"]="r", ["a"]=2}}, s)
    end)
    it('should support invoke', function()
        assert.is.equal('{"1", "2", "3"}', _.str(_.invoke({'1.first', '2.second', '3.third'}, string.sub, 1, 1)))
    end)
    it('should support map', function()
        assert.is.equal('{1, 4, 9, 16, 25, 36, 49, 64, 81}', _.str(_.map({1, 2, 3, 4, 5, 6, 7, 8, 9}, function(n)
            return n * n
        end)))
    end)
    it('should support partition', function()
        local t = _.partition({1, 2, 3, 4, 5, 6, 7}, function(n)
            return n  > 3
        end)
        assert.is.equal('{{4, 5, 6, 7}, {1, 2, 3}}', _.str(t))
    end)
    it('should support pluck', function()
        local users = {
        { user = 'barney', age = 36, child = {age = 5}},
        { user = 'fred',   age = 40, child = {age = 6} }
        }
        assert.is.equal('{"barney", "fred"}', _.str(_.pluck(users, {'user'})))
        assert.is.equal('{5, 6}', _.str(_.pluck(users, {'child', 'age'})))
    end)
    it('should support reduce', function()
        assert.is.equal(6, _.reduce({1, 2, 3}, function(total, n)
            return n + total;
        end))
        local s = _.reduce({a = 1, b = 2}, function(result, n, key) 
            result[key] = n * 3
            return result;
        end, {})
        assert.are.same({["a"]=3, ["b"]=6}, s)
    end)
    it('should support reduceRight', function()
        local array = {0, 1, 2, 3, 4, 5};
        assert.is.equal('543210', _.reduceRight(array, function(str, other) 
            return str .. other
        end, ''))
    end)
    it('should support reject', function()
        local t = _.reject({1, 2, 3, 4, '5', 6, '7'}, _.isNumber)
        assert.is.equal('{"5", "7"}', _.str(t))
    end)
    it('should support sample', function()
        local t = _.sample({1, 2, 3, 4, '5', 6, '7'}, 2)
        assert.is.equal(2, #t)
        local t = _.sample({1, 2, 3, 4, '5', 6, '7'}, 3)
        assert.is.equal(3, #t)
        local t = _.sample({1, 2, 3, 4, '5', 6, '7'}, 4)
        assert.is.equal(4, #t)
    end)
    it('should support size', function()
        assert.is.equal(2, _.size({'abc', 'def'}))
        assert.is.equal(7, _.size('abcdefg'))
        assert.is.equal(3, _.size({a=1, b=2,c=3}))
    end)
    it('should support some', function()
        assert.is.equal(true, _.some({1, 2, 3, 4, '5', 6}, _.isString))
        assert.is.equal(false, _.some({1, 2, 3, 4, 5, 6}, _.isString))
    end)
    it('should support sortBy', function()
        assert.is.equal('{1, 3, 2}', _.str(_.sortBy({1, 2, 3}, function (a)
            return math.sin(a)
        end)))

        local users = {
            { user='fred' },
            { user='alex' },
            { user='zoee' },
            { user='john' },
        }
        assert.is.equal('{{["user"]="alex"}, {["user"]="fred"}, {["user"]="john"}, {["user"]="zoee"}}', _.str(_.sortBy(users, function (a)
            return a.user..0
        end)))
    end)
end)
