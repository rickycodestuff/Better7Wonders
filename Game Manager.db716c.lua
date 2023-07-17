---@diagnostic disable: lowercase-global

-- ┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
-- │                                                   IN-GAME OBJECTS                                                │
-- └──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

BASE_DECK_GUID = {
    ["age1"] = {'df6181', 'ab60e5', '0ba410', 'd31232', 'a86148'},
    ["age2"] = {'10bde5', 'ff4d7e', 'edd70b', 'e64174', '491048'},
    ["age3"] = {'6d3f26', '73a442', '769796', '468520', 'ddf0ef'}
}

GUILD_DECK_GUID = 'a99d89'

WONDERS = {
    -- alexandria
    ["65a7e6"] = {
        ["day"] = {
            ["steps"] = 3
        },
        ["night"] = {
            ["steps"] = 3
        }
    },

    -- gizah
    ["066a81"] = {
        ["day"] = {
            ["steps"] = 3
        },
        ["night"] = {
            ["steps"] = 4
        }
    },

    -- olympia
    ["79aad5"] = {
        ["day"] = {
            ["steps"] = 3
        },
        ["night"] = {
            ["steps"] = 3
        }
    },

    -- ephesos
    ["e12dcb"] = {
        ["day"] = {
            ["steps"] = 3
        },
        ["night"] = {
            ["steps"] = 3
        }
    },

    -- halikarnas
    ["e8fab1"] = {
        ["day"] = {
            ["steps"] = 3
        },
        ["night"] = {
            ["steps"] = 3
        }
    },

    -- rodhos
    ["455750"] = {
        ["day"] = {
            ["steps"] = 3
        },
        ["night"] = {
            ["steps"] = 2
        }
    },

    -- babylon
    ["1b7653"] = {
        ["day"] = {
            ["steps"] = 3
        },
        ["night"] = {
            ["steps"] = 2
        }
    },

    -- carthagine
    ["d401ea"] = {
        ["day"] = {
            ["steps"] = 3
        },
        ["night"] = {
            ["steps"] = 2
        }
    },
}

WONDERS_BAGS = {
    ["base"] = '56d45b',
    ["leaders"] = '053343',
    ["cities"] = 'a49969',
    ["armada"] = 'e1435d',
    ["edifice"] = 'd9d9c0'
}

COINS_BAGS = {
    ["silver"] = 'b6fb06',      -- 1 gold coins
    ["gold"] =  '366c77',       -- 3 gold coins
    ["bronze"] = 'f2677a'       -- 6 gold coins 
}

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

CURRENT_AGE = 0
CURRENT_TURN = 0

function onLoad(save_state)
    -- this is just the init of the other scripts
    STATUS_PANEL = Global.getVar("STATUS_PANEL")
    PLAYERS_MENU = Global.getVar("PLAYERS_MENU")
end

-- ┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
-- │                                                   FUNCTIONS                                                      │
-- └──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

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
    STATUS_PANEL.call("setStatusPanelTitle", "CHOOSE WONDER'S SIDE")
    STATUS_PANEL.setVar("GLOBAL_STATUS", true)
    broadcastToAll("Chose your wonder's side")

    -- ! after this part the rest of the game is managed by
    -- ! both Game Manager and Status Panel
    -- ! everytime there's a new turn, Status Panel will call the next game phase
    -- ! onyl if every players is ready

    -- without this the LuaCoroutine will give us an error
    return 1
end

-- ┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
-- │                                                   SETUP FUNCTIONS                                                │
-- └──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

function decksSetup()
    -- getting the base decks from our global table
    -- every element in that table is an array in wich we stored every GUID of every decks of the base game
    -- so in the 'age1' array will have the guid for the 3+ players deck, for the 4+ players deck etc. etc.
    local base_deck = self.getTable("BASE_DECK_GUID")

    -- this function will prepare the decks depending on how many players there are in the match
    -- since its impossible to play in less than 3 players we can already store our base decks
    deck_age1 = getObjectFromGUID(base_deck['age1'][1])
    deck_age2 = getObjectFromGUID(base_deck['age2'][1])

    -- the base deck for age3 its made of the base age3 cards plus N guild cards
    -- so we'll prepare both of them and then join them
    deck_age3 = getObjectFromGUID(base_deck['age3'][1])
    local deck_guild = getObjectFromGUID(GUILD_DECK_GUID)
    
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
    local wonders_bags = self.getTable('WONDERS_BAGS')  -- this give us the entire table of wonders guid, each divided for expansion
    local coins_bag = self.getTable('COINS_BAGS')

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
        local new_table = Global.getTable("PLAYERS")
        new_table[string.lower(color)]["objects"]["wonder"]["guid"] = player_wonder.guid
        new_table[string.lower(color)]["objects"]["wonder"]["default_pos"] = wonder_pos
        new_table[string.lower(color)]["objects"]["wonder"]["default_rot"] = relative_rot

        Global.setTable("PLAYERS", new_table)

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

-- ┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
-- │                                                   FUNCTIONS                                                      │
-- └──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

-- since tabletop doesn't have threads
-- this is our best way to emulate a thread system
-- this function is called after every player has set their status to ready
-- it wil go into the next game phase and resolve the previous one
function nextGamePhase()
    -- dynamic variables
    local cards_to_deal = 7
    local max_turns = 6

    -- the function is frst called when all the players have to choose their wonder side
    -- so basically when the turn is stil 0
    if CURRENT_TURN == 0 then
        -- storing inside the PLAYERS table the wonder data
        saveWonderSide()

        -- reset the player status to make them all not ready
        STATUS_PANEL.call("resetPlayersStatus")

        -- generate a menu actions for each player
        PLAYERS_MENU.call("generateMenus")

        -- now we are ready to begin the first turn
        CURRENT_AGE = CURRENT_AGE + 1
        CURRENT_TURN = CURRENT_TURN + 1
        nextGamePhase()
        return
    end

    -- ! first turn
    if CURRENT_TURN == 1 then
        -- updating the status panel title for age and turn
        local title = "AGE " .. tostring(CURRENT_AGE) .. " - FIRST TURN"
        STATUS_PANEL.call("setStatusPanelTitle", title)

        -- warning players
        broadcastToAll("Starting Age " .. tostring(CURRENT_AGE), "Red")

        -- dealing cards based on the current age
        if CURRENT_AGE == 1 then deck_age1.deal(cards_to_deal) end
        if CURRENT_AGE == 2 then deck_age2.deal(cards_to_deal) end
        if CURRENT_AGE == 3 then deck_age3.deal(cards_to_deal) end

        -- makes so players can now set their status 
        -- since its the beginning of a turn
        STATUS_PANEL.setVar("GLOBAL_STATUS", true)

        -- updating the turn so next time the function is called
        -- it will already be on the correct turn
        CURRENT_TURN = CURRENT_TURN + 1
        return
    end

    -- ! from second to second last turn
    -- all of the turns between the second and the second last
    --  follow the same schema, so we'll use only one if statement
    if CURRENT_TURN >= 2 and CURRENT_TURN < max_turns then
        -- first we resolve and reset everything on the previous turn
        resolvePrevTurn()

        -- now that the previous turn is done we can start the new one
        -- updating the status panel title
        local title = "AGE " .. tostring(CURRENT_AGE) .. " - TURN " .. tostring(CURRENT_TURN)
        STATUS_PANEL.call("setStatusPanelTitle", title)

        -- passing the cards depending on the current age
        -- by rules cards will be passed to the left, except for the second age 
        if CURRENT_AGE == 2 then passRight() else passLeft() end

        -- then we'll make so players can now set their status again
        STATUS_PANEL.setVar("GLOBAL_STATUS", true)

        -- updating the turn same as before
        CURRENT_TURN = CURRENT_TURN + 1
        return
    end

    -- ! last turn
    if CURRENT_TURN == max_turns then
        -- same initial schema as the other turns
        resolvePrevTurn()

        -- now that the previous turn is done we can start the new one
        -- updating the status panel title
        local title = "AGE " .. tostring(CURRENT_AGE) .. " - LAST TURN "
        STATUS_PANEL.call("setStatusPanelTitle", title)

        -- warning players
        broadcastToAll("Ending of Age " .. tostring(CURRENT_AGE), "Red")

        -- players can now set their status again
        STATUS_PANEL.setVar("GLOBAL_STATUS", true)

        -- since this is the last turn of the current age we'll now update
        -- the current turn again but not for the normal next turn
        -- the "next turn" will actually be the resolution of the military and naval conflict
        CURRENT_TURN = CURRENT_TURN + 1
        return
    end

    -- ! resolution of military conflict
    if CURRENT_TURN > max_turns then
        -- since its the last turn players have to choose only card to play
        -- the other one will be moved to the discard pile without bonus
        sellLastCard()

        -- now we can proceed with the resolution
        resolvePrevTurn()

        -- after the last turn is resolved we can go ahead and start
        -- the resolution of military conflict
        local title = "AGE " .. tostring(CURRENT_AGE) .. " - RESOLVING CONFLICT"
        STATUS_PANEL.call("setStatusPanelTitle", title)

        -- TODO MILITARY CONFLICT
        -- TODO NAVAL CONFLICT

        -- now that the age is done we'll update both the current age
        -- and reset the current turn
        CURRENT_AGE = CURRENT_AGE + 1
        CURRENT_TURN = 1
        return
    end

    if CURRENT_AGE == 4 then
        -- TODO END OF THE MATCH
        -- calculate final scores

        broadcastToAll("End of the match!")
        return
    end
