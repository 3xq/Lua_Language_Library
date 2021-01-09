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
                new = function(String)
                    rconsoleprint(String)
                end,
                console = {
                    function log(String, R, G, B)
                        printconsole(String, R, G, B)
                    end
                }
            }
        end
    end
}
return Library]])()
getgenv().import = Python.Import
