local _ = require 'lodash'


local function test_chunk()
	assert( _.str(_.chunk({'x', 'y', 'z', 1, 2, 3, 4, true , false}, 4)) 
		== '{{"x", "y", "z", 1}, {2, 3, 4, true}, {false}}' )
	assert( _.str(_.chunk({'x', 'y', 'z', 1, 2, 3, 4, true , false}, 3)) 
		== '{{"x", "y", "z"}, {1, 2, 3}, {4, true, false}}' )
end

local function test_compact()
	assert( _.str(_.compact({'x', 'y', nil, 1, 2, 3, false, true , false})) 
		== '{"x", "y", 1, 2, 3, true}' )
end

local function test_difference()
	assert( _.str(_.difference({3, 1, 2, 9, 5, 9}, {4, 5}, {9, 1})) 
		== '{3, 2}' )
	assert( _.str(_.difference({'x', 'q', '2', 3, false, true, false}, {true}, {'2', 'x'})) 
		== '{"q", 3, false, false}' )
end

local function test_drop()
	assert( _.str(_.drop({1, 2, 3, 4, 5, 6}, 2)) 
		== '{3, 4, 5, 6}' )
end

local function test_dropRight()
	assert( _.str(_.dropRight({1, 2, 3, 4, 5, 6}, 2)) 
		== '{1, 2, 3, 4}' )
end

local function test_dropRightWhile()
	assert( _.str(_.dropRightWhile({1, 5, 2, 3, 4, 5, 4, 4}, function(n)
	   return n > 3
	end)) == '{1, 5, 2, 3}')
end

local function test_dropWhile()
	assert( _.str(_.dropWhile({1, 2, 2, 3, 4, 5, 4, 4, 2}, function(n)
	   return n < 3
	end)) == '{3, 4, 5, 4, 4, 2}')
end

