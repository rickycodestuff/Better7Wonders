---@diagnostic disable: lowercase-global

-- ! GLOBAL VARIABLES
PLAYERS_ORDER = {'White', 'Purple', 'Red', 'Yellow', 'Green', 'Orange', 'Blue'}

GAME_PHASES = {
    ["base"] = {
        ["0"] = "CHOOSE WONDER'S SIDE",
        ["1"] = "AGE I",
        ["8"] = "AGE I - WAR CONFLICT",
        ["9"] = "AGE II",
        ["16"] = "AGE II - WAR CONFLICT",
        ["17"] = "AGE III",
        ["24"] = "AGE III - WAR CONFLICT",
    }
}

CURRENT_PHASE = 0

function onLoad(save_state)
    -- this is just the init of the other scripts
    STATUS_PANEL = Global.getVar('STATUS_PANEL')
end

-- ! FUNCTIONS
function startGameClick()
    if #getSeatedPlayers() < 3 then
        broadcastToAll("Not enough players", "Red")
        return
    else
        startLuaCoroutine(self, 'startGame')
        getObjectFromGUID('163eed').destruct()      -- it'll hide the setup menu
    end


end

function startGame()
    -- ! GAME SETUP
    STATUS_PANEL.call('resetPlayersStatus')
    broadcastToAll('Game starting')
    wait(1)

    broadcastToAll('Shuffling decks...')
    decksSetup()
    wait(2)

    playerBoardSetup()

    -- ! CHOOSING THE WONDER SIDE
    STATUS_PANEL.call('setStatusPanelTitle', "CHOOSE WONDER'S SIDE")
    STATUS_PANEL.setVar('GLOBAL_STATUS', true)
    broadcastToAll("Chose your wonder's side")

    -- without this the LuaCoroutine will give us an error
    return 1
end

function decksSetup()
    -- getting the base decks from our global table
    -- every element in that table is an array in wich we stored every GUID of every decks of the base game
    -- so in the 'age1' array will have the guid for the 3+ players deck, for the 4+ players deck etc. etc.
    local base_deck = Global.getVar('BASE_DECK_GUID')

    -- this function will prepare the decks depending on how many players there are in the match
    -- since its impossible to play in less than 3 players we can already store our base decks
    deck_age1 = getObjectFromGUID(base_deck['age1'][1])
    deck_age2 = getObjectFromGUID(base_deck['age2'][1])

    -- the base deck for age3 its made of the base age3 cards plus N guild cards
    -- so we'll prepare both of them and then join them
    deck_age3 = getObjectFromGUID(base_deck['age3'][1])
    local deck_guild = getObjectFromGUID(Global.getVar('GUILD_DECK_GUID'))
    
    -- this function will handle all of the extra cards for every extra players
    -- add 4+ cards
    if #getSeatedPlayers() >= 4 then
        deck_age1.putObject(getObjectFromGUID(base_deck['age1'][2]))
        deck_age2.putObject(getObjectFromGUID(base_deck['age2'][2]))
        deck_age3.putObject(getObjectFromGUID(base_deck['age3'][2]))
    end

    -- add 5+ cards
    if #getSeatedPlayers() >= 5 then
        deck_age1.putObject(getObjectFromGUID(base_deck['age1'][3]))
        deck_age2.putObject(getObjectFromGUID(base_deck['age2'][3]))
        deck_age3.putObject(getObjectFromGUID(base_deck['age3'][3]))
    end

    -- add 6+ cards
    if #getSeatedPlayers() >= 6 then
        deck_age1.putObject(getObjectFromGUID(base_deck['age1'][4]))
        deck_age2.putObject(getObjectFromGUID(base_deck['age2'][4]))
        deck_age3.putObject(getObjectFromGUID(base_deck['age3'][4]))
    end

    -- add 7+ cards
    if #getSeatedPlayers() == 7 then
        deck_age1.putObject(getObjectFromGUID(base_deck['age1'][5]))
        deck_age2.putObject(getObjectFromGUID(base_deck['age2'][5]))
        deck_age3.putObject(getObjectFromGUID(base_deck['age3'][5]))
    end

    -- prepare the guild deck
    for i = 1, #getSeatedPlayers() + 2 do
        deck_guild.shuffle()

        deck_age3.putObject(deck_guild.takeObject())
    end

    -- TODO expansions decks

    -- once we've built our decks we shuffle them
    deck_age1.shuffle()
    deck_age2.shuffle()
    deck_age3.shuffle()
