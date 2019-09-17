local _ = require('lodash')
describe('Object module', function()
    it('shoud support findKey', function()
        assert.is.equal('c', _.str(_.findKey({a={a = 1}, b={a = 2}, c={a = 3, x = 1}}, 
        function(v)
            return v.a == 3
        end)))
    end)
    it('should support findLastKey', function()
        assert.is.equal('c', _.str(_.findLastKey({a={a = 1}, b={a = 2}, c={a = 3, x = 1}}, 
        function(v)
            return v.a == 3
        end)))
    end)
    it('should support functions', function()
        local testTable = {
            fn1 = function()
            end,
            someKey = 1,
        }
        assert.are.same({'fn1'}, _.functions(testTable))
    end)
    it('should support assign', function()
        local object = {
            a = 0,
        }
        local one = {
            a = 1,
        }
        local two = {
            b = 3,
        }

        _.assign(object, one, two)

        assert.is.equal(1, object.a)
        assert.is.equal(3, object.b)
    end)
    it('shoud support get', function()
        local object = {a={b={c={d=5}}}}
        assert.is.equal(5, _.get(object, {'a', 'b', 'c', 'd'}))
    end)
    it('should support has', function()
        local object = {a={b={c={d}}}}
        assert.is.equal(true, _.has(object, {'a', 'b', 'c'}))
    end)
    it('should support invert', function()
        local inverted = _.invert({a='1', b='2', c='2'}, false)
        assert.are.same({["1"]="a", ["2"]="c"}, inverted)
        inverted = _.invert({a='1', b='2', c='2'}, true)
        assert.are.same({["1"]="a", ["2"]={"b", "c"}}, inverted)
    end)
    it('should support keys', function()
        assert.is.equal('{1, 2, 3, 4}', _.str(_.keys("test")))
        assert.is.equal('{"a", "b", "c"}', _.str(_.keys({a=1, b=2, c=3})))	 
    end)
    it('should support pairs', function()
        assert.is.equal('{{1, 1}, {2, 2}, {3, "x"}, {"a", "b"}}', _.str(_.pairs({1, 2, 'x', a='b'})))
    end)
    it('should support result', function()
        local object = {a=5, b={c=function(a) return a end}}
        assert.is.equal(5, _.result(object, {'b', 'c'}, nil, 5))
    end)
    it('should support values', function()
        assert.is.equal('{"t", "e", "s", "t"}', _.str(_.values("test")))
        assert.is.equal('{1, 2, 3}', _.str(_.values({a=1, b=2, c=3})))
    end)
end)