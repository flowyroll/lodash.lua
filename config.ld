project = 'lodash.lua'
file = "lodash.lua"
title = "lodash.lua documentation"
prettify_files = 'show'
sort = true
format = 'markdown'
wrap = false
no_summary = true
pretty = 'lua'
style = '!fixed'
no_return_or_parms = false
custom_display_name_handler = function(item, default_handler)
  if item.type == 'function' then
    return item.name
  end
  return default_handler(item)
end