end

function playerBoardSetup()
    -- in this function we'll prepare everything a player needs to place in his "area"
    -- such as random wonder, coins and stockyard, if armada exp is chosen
    local wonders_bags = Global.getVar('WONDERS_BAGS')  -- this give us the entire table of wonders guid, each divided for expansion
    local coins_bag = Global.getVar('COINS_BAGS')

    local base_wonders_bag = getObjectFromGUID(wonders_bags['base']) -- getting the base game wonders

    -- TODO
    -- if the players have chosen some expansions we'll add to our base game wonders
    if leaders_exp then
        
    end

    if cities_exp then
        
    end

    if armada_exp then
        
    end

    if edifice_exp then
        
    end

    -- after we got all the wonders ready we shuffle them 
    -- so that we can then give them to ech player 
    base_wonders_bag.shuffle()

    local silver_coins_bag = getObjectFromGUID(coins_bag['silver'])
    local coins = 3

    -- TODO if the players have chosen the leaders expansions they'll have 6 coins
    if leaders_exp then coins = 6 end

    -- TODO SHIPYARD SETUP

    -- for every player will be calculating the coordinates for their wonder based, coins and shipyard on their hand position
    -- every hand is already placed following some "symmetrical rules"
    for _, color in pairs(getSeatedPlayers()) do

        local origin = Player[color].getHandTransform(1)  -- this 1 is the index of the zones owned by that color

        -- since every objects have to face the player we'll use the same rotation for every objects
        local relative_rot = Vector(0, 0, 0)

        -- initialize our wonder position and rotation
        local wonder_pos = Vector(0, 0, 0)
        local wonder_offset = Global.getVar('OBJECTS_OFFSETS')['wonder']

        -- since we are using forward to see in wich "direction" the wonder will face
        -- only the x or the z coordinate will change, depending on the player's hand position
        -- the other cordinate will be the same as the player's
        wonder_pos[1] = origin.position[1] + origin.forward[1] * wonder_offset
        wonder_pos[2] = Global.getVar('TABLE_HEIGHT')
        wonder_pos[3] = origin.position[3] + origin.forward[3] * wonder_offset

        -- the rotation in the other hand will be the same as the player's 
        -- but, if we dont "flip" the Y the wonder will be facing the center of the table
        -- we instaed want it to face us, the player
        relative_rot[1] = origin.rotation[1]
        relative_rot[2] = origin.rotation[2] + 180
        relative_rot[3] = origin.rotation[3]

        local player_wonder = base_wonders_bag.takeObject({
            position = wonder_pos,
            rotation = relative_rot,
            smooth = false
        })

        -- udpate the PLAYERS table to store the wonder taken
        -- PLAYERS is a table inside Global and luatts treats it a bit "differnt"
        -- so in order to udpdate we have to overwrite it with a new one
        local new_table = Global.getTable('PLAYERS')
        new_table[string.lower(color)]['objects']['wonder']['wonder_obj'] = player_wonder
        new_table[string.lower(color)]['objects']['wonder']['wonder_pos'] = wonder_pos
        new_table[string.lower(color)]['objects']['wonder']['wonder_rot'] = relative_rot

        Global.setTable('PLAYERS', new_table)

        -- initialize our coins position and rotation
        local coins_pos = Vector(0, 0, 0)

        local coins_offset_x = Global.getVar('OBJECTS_OFFSETS')['coins']['x']
        local coins_offset_z = Global.getVar('OBJECTS_OFFSETS')['coins']['z']
        local coins_padding = Global.getVar('OBJECTS_OFFSETS')['coins']['padding']

        -- initialize pos of first coin to place
        coins_pos[1] = origin.position[1] + origin.forward[1] * coins_offset_z + origin.right[1] * coins_offset_x
        coins_pos[2] = 2
        coins_pos[3] = origin.position[3] + origin.forward[3] * coins_offset_z + origin.right[3] * coins_offset_x

        -- this loop just place every coins in a "fancy way" 
        -- placing them in a sort single file
        for i = 1, coins do
            local coin_placed = silver_coins_bag.takeObject({
                smooth = false,
                rotation = relative_rot,
                position = {
                    coins_pos[1] + origin.right[1] * (i - 1) * coins_padding,
                    coins_pos[2],
                    coins_pos[3] + origin.right[3] * (i - 1) * coins_padding,
                }
            })
        end

        if armada_exp then

            -- TODO SHIPYARD PLACEMENT
            -- initialize our shipyard position and rotation
            local shipyard_pos = Vector(0, 0, 0)
            local shipyard_rot = Vector(0, 0, 0)
        end
    end
