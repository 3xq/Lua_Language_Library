rconsoleclear()

-- Sets libraries as variables to use later.
local Python = loadstring(game:HttpGet('https://raw.githubusercontent.com/3xq/Lua_Language_Library/main/PythonLibrary.lua'))()
local PHP = loadstring(game:HttpGet('https://raw.githubusercontent.com/3xq/Lua_Language_Library/main/PHPLibrary.lua'))()

-- Imports all (Current) working modules.
import('requests')
import('json')
import('rich')

-- Encoded is just a json.encode test
local Encoded = json.encode({['PastebinRaw']=requests.get('https://pastebin.com/raw/iRUbKiL8', true)})

-- Variable so script can be more optimized
local Console = rich.console

-- Starts up new rconsole()
rich.new()

-- Testing
rconsoleprint(tostring(json.decode(Encoded))..'\n') -- Decode
rconsoleprint(Encoded..'\n\n') -- Encode
rconsoleprint(requests.get('https://pastebin.com/raw/iRUbKiL8', false)..'\n') -- Response code
rconsoleprint(requests.get('https://pastebin.com/raw/iRUbKiL8', true)..'\n\n') -- Body

rconsoleprint('PHP LIBRARY TIME\n') -- PHP yay
echo(SERVER['REMOTE_ADDR']()..'\n') -- $_SERVER['REMOTE_ADDR']

Console.log('hello','CYAN') -- Rich console logging, uses colors
