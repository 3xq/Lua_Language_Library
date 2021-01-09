local Python = loadstring([[
local Library = {
    ['str'] = function(String)
        return tostring(String)
    end,
    ['Import'] = function(module)
        if module == 'requests' then
            getgenv().requests = {
                get = function(link, body)
                    if body == false then
                        return string.format('[Response %s]',syn.request({Url=link}).StatusCode)
                    elseif body == true then
                        return syn.request({Url=link}).Body
                    end
                end,
                post = function(Url, Headers, Cookies)
                    if not Cookies then
                        return syn.request({Url=link, Method='POST', Headers=Headers})
                    elseif Cookies then
                        return syn.request({Url=link, Method='POST', Headers=Headers, Cookies=Cookies})
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
                    rconsolename()
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
                pinghost = function(Host, Verbose)
                    syn.request({Url=string.format('https://3xxq.000webhostapp.com/ping.php?host=%s&res=%s', Host, Verbose), Method='GET'}
                end
            }
        end
    end
}
return Library]])()
for i,v in pairs(Library) do
    getgenv()[i] = v
end
