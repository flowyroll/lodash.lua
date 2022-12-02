package = "lodash"
version = "0.02-0"
source = {
    url = "git://github.com/flowyroll/lodash.lua",
    tag = "v0.02",
}
description = {
    summary = "A functional programming library for lua in respect to the javascript library lodash.",
    detailed = [[]],
    homepage = "https://github.com/flowyroll/lodash.lua",
    license = "MIT",
    maintainer = "Daniel Moghimi <daniel.mogimi@gmail.com>",
}
dependencies = {
  "lua >= 5.2",
}
build = {
    type = "builtin",
    modules = {     
      ["lodash"] = "lodash.lua/src/lodash.lua",
    }
}
