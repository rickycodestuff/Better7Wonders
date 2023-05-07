---@diagnostic disable: lowercase-global, undefined-global

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

function startGameClick()
    -- i dont really understand this function but it seems to be mandatory 

    startLuaCoroutine(self, 'startGame')
    self.destruct()
end

function wait(time)
    local start = os.time()
    repeat
        coroutine.yield(0)
    until os.time() > start + time
end

function testPlacements(deck1, deck2, deck3)
    local global_placements = Global.getVar('white_placement')
    local offset_z = -1
    local mixed_deck = deck1

    local max_cards = {5, 13, 3, 20, 19, 20, 6, 5, 14, 5, 3, 9, 21}

    mixed_deck.putObject(deck2)
    mixed_deck.putObject(deck3)
    mixed_deck.shuffle()

    -- island 
    for i = 1, 5 do
        local temp_x = global_placements['card_zone']['island_resources'][1]
        local temp_y = global_placements['card_zone']['island_resources'][2]
        local temp_z = global_placements['card_zone']['island_resources'][3] + offset_z * (i - 1)

        card_placed = mixed_deck.takeObject({
            flip = true,
            smooth = false,
            position = Vector(temp_x, temp_y, temp_z)
        })

        wait(2)

        card_placed.setLock(true)
    end

    -- brown 
    for i = 1, 13 do
        local temp_x = global_placements['card_zone']['brown_resources'][1]
        local temp_y = global_placements['card_zone']['brown_resources'][2]
        local temp_z = global_placements['card_zone']['brown_resources'][3] + offset_z * (i - 1)

        card_placed = mixed_deck.takeObject({
            flip = true,
            smooth = false,
            position = Vector(temp_x, temp_y, temp_z)
        })

        wait(2)

        card_placed.setLock(true)
    end

    -- grey 
    for i = 1, 3 do
        local temp_x = global_placements['card_zone']['grey_resources'][1]
        local temp_y = global_placements['card_zone']['grey_resources'][2]
        local temp_z = global_placements['card_zone']['grey_resources'][3] + offset_z * (i - 1)

        card_placed = mixed_deck.takeObject({
            flip = true,
            smooth = false,
            position = Vector(temp_x, temp_y, temp_z)
        })

        wait(2)

        card_placed.setLock(true)
    end

    -- commerce 
    for i = 1, 20 do
        local temp_x = global_placements['card_zone']['commerce'][1]
        local temp_y = global_placements['card_zone']['commerce'][2]
        local temp_z = global_placements['card_zone']['commerce'][3] + offset_z * (i - 1)

        card_placed = mixed_deck.takeObject({
            flip = true,
            smooth = false,
            position = Vector(temp_x, temp_y, temp_z)
        })

        wait(2)

        card_placed.setLock(true)
    end

    -- blue 
    for i = 1, 19 do
        local temp_x = global_placements['card_zone']['blue'][1]
        local temp_y = global_placements['card_zone']['blue'][2]
        local temp_z = global_placements['card_zone']['blue'][3] + offset_z * (i - 1)

        card_placed = mixed_deck.takeObject({
            flip = true,
            smooth = false,
            position = Vector(temp_x, temp_y, temp_z)
        })

        wait(2)

        card_placed.setLock(true)
    end

    -- red 
    for i = 1, 20 do
        local temp_x = global_placements['card_zone']['war_conflict'][1]
        local temp_y = global_placements['card_zone']['war_conflict'][2]
        local temp_z = global_placements['card_zone']['war_conflict'][3] + offset_z * (i - 1)

        card_placed = mixed_deck.takeObject({
            flip = true,
            smooth = false,
            position = Vector(temp_x, temp_y, temp_z)
        })

        wait(2)

        card_placed.setLock(true)
    end

    -- naval 
    for i = 1, 6 do
        local temp_x = global_placements['card_zone']['naval_conflict'][1]
        local temp_y = global_placements['card_zone']['naval_conflict'][2]
        local temp_z = global_placements['card_zone']['naval_conflict'][3] + offset_z * (i - 1)

        card_placed = mixed_deck.takeObject({
            flip = true,
            smooth = false,
            position = Vector(temp_x, temp_y, temp_z)
        })

        wait(2)

        card_placed.setLock(true)
    end

    -- compass 
    for i = 1, 5 do
        local temp_x = global_placements['card_zone']['compass'][1]
        local temp_y = global_placements['card_zone']['compass'][2]
        local temp_z = global_placements['card_zone']['compass'][3] + offset_z * (i - 1)

        card_placed = mixed_deck.takeObject({
            flip = true,
            smooth = false,
            position = Vector(temp_x, temp_y, temp_z)
        })

        wait(2)

        card_placed.setLock(true)
    end

    -- tablet 
    for i = 1, 14 do
        local temp_x = global_placements['card_zone']['tablet'][1]
        local temp_y = global_placements['card_zone']['tablet'][2]
        local temp_z = global_placements['card_zone']['tablet'][3] + offset_z * (i - 1)

        card_placed = mixed_deck.takeObject({
            flip = true,
            smooth = false,
            position = Vector(temp_x, temp_y, temp_z)
        })

        wait(2)

        card_placed.setLock(true)
    end

    -- gear 
    for i = 1, 5 do
        local temp_x = global_placements['card_zone']['gear'][1]
        local temp_y = global_placements['card_zone']['gear'][2]
        local temp_z = global_placements['card_zone']['gear'][3] + offset_z * (i - 1)

        card_placed = mixed_deck.takeObject({
            flip = true,
            smooth = false,
            position = Vector(temp_x, temp_y, temp_z)
        })

        wait(2)

        card_placed.setLock(true)
    end

    -- green island 
    for i = 1, 3 do
        local temp_x = global_placements['card_zone']['green_island'][1]
        local temp_y = global_placements['card_zone']['green_island'][2]
        local temp_z = global_placements['card_zone']['green_island'][3] + offset_z * (i - 1)

        card_placed = mixed_deck.takeObject({
            flip = true,
            smooth = false,
            position = Vector(temp_x, temp_y, temp_z)
        })

        wait(2)

        card_placed.setLock(true)
    end

    -- purple 
    for i = 1, 9 do
        local temp_x = global_placements['card_zone']['purple'][1]
        local temp_y = global_placements['card_zone']['purple'][2]
        local temp_z = global_placements['card_zone']['purple'][3] + offset_z * (i - 1)

        card_placed = mixed_deck.takeObject({
            flip = true,
            smooth = false,
            position = Vector(temp_x, temp_y, temp_z)
        })

        wait(2)

        card_placed.setLock(true)
    end

    -- black 
    for i = 1, 21 do
        local temp_x = global_placements['card_zone']['black'][1]
        local temp_y = global_placements['card_zone']['black'][2]
        local temp_z = global_placements['card_zone']['black'][3] + offset_z * (i - 1)

        card_placed = mixed_deck.takeObject({
            flip = true,
            smooth = false,
            position = Vector(temp_x, temp_y, temp_z)
        })

        wait(2)

        card_placed.setLock(true)
    end
