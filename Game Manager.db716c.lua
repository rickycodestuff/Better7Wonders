---@diagnostic disable: lowercase-global

function startGameClick()
    -- i dont really understand this function but it seems to be mandatory 
    startLuaCoroutine(self, 'startGame')

    -- this object is the setup menu cube, it will dissapear whenever u start the game
    getObjectFromGUID('163eed').destruct()
end

function startGame()

    -- ! MAIN FUNCTION
    -- ! this is where the game will be setup and where it will start
    -- ! if you are looking for something it's probably somewhere here 
    broadcastToAll('Game starting')
    wait(1)

    broadcastToAll('Shuffling decks...')
    wait(2)

    -- ! CARDS SETUP
    decksSetup()

    -- ! PLAYER BOARD SETUP
    playerBoardSetup()
    broadcastToAll("Chose your wonder's side")

    -- this is just for testing placements
    -- testCards()

    -- ! PLAYERS FLIP WONDER
    -- TODO create a new way to flip the wonder and udpate a status

    -- without this the LuaCoroutine will give us an error
    return 1
end

-- ! CARDS SETUP
function decksSetup()
    -- getting the base decks from our global table
    -- every element in that table is an array in wich we stored every GUID of every decks of the base game
    -- so in the 'age1' array will have the guid for the 3+ players deck, for the 4+ players deck etc. etc.
    local base_deck = Global.getVar('BASE_DECK_GUID')

    -- this function will prepare the decks depending on how many players there are in the match
    -- since its impossible to play in less than 3 players we can already store our base decks
    local deck_age1 = getObjectFromGUID(base_deck['age1'][1])
    local deck_age2 = getObjectFromGUID(base_deck['age2'][1])

    -- the base deck for age3 its made of the base age3 cards plus N guild cards
    -- so we'll prepare both of them and then join them
    local deck_age3 = getObjectFromGUID(base_deck['age3'][1])
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

-- ! PLAYER BOARD SETUP
function playerBoardSetup()
    -- in this function we'll prepare everything a player needs to place in his "area"
    -- such as random wonder, coins and stockyard, if armada exp is chosen
    local wonders_bags = Global.getVar('WONDERS_BAGS')  -- this give us the entire table of wonders guid, each divided for expansion
    local coins_bag = Global.getVar('COINS_BAGS')

    -- ! WONDERS SETUP
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

    -- ! COINS SETUP
    local silver_coins_bag = getObjectFromGUID(coins_bag[1])
    local coins = 3

    -- TODO if the players have chosen the leaders expansions they'll have 6 coins
    if leaders_exp then coins = 6 end

    -- ! SHIPYARD SETUP
    -- TODO

    -- ! OBJECTSS PLACEMENT 
    -- for every player will be calculating the coordinates for their wonder based, coins and shipyard on their hand position
    -- every hand is already placed following some "symmetrical rules"
    for _, color in pairs(getSeatedPlayers()) do

        local origin = Player[color].getHandTransform(1)  -- this 1 is the index of the zones owned by that color

        -- since every objects have to face the player we'll use the same rotation for every objects
        local relative_rot = Vector(0, 0, 0)

        -- ! WONDER PLACEMENT
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

        -- TODO add player wonder to global variables so that we can keep track of its data

        --! COINS PLACEMENT
        -- initialize our coins position and rotation
        local coins_pos = Vector(0, 0, 0)
        local coins_rot = Vector(0, 180, 0)

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

            -- ! SHIPYARD PLACEMENT
            -- initialize our shipyard position and rotation
            local shipyard_pos = Vector(0, 0, 0)
            local shipyard_rot = Vector(0, 0, 0)
        
            -- TODO

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