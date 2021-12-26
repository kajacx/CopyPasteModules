

local unique_counter = 0

return function(a)
   unique_counter = unique_counter + 1
   local message = "[" .. unique_counter .. "]"



   message = message .. ", " .. a
   game.print(message)
end