end

function resetWondersPos()
    -- this function is called right after all players have chosen their wonder side 
    -- and since i like having a steady position for my wonder 
    -- it doesn't matter if they move it around it will reset to its default position

    for _, player_color in pairs(getSeatedPlayers()) do
        local players = Global.getTable('PLAYERS')

        local wonder_data = players[string.lower(player_color)]['objects']['wonder']

        -- if the player flipped the wonder it wont reset its rotation
        local wonder_rot_z = wonder_data['wonder_obj'].getRotation()[3]
        wonder_data['wonder_obj'].setRotation({
            wonder_data['wonder_rot'][1],
            wonder_data['wonder_rot'][2],
            wonder_rot_z
        })

        -- setting to the default position
        wonder_data['wonder_obj'].setPosition(wonder_data['wonder_pos'])
    end
end

-- TODO COMMENT
function nextGamePhase()

    -- wonder side phase
    if CURRENT_PHASE == 0 then
        STATUS_PANEL.call("resetPlayersStatus")

        resetWondersPos()

        CURRENT_PHASE = CURRENT_PHASE + 1
        nextGamePhase()

        return
    end

    -- start age 1 phase
    if CURRENT_PHASE == 1 then
        STATUS_PANEL.call("resetPlayersStatus")

        broadcastToAll("Starting First Age")
        print("Turn : " .. CURRENT_PHASE)
        deck_age1.deal(7)

        CURRENT_PHASE = CURRENT_PHASE + 1
        return
    end

    -- from age1 turn 2 to age1 turn 6
    if CURRENT_PHASE >= 2 and CURRENT_PHASE < 6 then
        STATUS_PANEL.call("resetPlayersStatus")

        passLeft()

        print("Turn : " .. CURRENT_PHASE)
        CURRENT_PHASE = CURRENT_PHASE + 1
        return
    end

    if CURRENT_PHASE == 6 then
        STATUS_PANEL.call("resetPlayersStatus")

        passLeft()
        broadcastToAll("Last turn of the First Age", undefined)

        -- TODO SELL LAST CARD

        CURRENT_PHASE = CURRENT_PHASE + 1
        return
    end

    if CURRENT_PHASE == 7 then
        STATUS_PANEL.call("resetPlayersStatus")

        -- TODO
        broadcastToAll("Resolving military conflict")

        CURRENT_PHASE = CURRENT_PHASE + 1
        return
    end

    if CURRENT_PHASE == 8 then
        STATUS_PANEL.call("resetPlayersStatus")

        broadcastToAll("Starting Second Age")
        print("Turn : " .. CURRENT_PHASE)
        deck_age2.deal(7)

        CURRENT_PHASE = CURRENT_PHASE + 1
        return
    end

end