end

-- this function is called right after all players have chosen their wonder side 
-- and since i like having a steady position for my wonder 
-- it doesn't matter if they move it around it will reset to its default position
function saveWonderSide()
    local new_players = Global.getTable('PLAYERS')

    for _, player_color in pairs(getSeatedPlayers()) do

        local wonder_data = new_players[string.lower(player_color)]["objects"]["wonder"]
        local wonder_obj = getObjectFromGUID(wonder_data["guid"])

        -- if the player flipped the wonder it wont reset its rotation
        local wonder_rot_z = wonder_obj.getRotation()[3]
        wonder_obj.setRotation({
            wonder_data["default_rot"][1],
            wonder_data["default_rot"][2],
            wonder_rot_z
        })

        -- setting to the default position
        wonder_obj.setPosition(wonder_data["default_pos"])

        -- after placing the wonder we'll save its flip status
        -- so if the player has flipped its wonder it means that its z axis is now 180
        -- and since whenever you flip or rotate an object in tts its not very precise we set a range for that 
        if math.floor(wonder_rot_z) < 182 and math.floor(wonder_rot_z) > 178 then
            new_players[string.lower(player_color)]["objects"]["wonder"]["side"] = "night"
        else
            new_players[string.lower(player_color)]["objects"]["wonder"]["side"] = "day"
        end
    end

    Global.setTable("PLAYERS", new_players)
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

-- ┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
-- │                                                   ACTION FUNCTIONS                                               │
-- └──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

-- TODO COMMENT
function resolvePrevTurn()
    -- while the script resolve every action we make sure no players
    -- can set their status, we won't have any problems like this
    -- todo maybe move camera to show cards played
    STATUS_PANEL.setVar("GLOBAL_STATUS", true)

    local new_players = Global.getTable("PLAYERS")

    for _, color in pairs(getSeatedPlayers()) do
        local player_color = string.lower(color)

        -- for each player we'll get his zone data and card he just placed
        local zone_data = new_players[player_color]["card_zone"]
        local card_to_play = getObjectFromGUID(zone_data["guid"]).getObjects()[1]

        -- using the zone data we'll get the action chosen byt that player
        -- and call the function bases on that action
        if zone_data["action"] == "play" then playCardSwitchCase(new_players, card_to_play, player_color) end
        -- TODO wonder 
        if zone_data["action"] == "sell" then sellCard(card_to_play) end

        -- once we've resolved the chosen actions we can go ahead and reset them
        -- so the player will be ready to chose his next action on the next turn
        zone_data["action"] = nil
    end

    Global.setTable("PLAYERS", new_players)

    -- lastly since we are going into a new turn we reset the status as well
    STATUS_PANEL.call("resetPlayersStatus")
end

-- this function only serves as a "switch-like" the the real function under it
function playCardSwitchCase(players_table, card, color)
    if card.hasTag("NB Resource") then playCard(players_table, color, card, "nb_resource") return end -- todo add to game
    if card.hasTag("Brown") then playCard(players_table, color, card, "brown") return end
    if card.hasTag("Grey") then playCard(players_table, color, card, "grey") return end
    if card.hasTag("Commerce") then playCard(players_table, color, card, "commerce") return end
    if card.hasTag("Blue") then playCard(players_table, color, card, "blue") return end
    if card.hasTag("Military") then playCard(players_table, color, card, "military") return end
    if card.hasTag("Naval") then playCard(players_table, color, card, "naval") return end -- todo add to game
    if card.hasTag("Compass") then playCard(players_table, color, card, "compass") return end
    if card.hasTag("Tablet") then playCard(players_table, color, card, "tablet") return end
    if card.hasTag("Gear") then playCard(players_table, color, card, "gear") return end
    if card.hasTag("Green Island") then playCard(players_table, color, card, "green_island") return end -- todo add to game
    if card.hasTag("Purple") then playCard(players_table, color, card, "purple") return end -- todo add to game
    if card.hasTag("Black") then playCard(players_table, color, card, "black") return end -- todo add to game
end

