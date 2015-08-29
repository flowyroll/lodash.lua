# README #

## lodash.lua v0.2
lodash inspired library for lua

### Summary ###

A functional programming library for lua in respect to the javascript library lodash.
Visit the complete [API Doc](http://tedmog.github.io/lodash.lua).

### How to use the library? ###

	local _ = require 'lodash'
	_.print(_.map({1, 2, 3, 4, 5}, function(n)
		return n * 2
	end))