local function test_fill()
	local array = {1, 2, 3, 4, 5}; 
	_.fill(array, 'x', 2, #array - 1)
	assert(_.str(array) == '{1, "x", "x", "x", 5}')
	local array = {1, 2, 3, 4, 5}; 
	_.fill(array, 'x', 5, 4)
	assert(_.str(array) == '{1, 2, 3, "x", "x"}')
	local array = {1, 2, 3, 4, 5}; 
	_.fill(array, 'x')
	assert(_.str(array) == '{"x", "x", "x", "x", "x"}')
end

local function test_findIndex()
	assert(_.findIndex({{a = 1}, {a = 2}, {a = 3}, {a = 2}, {a = 3}}, function(v)
	    return v.a == 3
	end) == 3)
end

local function test_findLastIndex()
	assert(_.findLastIndex({{a = 1}, {a = 2}, {a = 3}, {a = 2}, {a = 3}}, function(v)
	    return v.a == 3
	end) == 5)
end

local function test_first()
	assert(_.first({'w', 'x', 'y', 'z'}) == 'w')
end

local function test_flatten()
	assert(_.str(_.flatten({1, 2, {3, 4, {5, 6}}})) == '{1, 2, 3, 4, {5, 6}}')
	assert(_.str(_.flatten({1, 2, {3, 4, {5, 6}}}, true)) == '{1, 2, 3, 4, 5, 6}')
end

local function test_flattenDeep()
	assert(_.str(_.flattenDeep({1, 2, {3, 4, {5, 6}}})) == '{1, 2, 3, 4, 5, 6}')
end

local function test_indexOf()
	assert(_.indexOf({2, 3, 'x', 4, 'x'}, 'x') == 3)
end

local function test_initial()
	assert(_.str(_.initial({1, 2, 3, 'a'})) == '{1, 2, 3}')
end

local function test_intersection()
	assert(_.str(_.intersection({1, 2}, {4, 2}, {2, 1})) == '{2}')
	assert(_.str(_.intersection({1, 2, 3}, {4, 2}, {1, 3})) == '{}')
end

local function test_last()
	assert(_.last({'w', 'x', 'y', 'z'}) == 'z')
end

local function test_lastIndexOf()
	assert(_.lastIndexOf({2, 3, 'x', 4, 'x'}, 'x') == 5)
end

local function test_pull()
	assert(_.str(_.pull({1, 2, 3, 4, 5, 4, 1, 2, 3}, 2, 3)) == '{1, 4, 5, 4, 1}')
end

local function test_pullAt()
	local array = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'}
	local t = _.pullAt(array, 4, 9, 8)
	assert(_.str(array) == '{"a", "b", "c", "e", "f", "g", "j"}')
	assert(_.str(t) == '{"d", "h", "i"}')
end

local function test_remove()
	local array = {1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 2, 3, 4}
	local t = _.remove(array, function(value)
	    return value > 4
	end)
	assert(_.str(array) == '{1, 2, 3, 4, 1, 2, 3, 4, 2, 3, 4}')
	assert(_.str(t) == '{5, 6, 7, 5, 6}')
end

local function test_rest()
	assert(_.str(_.rest({1, 2, 3, 'a'})) == '{2, 3, "a"}')
end

local function test_reverse()
	assert(_.str(_.reverse({1, 2, 3, 'a'})) == '{"a", 3, 2, 1}')
end

local function test_slice()
	assert(_.str(_.slice({1, 2, 3, 4, 5, 6}, 2, 4)) == '{2, 3, 4}')
	assert(_.str(_.slice({1, 2, 3, 4, 5, 6}, 3)) == '{3, 4, 5, 6}')
end

local function test_take()
	assert(_.str(_.take({1, 2, 3, 4, 5}, 3)) == '{1, 2, 3}')
end

local function test_takeRight()
	assert(_.str(_.takeRight({1, 2, 3, 4, 5}, 3)) == '{3, 4, 5}')
end

local function test_takeRightWhile()
	assert(_.str(_.takeRightWhile({9, 1, 2, 3, 4, 5, 6, 7, 8}, function(n)
	    return n > 4
	end)) == '{5, 6, 7, 8}')
end

local function test_takeWhile()
	assert(_.str(_.takeWhile({1, 2, 3, 4, 5, 6, 7, 8, 0}, function(n)
	    return n < 5
	end)) == '{1, 2, 3, 4}')
end

local function test_union()
	assert(_.str(_.union({1, 2}, {4, 2}, {2, 1})) == '{1, 2, 4}')
end

local function test_uniq()
	assert(_.str(_.uniq({1, 3, 2, 3, 4, 2, 5})) == '{1, 3, 2, 4, 5}')
	assert(_.str(_.uniq({{x=1}, {x=2}, {x=2}, {x=3}, {x=1}}, function(n)
		return n.x
	end)) == '{{["x"]=1}, {["x"]=2}, {["x"]=3}}')
end

local function test_without()
	assert(_.str(_.without({1, 1, 2, 3, 2, 3, 5, 5, 1, 2},  5, 1)) == 
		'{2, 3, 2, 3, 2}')
end

local function test_zip_and_unzip()
	local t = _.zip({'a', 'b', 'c'}, {1, 2, 3}, {10, 20, 30})
	assert(_.str(t) == '{{"a", 1, 10}, {"b", 2, 20}, {"c", 3, 30}}')
	assert(_.str(_.unzip(t)) == '{{"a", "b", "c"}, {1, 2, 3}, {10, 20, 30}}')
end

local function test_zipObject()
	local s = _.str(_.zipObject({{'fred', 30}, {'alex', 20}}))
	assert( s == '{["fred"]=30, ["alex"]=20}' or s == '{["alex"]=20, ["fred"]=30}')
	local s =  _.str(_.zipObject({'fred', 'alex'}, {30, 20}))
	assert(s == '{["fred"]=30, ["alex"]=20}' or s == '{["alex"]=20, ["fred"]=30}')
end

local function test_at()
	assert(_.str(_.at({'1', '2', '3', '4', a='a', b='b'}, {1, 2}, 'b'))
		== '{"1", "2", "b"}')
end

local function test_countBy()
	local s = _.str(_.countBy({4.3, 6.1, 6.4}, function(n) 
	  return math.floor(n)
	end))
	assert(s == '{["4"]=1, ["6"]=2}' or s == '{["6"]=2, ["4"]=1}')
end

local function test_every()
	assert(_.every({1, 2, 3, 4, '5', 6}, _.isNumber) == false)
	assert(_.every({1, 2, 3, 4, 5, 6}, _.isNumber) == true)
end

local function test_filter()
	assert(_.str(_.filter({1, 2, 3, 4, '5', 6, '7'}, _.isNumber)) 
		== '{1, 2, 3, 4, 6}')
end

local function test_find()
	local s = _.str(_.find({{a = 1}, {a = 2}, {a = 3, x = 1}, {a = 2}, {a = 3, x = 2}}, function(v)
	    return v.a == 3
	end))
	assert(s == '{["a"]=3, ["x"]=1}' or s == '{["x"]=1, ["a"]=3}')
end

local function test_findLast()
	local s = _.str(_.findLast({{a = 1}, {a = 2}, {a = 3, x = 1}, {a = 2}, {a = 3, x = 2}}, function(v)
	    return v.a == 3
	end))
	assert(s == '{["a"]=3, ["x"]=2}' or s == '{["x"]=2, ["a"]=3}')
end

local function test_forEach()
	local t = {1, 2, 3, 4, 5, b='b', 6, c = 'c'}
	local s = ''
	_.forEach(t, function(n)
		s = s .. n
	end)
	assert(s == '123456bc')
end

local function test_forEachRight()
	local t = {1, 2, 3, 4, 5, b='b', 6, c = 'c'}
	local s = ''
	_.forEachRight(t, function(n)
		s = s .. n
	end)
	assert(s == 'cb654321')
end

local function test_groupBy()
	local s = _.str(_.groupBy({4.3, 6.1, 6.4}, function(n) 
	  return math.floor(n)
	end))
	assert(s == '{["4"]={4.3}, ["6"]={6.1, 6.4}}' or 
		s == '{["6"]={6.1, 6.4}, ["4"]={4.3}}')
end

local function test_includes()
	assert(_.includes({1, 2, 'x', 3, ['5']=4, x=3, 5}, 'z')
		== false)
	assert(_.includes({1, 2, 'x', 3, ['5']=4, x=3, 5}, 'x')
		== true)
end

local function test_indexBy()
	local keyData = {
	    {dir='l', a=1},
	    {dir='r', a=2}
	}
	local s = _.str(_.indexBy(keyData, function(n)
	    return n.dir
	end))
	assert(s == '{["l"]={["dir"]="l", ["a"]=1}, ["r"]={["dir"]="r", ["a"]=2}}'
		or s == '{["r"]={["a"]=2, ["dir"]="r"}, ["l"]={["a"]=1, ["dir"]="l"}}'
		or s == '{["r"]={["dir"]="r", ["a"]=2}, ["l"]={["dir"]="l", ["a"]=1}}'
		or s == '{["l"]={["a"]=1, ["dir"]="l"}, ["r"]={["a"]=2, ["dir"]="r"}}')
end

local function test_invoke()
	assert(_.str(_.invoke({'1.first', '2.second', '3.third'}, string.sub, 1, 1))
	 == '{"1", "2", "3"}')
end

local function test_map()
	assert(_.str(_.map({1, 2, 3, 4, 5, 6, 7, 8, 9}, function(n)
	    return n * n
	end)) == '{1, 4, 9, 16, 25, 36, 49, 64, 81}')
end

local function test_partition()
	local t = _.partition({1, 2, 3, 4, 5, 6, 7}, function(n)
    	return n  > 3
    end)
	assert(_.str(t) == '{{4, 5, 6, 7}, {1, 2, 3}}')
end

local function test_pluck()
	local users = {
	  { user = 'barney', age = 36, child = {age = 5}},
	  { user = 'fred',   age = 40, child = {age = 6} }
	}
	assert(_.str(_.pluck(users, {'user'})) == '{"barney", "fred"}')
	assert(_.str(_.pluck(users, {'child', 'age'}) == '{5, 6}'))
end

local function test_reduce()
	assert(_.reduce({1, 2, 3}, function(total, n)
	 	return n + total;
	end) == 6)
	local s = _.str(_.reduce({a = 1, b = 2}, function(result, n, key) 
		result[key] = n * 3
		return result;
	end, {}))
	assert(s == '{["a"]=3, ["b"]=6}' or s == '{["b"]=6, ["a"]=3}')
end

local function test_reduceRight()
	local array = {0, 1, 2, 3, 4, 5};
	assert(_.reduceRight(array, function(str, other) 
	  return str .. other
	end, '') == '543210')

end
local function test_reject()
	local t = _.reject({1, 2, 3, 4, '5', 6, '7'}, _.isNumber)
	assert(_.str(t) == '{"5", "7"}')
end

local function test_sample()
	local t = _.sample({1, 2, 3, 4, '5', 6, '7'}, 2)
	assert(#t == 2)
	local t = _.sample({1, 2, 3, 4, '5', 6, '7'}, 3)
	assert(#t == 3)
	local t = _.sample({1, 2, 3, 4, '5', 6, '7'}, 4)
	assert(#t == 4)
end

local function test_sample()
	assert(_.size({'abc', 'def'}) == 2)
	assert(_.size('abcdefg') == 7)
	assert(_.size({a=1, b=2,c=3}) == 3)
end

local function test_some()
	assert(_.some({1, 2, 3, 4, '5', 6}, _.isString) == true)
	assert(_.some({1, 2, 3, 4, 5, 6}, _.isString) == false)
end

local function test_sortBy()
	assert(_.str(_.sortBy({1, 2, 3}, function (a)
		return math.sin(a)
	end)) == '{1, 3, 2}')

	local users = {
		{ user='fred' },
		{ user='alex' },
		{ user='zoee' },
		{ user='john' },
	}
	assert(_.str(_.sortBy(users, function (a)
		return a.user..0
	end)) == '{{["user"]="alex"}, {["user"]="fred"}, {["user"]="john"}, {["user"]="zoee"}}')
end


-- local isEven = function (n)
-- 	return n % 2 == 0
-- end

-- local isOdd = _.negate(isEven)
-- _.print(_.filter({1, 2, 3, 4, 5, 6}, isEven))
-- _.print(_.filter({1, 2, 3, 4, 5, 6}, isOdd))

-- local createApp = function(version)
-- 	print('App created with version '..version)
-- 	return version
-- end
-- local initialize = _.once(createApp)
-- print(initialize(1.1))
-- print(initialize(1.1))
-- print(initialize(1.1))

-- local increment = function(...) 
-- 	return _.args(_.map(_.table(...), function(n)
-- 		return n + 1
-- 	end))
-- end

-- local pow = function(...) 
-- 	return _.args(_.map(_.table(...), function(n)
-- 		return n * n
-- 	end))
-- end

-- local modded = _.modArgs(function(...)
-- 	print(...)
-- end, {increment, increment}, pow)

-- modded(0, 1, 2)


-- local rearged = _.rearg(function(a, b, c) 
--   return {a, b, c};
-- end, 2, 1, 3)

-- _.print(rearged('a', 'b', 'c'))
-- _.print(rearged('b', 'a', 'c'))
-- _.print(_.pairs({1, 2, 'x', a='b'}))


-- print(_.args({1, 2, 3}))

-- print(_.inRange(-3, -4, 8))


-- _.print(_.findKey({a={a = 1}, b={a = 2}, c={a = 3, x = 1}}, 
-- function(v)
--     return v.a == 3
-- end))

-- _.print(_.findLastKey({a={a=3}, b={a = 2}, c={a=3, x = 1}}, 
-- function(v)
--     return v.a == 3
-- end))

-- _.print(_.functions(table))

local object = {a=5, b={c=function(a) print(a) end}}
_.result(object, {'b', 'c'}, nil, 5)