end

function decksSetup(deck_age1, deck_age2, deck_age3, deck_guild)

    -- this function will prepare the decks depending on how many players there are in the match

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

    -- once we've built our decks we shuffle them
    deck_age1.shuffle()
    deck_age2.shuffle()
    deck_age3.shuffle()
end

function wondersSetup(wonders_bags)

    -- the first part of this function will add (if the players picked the expansions) the expansions wonders

    local base_wonders_bag = getObjectFromGUID(wonders_bags['base'])

    if leaders_exp then
        
    end

    if cities_exp then
        
    end

    if armada_exp then
        
    end

    if edifice_exp then
        
    end

    base_wonders_bag.shuffle()

    -- and in this part will handle the placement of every wonder
    -- for every player will be calculating the coordinates for their wonder based on their hand position
    -- every hand is already placed following some "symmetrical rules"
    for _, color in pairs(getSeatedPlayers()) do

        local hand = Player[color].getHandTransform(1)  -- this 1 is the index of the zones owned by that color

        -- initialize of our position and rotation
        local wonder_pos = Vector(0, 0, 0)
        local wonder_rot = Vector(0, 0, 0)

        local wonder_offset = Global.getVar('OBJECTS_OFFSETS')['wonder']

        -- since we are using forward to see in wich "direction" the wonder will face
        -- only the x or the z coordinate will change, depending on the player's hand position
        -- the other cordinate will be the same as the player's
        wonder_pos[1] = hand.position[1] + hand.forward[1] * wonder_offset
        wonder_pos[2] = 2   -- we also don't care about the Y, we'll just let it "fall" on the table
        wonder_pos[3] = hand.position[3] + hand.forward[3] * wonder_offset

        -- the rotation in the other hand will be the same as the player's 
        -- but, if we dont "flip" the Y the wonder will be facing the center of the table
        -- we instaed want it to face us, the player
        wonder_rot[1] = hand.rotation[1]
        wonder_rot[2] = hand.rotation[2] + 180
        wonder_rot[3] = hand.rotation[3]

        local current_wonder = base_wonders_bag.takeObject({
            position = wonder_pos,
            rotation = wonder_rot,
            smooth = false
        })

        -- in the end we'll lock it so it won't move due to the game's physic
        wait(1)
        current_wonder.setLock(true)

    end
end

function startGame()

    -- ! MAIN FUNCTION
    -- this is where the game will be setup and where it will start
    -- if you are looking for something it's probably somewhere here 

    -- ! CARDS SETUP
    -- getting the base decks from our global table
    -- every element in that table is an array in wich we stored every GUID of every decks of the base game
    -- so in the 'age1' array will have the guid for the 3+ players deck, for the 4+ players deck etc. etc.
    local base_deck = Global.getVar('BASE_DECK_GUID')

    -- since its impossible to play in less than 3 players we can already store our base decks
    local deck_age1 = getObjectFromGUID(base_deck['age1'][1])
    local deck_age2 = getObjectFromGUID(base_deck['age2'][1])

    -- the base deck for age3 its made of the base age3 cards plus N guild cards
    -- so we'll prepare both of them and then join them
    local deck_age3 = getObjectFromGUID(base_deck['age3'][1])
    local deck_guild = getObjectFromGUID(Global.getVar('GUILD_DECK_GUID'))

    -- this function will handle all of the extra cards for every extra players
    decksSetup(deck_age1, deck_age2, deck_age3, deck_guild)

    -- ! WONDERS SETUP
    -- this is our main tables for every bags of wonders containing every wonders in the game
    local wonders_bags = Global.getVar('WONDERS_BAGS')

    -- this function will handle the placement and the add of new wonders
    wondersSetup(wonders_bags)

    -- without this the LuaCoroutine will give us an error
    return 1
end