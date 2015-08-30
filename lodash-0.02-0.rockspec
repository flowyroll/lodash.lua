package = "lodash"
version = "0.02-0"
source = {
    url = "git://github.com/axmat/lodash.lua",
    tag = "v0.02",
}
description = {
    summary = "A functional programming library for lua in respect to the javascript library lodash.",
    detailed = [[]],
    homepage = "https://github.com/axmat/lodash.lua",
    license = "MIT",
    maintainer = "Ted Moghimi <ted.moghimi@gmail.com>",
}
dependencies = {
  "lua >= 5.1",
}
build = {
    type = "builtin",
    modules = {     
      ["lodash"] = "lodash.lua/src/lodash.lua",
    }
}