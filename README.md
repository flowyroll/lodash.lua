# Lodash for Lua #

[![CircleCI](https://circleci.com/gh/HustLion/lodash.lua.svg?style=svg)](https://circleci.com/gh/HustLion/lodash.lua)

## lodash.lua v0.02
lodash inspired library for lua

### Summary ###

A functional programming library for lua in respect to the javascript library lodash.

### How to use the library? ###

- Install the library using luarocks:  ```luarocks install lodash```
   or simply add lodash.lua file from this git repository.
- import it like this in to your code 
```lua
local _ = require 'lodash'
```
- and then you can use good sort of functions:

```lua

_.print(_.map({1, 2, 3, 4, 5}, function(n)
	return n * 2
end))
```

- Follow the [API documentation](http://axmat.github.io/lodash.lua) for the complete list.
