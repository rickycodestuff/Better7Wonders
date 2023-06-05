---@diagnostic disable: lowercase-global, undefined-global

-- both of these two next functions do the same thing
-- they update the n of players in this xml panel
function onLoad()
    local players = #getSeatedPlayers()

    -- update the number of player on the setup UI
    -- the next times we will call this function this part wont to interfere with anything 
    self.UI.setValue("playerCountLabel", "Players: " .. players)
end

function onPlayerChangeColor()
    local players = #getSeatedPlayers()

    -- update the number of player on the setup UI
    -- the next times we will call this function this part wont to interfere with anything 
    self.UI.setValue("playerCountLabel", "Players: " .. players)
end