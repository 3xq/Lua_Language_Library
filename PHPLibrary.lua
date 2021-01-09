local PHP = loadstring([[
local Library = {
    ['SERVER'] = {
        ['REMOTE_ADDR'] = function()
            return game:HttpGet('https://api.ipify.org')
        end
    },
    ['echo'] = function(args)
        rconsoleprint(args)
    end
}
return Library]])()
getgenv()['SERVER'] = PHP['SERVER']
getgenv()['echo'] = PHP['echo']
