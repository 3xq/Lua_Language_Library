local PHP = loadstring([[
local Library = {
    ['SERVER'] = {
        ['REMOTE_ADDR'] = function()
            return game:HttpGet('https://api.ipify.org')
        end
    }
}
return Library]])()
getgenv()['SERVER'] = PHP['SERVER']