-- pass all cards in each players' hand to its left neighbor
function passLeft()
    local sorted_colors = Global.call('getPlayersSorted')
    local cards_in_hands = {}

    -- we first store each hand inside a table
    for _, color in pairs(sorted_colors) do
        cards_in_hands[color] = Player[color].getHandObjects()
    end

    -- and now we iterate through every player in the match to "shift" its hand
    -- because we are using a standard i for loop we can access both sorted_colors and cards_in_hands
    for i = 1, #sorted_colors do

        -- this won't give us an out of range error and set the next player as the first one
        local next_player = i + 1
        if next_player > #sorted_colors then next_player = 1 end

        -- iterate each card in the i-th hand and set its position the the next player's hand
        for _, card in pairs(cards_in_hands[sorted_colors[i]]) do
            local position = Player[sorted_colors[next_player]].getHandTransform().position
            card.setPosition(position)

            local rotation = Player[sorted_colors[next_player]].getHandTransform().rotation
            card.setRotation({
                rotation[1],
                rotation[2] + 180,
                rotation[3]
            })
        end
    end
end

-- pass all cards in each players' hand to its right neighbor
function passRight()
    local sorted_colors = Global.call('getPlayersSorted')
    local cards_in_hands = {}

    -- we first store each hand inside a table
    for _, color in pairs(sorted_colors) do
        cards_in_hands[color] = Player[color].getHandObjects()
    end

    -- and now we iterate through every player in the match to "shift" its hand
    -- because we are using a standard i for loop we can access both sorted_colors and cards_in_hands
    for i = #sorted_colors, 1, -1 do

        -- this won't give us an out of range error and set the next player as the first one
        local next_player = i - 1
        if next_player <= 0 then next_player = #sorted_colors end

        -- iterate each card in the i-th hand and set its position the the next player's hand
        for _, card in pairs(cards_in_hands[sorted_colors[i]]) do
            local position = Player[sorted_colors[next_player]].getHandTransform().position
            card.setPosition(position)

            local rotation = Player[sorted_colors[next_player]].getHandTransform().rotation
            card.setRotation({
                rotation[1],
                rotation[2] + 180,
                rotation[3]
            })
        end
    end
end

-- ! TESTING
function testCards()

    local deck = getObjectFromGUID('501ae8')
    local players = Global.getTable('PLAYERS')

    local max_cards = {5, 13, 3, 20, 19, 20, 6, 5, 14, 5, 3, 9, 21}
    local stack_names = {}

    for _, color in pairs(getSeatedPlayers()) do

        local relative_rot = Vector(0, 0, 0)
        relative_rot[1] = Player[color].getHandTransform(1).rotation[1]
        relative_rot[2] = Player[color].getHandTransform(1).rotation[2] + 180
        relative_rot[3] = Player[color].getHandTransform(1).rotation[3]

        for name, _ in pairs(players[string.lower(color)]['objects']) do
            table.insert(stack_names, name)
        end

        for i = 1, #max_cards do
            for j = 1, max_cards[i] do
                local stack_name = stack_names[i]
                local position = players[string.lower(color)]['objects'][stack_name]['origin']

                position[1] = position[1] + Player[color].getHandTransform(1).forward[1] * - 1
                position[2] = 2
                position[3] = position[3] + Player[color].getHandTransform(1).forward[3] * - 1

                local card_placed = deck.takeObject({
                    position = position,
                    rotation = relative_rot,
                    smooth = false,
                    -- callback_function = function (spawned_object)
                        -- spawned_object.setLock(true)
                    -- end
                })

                wait(1)
                card_placed.setLock(true)
            end
        end
    end
end

function wait(time)
    local start = os.time()
    repeat
        coroutine.yield(0)
    until os.time() > start + time
end

function onChat(msg)
    if msg == 'left' then
        passLeft()
    end

    if msg == 'right' then
        passRight()
    end

    if msg == 'force turn' then
        nextGamePhase()
    end
end