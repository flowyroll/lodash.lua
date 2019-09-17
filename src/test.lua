local _ = require 'lodash'

local function test_bool()
	assert(_.bool({1, 2, 3}) == false)
	assert(_.bool("123") == true)
	assert(_.bool(0) == false)
	assert(_.bool(function(a) return a end, "555") == true)
end

local function test_func()
	local f = _.func(1, 2, 3)
 	assert(_.str(f()) == '1')
end

local function test_gt()
	assert(_.gt(1, 3) == false)
	assert(_.gt(1, '3') == false)
	assert(_.gt({}, 3) == false)
end

local function test_gte()
	assert(_.gte(1, 3) == false)
	assert(_.gte(3, '3') == true)
	assert(_.gte({}, 3) == false)
end

local function test_isBoolean()
	assert(_.isBoolean('x') == false)
	assert(_.isBoolean(false) == true)
end

local function test_isEmpty()
	assert(_.isEmpty(true) == true)
	assert(_.isEmpty(1) == true)
	assert(_.isEmpty({1}) == false)
	assert(_.isEmpty({a=1}) == false)
end

local function test_isFunction()
	assert(_.isFunction(function() end) == true)
	assert(_.isFunction(1) == false)	
end

local function test_isNil()
	assert(_.isNil(variable) == true)
 	local variable = 1
 	assert(_.isNil(variable) == false)
end

local function test_isNumber()
	assert(_.isNumber(1) == true)
	assert(_.isNumber('1') == false)
end

local function test_isString()
	assert(_.isString(1) == false)
	assert(_.isString('1') == true)
end

local function test_isTable()
	assert(_.isTable(1) == false)
	assert(_.isTable({'1'}) == true)
end

local function test_lt()
	assert(_.lt(1, 3) == true)
	assert(_.lt(false, 3) == false)
	assert(_.lt({}, 3) == false)
end

local function test_lte()
	assert(_.lte(1, 3) == true)
	assert(_.lte('3', 3) == true)
	assert(_.lte({}, 3) == false)
end

local function test_num()
 	assert(_.num({1, 2, 3}) == 0) 
 	assert(_.num("123") == 123)
	assert(_.num(true) == 1)
  	assert(_.num(function(a) return a end, "555") == 555)
end

local function test_str()
	assert(_.str({1, 2, 3, 4, {k=2, {'x', 'y'}}}) == '{1, 2, 3, 4, {{"x", "y"}, ["k"]=2}}')
	assert(_.str({1, 2, 3, 4, function(a) return a end}, 5) == '{1, 2, 3, 4, 5}')
end

local function test_table()
	assert(_.str(_.table(1, 2, 3)) == '{1, 2, 3, ["n"]=3}')
	assert(_.str(_.table('123')) == '{"123", ["n"]=1}')
end

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
