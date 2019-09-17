local _ = require 'lodash'

local function test_findKey()
	assert(_.str(_.findKey({a={a = 1}, b={a = 2}, c={a = 3, x = 1}}, 
	function(v)
	    return v.a == 3
	end)) == 'c')
end

local function test_findLastKey()
	assert(_.str(_.findLastKey({a={a = 1}, b={a = 2}, c={a = 3, x = 1}}, 
	function(v)
	    return v.a == 3
	end)) == 'c')
end

local function test_functions()
	assert(_.str(_.functions(table)) == 
		'{"concat", "insert", "maxn", "pack", "remove", "sort", "unpack"}')
end

local function test_assign()
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

  assert(object.a == 1)
  assert(object.b == 3)
end

local function test_get()
	local object = {a={b={c={d=5}}}}
	assert(_.get(object, {'a', 'b', 'c', 'd'}) == 5)
end

local function test_has()
	local object = {a={b={c={d}}}}
	assert(_.has(object, {'a', 'b', 'c'}) == true)
end

local function test_invert()
	local inverted = _.str(_.invert({a='1', b='2', c='2'}, false))
	assert(inverted == '{["1"]="a", ["2"]="c"}' or inverted == '{["2"]="c", ["1"]="a"}')
	inverted = _.str(_.invert({a='1', b='2', c='2'}, true))
	assert(inverted == '{["1"]="a", ["2"]={"b", "c"}}' or inverted == '{["2"]={"b", "c"}, ["1"]="a"}')
end

local function test_keys()
	assert(_.str(_.keys("test")) == '{1, 2, 3, 4}')
	assert(_.str(_.keys({a=1, b=2, c=3})) == '{"a", "b", "c"}')	 
end

local function test_pairs()
	assert(_.str(_.pairs({1, 2, 'x', a='b'})) == '{{1, 1}, {2, 2}, {3, "x"}, {"a", "b"}}')
end

local function test_result()
	local object = {a=5, b={c=function(a) return a end}}
	assert(_.result(object, {'b', 'c'}, nil, 5) == 5)
end

local function test_values()
	assert(_.str(_.values("test")) == '{"t", "e", "s", "t"}')
	assert(_.str(_.values({a=1, b=2, c=3})) == '{1, 2, 3}')
end
