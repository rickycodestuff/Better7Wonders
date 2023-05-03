---@diagnostic disable: lowercase-global

function getPlayerCount()
    -- this function is only for 'readable' purposes 
    -- i just like having something that tells me straight up how many playeres there are
    
    local count = 0

    for _ in pairs(getSeatedPlayers()) do
        count = count + 1
    end

    return count
end