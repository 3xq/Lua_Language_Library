local Python = loadstring([[
local Library = {
    ['Str'] = function(String)
        return tostring(String)
    end,
    ['Import'] = function(module)
        if module == 'requests' then
            getgenv().requests = {
                get = function(Url, body)
                    if not body then
                        return string.format('[Response %s]',syn.request({Url=Url}).StatusCode)
                    elseif body then
                        return syn.request({Url=Url}).Body
                    end
                end,
                post = function(Url, Headers, Cookies)
                    if not Cookies then
                        return syn.request({Url=Url, Method='POST', Headers=Headers})
                    elseif Cookies then
                        return syn.request({Url=Url, Method='POST', Headers=Headers, Cookies=Cookies})
                    end
                end
            }
        elseif module == 'json' then
            getgenv().json = {
                decode = function(String)
                    return game:GetService('HttpService'):JSONDecode(String)
                end,
                encode = function(String)
                    return game:GetService('HttpService'):JSONEncode(String)
                end
            }
        elseif module == 'rich' then
            getgenv().rich = {
                new = function()
                    rconsolename(' ')
                end,
                console = {
                    log = function(String,Color)
                        rconsoleprint(string.format('@@%s@@', Color))
                        rconsoleprint(tostring(String))
                        rconsoleprint('@@LIGHT_GRAY@@')
                    end
                }
            }
        elseif module == 'ping' then
            getgenv().ping = {
                --pinghost = function(Host, Verbose)
                    --return syn.request({Url=string.format('https://3xxq.000webhostapp.com/ping.php?host=%s&res=%s', Host, Verbose), Method='GET'}.Body
                --end
            }
        elseif module == 'mod' then
            getgenv().rconsoleprint = Print
        end
    end
}
return Library]])()
getgenv().import = Python.Import
getgenv().str    = Python.Str