-- place a card in that player[color] area with a given prefix
function playCard(players_table, color, card, stack_prefix)
    local player_hand = Player[color].getHandTransform(1)
    local stack_name = stack_prefix .. "_stack"
    local cards = players_table[color]["stacks"][stack_name]["cards"]

    -- if you look at the PLAYERS table inside Global 
    -- you'll see that every player has a ["stack"] table 
    -- every element in that table is also a table named like ["something_stack"]
    -- so to access that stack origin position we first need to buil the stack name
    -- we do that using that stack_prefix passed as paramater
    -- example: 
    --      stack_prefix = "brown"
    --      stack_name = "brown" .. "_stack" -> "brownn_stack"

    -- thanks to the stack name we can now access to that stack origin
    local card_pos = Vector(players_table[color]["stacks"][stack_name]["origin"])
    card_pos[1] = card_pos[1] + player_hand.forward[1] * #cards * -1
    card_pos[3] = card_pos[3] + player_hand.forward[3] * #cards * -1

    -- even tho the player has already positioned his card according to his rotation
    -- we still set the card rotation using his rotation, for best practice
    local card_rot = Vector(0, 0, 0)
    card_rot[1] = player_hand.rotation[1]
    card_rot[2] = player_hand.rotation[2] + 180
    card_rot[3] = player_hand.rotation[3]

    -- the lua coroutine for the card placing
    function coinside()
        coroutine.yield(0)

        card.setRotation(card_rot)
        card.setPositionSmooth(card_pos)

        return 1
    end

    startLuaCoroutine(self, "coinside")

    -- after placing the card we'll update the table of cads in that stack for that player
    -- this will come in handy for many features in the mod but most importantly
    -- it will help us placing the other card in the same column
    cards[#cards + 1] = card
end

-- move the chosen card in the discard pile
function sellCard(card)
    function coinside()
        coroutine.yield(0)

        -- place card flipped in the discard pile
        card.setRotation({0, 180, 180})
        card.setPosition({0, 2, 0})

        -- TODO give 3 coins

        return 1
    end

    startLuaCoroutine(self, "coinside")
end

-- called at last turn of each age
-- move the last card in the player's hand in the discard pile
function sellLastCard()
    for _, color in pairs(getSeatedPlayers()) do
        local player_hand = Player[color].getHandObjects()

        sellCard(player_hand[1])
    end
end

-- ┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
-- │                                                    TESTING & DEBUG                                               │
-- └──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

function testCards()

    local deck = getObjectFromGUID('df6181')
    local players = Global.getTable('PLAYERS')

    local max_cards = {5, 13, 3, 20, 19, 20, 6, 5, 14, 5, 3, 9, 21}
    local stack_names = {}

    for _, color in pairs(getSeatedPlayers()) do

        local relative_rot = Vector(0, 0, 0)
        relative_rot[1] = Player[color].getHandTransform(1).rotation[1]
        relative_rot[2] = Player[color].getHandTransform(1).rotation[2] + 180
        relative_rot[3] = Player[color].getHandTransform(1).rotation[3]

        for name, _ in pairs(players[string.lower(color)]["stacks"]) do
            table.insert(stack_names, name)
        end

        for i = 1, #max_cards do
            for j = 1, max_cards[i] do
                local stack_name = stack_names[i]
                local position = players[string.lower(color)]["stacks"][stack_name]["origin"]
                print(position)

                position[1] = position[1] + Player[color].getHandTransform(1).forward[1] * - 1
                position[2] = 2
                position[3] = position[3] + Player[color].getHandTransform(1).forward[3] * - 1

                local card_placed = deck.takeObject({
                    position = position,
                    rotation = relative_rot,
                    smooth = false
                })

                wait(2)
                card_placed.setLock(true)
            end
        end
    end
end

function testShowPlayersTable()
    local players = Global.getTable("PLAYERS")["purple"]

    print("Purple")
    print("chosen action " .. tostring(players["card_zone"]["action"]))
    print("wonder " .. players["objects"]["wonder"]["guid"])
    print("origin for brown stack " .. tostring(players["stacks"]["brown_stack"]["origin"]))
    print()
end

function wait(time)
    function coinside()
        local start = os.time()
        repeat
            coroutine.yield(0)
        until os.time() > start + time

        return 1
    end

    startLuaCoroutine(self, "coinside")
end

function onChat(msg)
    if msg == 'force turn' then
        nextGamePhase()
    end

    if msg == "selling test" then
        local card_test = getObjectFromGUID("b27993")
        sellCard(card_test)
    end

    if msg == "playing test" then
        local card_test = getObjectFromGUID("ce45ae")
        playCardSwitchCase(card_test, "White")
    end

    if msg == "card stack list" then
        for _, color in pairs(getSeatedPlayers()) do
            local player_color = string.lower(color)
            local new_players = Global.getTable("PLAYERS")

            print(player_color)
            for stack_name, _ in pairs(new_players[player_color]["stacks"]) do
                if stack_name ~= "purple_stack" or stack_name ~= "black_stack" then
                    print(stack_name .. " " .. tostring(#new_players[player_color]["stacks"][stack_name]["cards"]))
                end
            end
        end
    end

    if msg == "show players table" then
        testShowPlayersTable()
    end

    if msg == "card in hand" then
        sellLastCard()
    end
end