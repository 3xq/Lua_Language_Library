rconsoleclear()
local Python = loadstring(game:HttpGet('https://raw.githubusercontent.com/3xq/Lua_Python_Library/main/Library.lua'))()

import('requests')
import('json')

local Encoded = json.encode({['PastebinRaw']=requests.get('https://pastebin.com/raw/iRUbKiL8', true)})
rconsoleprint(tostring(json.decode(Encoded))..'\n')
rconsoleprint(Encoded..'\n')
rconsoleprint(requests.get('https://pastebin.com/raw/iRUbKiL8', false)..'\n')
rconsoleprint(requests.get('https://pastebin.com/raw/iRUbKiL8', true))
