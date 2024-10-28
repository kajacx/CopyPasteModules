-- local mypairs = require("helpers/mypairs")

local unique_counter = 0

return function(a: string)
    unique_counter = unique_counter + 1
    local message = "[" .. unique_counter .. "]"
    -- for _,msg in mypairs(unpack(arg)) do
    --     message = message .. ", " .. msg
    -- end
    message = message .. ", " .. a
    game.print(message)
end
