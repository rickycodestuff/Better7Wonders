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

    for i in pair(global_placements) do
        print(i)
    end

    -- for i, type_card in pairs(global_placements) do
        -- for j = 1, max_cards[i] do
            -- 
        -- end
    -- end

    -- for _, max in pairs(max_cards) do
    --     for k = 1, max do
    --         for _, column_name in pairs(global_placements) do
    --             local temp_x = column_name[1]
    --             local temp_y = column_name[2]
    --             local temp_z = column_name[3] + offset_z * (k - 1)

    --             card_placed = mixed_deck.takeObject({
    --                 flip = true,
    --                 smooth = false,
    --                 position = Vector(temp_x, temp_y, temp_z)
    --             })

    --             wait(2)

    --             card_placed.setLock(true)
    --         end
    --     end
    -- end

    -- island 
    -- for i = 1, 5 do
    --     local temp_x = global_placements['island_resources'][1]
    --     local temp_y = global_placements['island_resources'][2]
    --     local temp_z = global_placements['island_resources'][3] + offset_z * (i - 1)

    --     card_placed = mixed_deck.takeObject({
    --         flip = true,
    --         smooth = false,
    --         position = Vector(temp_x, temp_y, temp_z)
    --     })

    --     wait(2)

    --     card_placed.setLock(true)
    -- end

    -- -- brown 
    -- for i = 1, 13 do
    --     local temp_x = global_placements['brown_resources'][1]
    --     local temp_y = global_placements['brown_resources'][2]
    --     local temp_z = global_placements['brown_resources'][3] + offset_z * (i - 1)

    --     card_placed = mixed_deck.takeObject({
    --         flip = true,
    --         smooth = false,
    --         position = Vector(temp_x, temp_y, temp_z)
    --     })

    --     wait(2)

    --     card_placed.setLock(true)
    -- end

    -- -- grey 
    -- for i = 1, 3 do
    --     local temp_x = global_placements['grey_resources'][1]
    --     local temp_y = global_placements['grey_resources'][2]
    --     local temp_z = global_placements['grey_resources'][3] + offset_z * (i - 1)

    --     card_placed = mixed_deck.takeObject({
    --         flip = true,
    --         smooth = false,
    --         position = Vector(temp_x, temp_y, temp_z)
    --     })

    --     wait(2)

    --     card_placed.setLock(true)
    -- end

    -- -- commerce 
    -- for i = 1, 20 do
    --     local temp_x = global_placements['commerce'][1]
    --     local temp_y = global_placements['commerce'][2]
    --     local temp_z = global_placements['commerce'][3] + offset_z * (i - 1)

    --     card_placed = mixed_deck.takeObject({
    --         flip = true,
    --         smooth = false,
    --         position = Vector(temp_x, temp_y, temp_z)
    --     })

    --     wait(2)

    --     card_placed.setLock(true)
    -- end

    -- -- blue 
    -- for i = 1, 19 do
    --     local temp_x = global_placements['blue'][1]
    --     local temp_y = global_placements['blue'][2]
    --     local temp_z = global_placements['blue'][3] + offset_z * (i - 1)

    --     card_placed = mixed_deck.takeObject({
    --         flip = true,
    --         smooth = false,
    --         position = Vector(temp_x, temp_y, temp_z)
    --     })

    --     wait(2)

    --     card_placed.setLock(true)
    -- end

    -- -- red 
    -- for i = 1, 20 do
    --     local temp_x = global_placements['war_conflict'][1]
    --     local temp_y = global_placements['war_conflict'][2]
    --     local temp_z = global_placements['war_conflict'][3] + offset_z * (i - 1)

    --     card_placed = mixed_deck.takeObject({
    --         flip = true,
    --         smooth = false,
    --         position = Vector(temp_x, temp_y, temp_z)
    --     })

    --     wait(2)

    --     card_placed.setLock(true)
    -- end

    -- -- naval 
    -- for i = 1, 6 do
    --     local temp_x = global_placements['naval_conflict'][1]
    --     local temp_y = global_placements['naval_conflict'][2]
    --     local temp_z = global_placements['naval_conflict'][3] + offset_z * (i - 1)

    --     card_placed = mixed_deck.takeObject({
    --         flip = true,
    --         smooth = false,
    --         position = Vector(temp_x, temp_y, temp_z)
    --     })

    --     wait(2)

    --     card_placed.setLock(true)
    -- end

    -- -- compass 
    -- for i = 1, 5 do
    --     local temp_x = global_placements['compass'][1]
    --     local temp_y = global_placements['compass'][2]
    --     local temp_z = global_placements['compass'][3] + offset_z * (i - 1)

    --     card_placed = mixed_deck.takeObject({
    --         flip = true,
    --         smooth = false,
    --         position = Vector(temp_x, temp_y, temp_z)
    --     })

    --     wait(2)

    --     card_placed.setLock(true)
    -- end

    -- -- tablet 
    -- for i = 1, 14 do
    --     local temp_x = global_placements['tablet'][1]
    --     local temp_y = global_placements['tablet'][2]
    --     local temp_z = global_placements['tablet'][3] + offset_z * (i - 1)

    --     card_placed = mixed_deck.takeObject({
    --         flip = true,
    --         smooth = false,
    --         position = Vector(temp_x, temp_y, temp_z)
    --     })

    --     wait(2)

    --     card_placed.setLock(true)
    -- end

    -- -- gear 
    -- for i = 1, 5 do
    --     local temp_x = global_placements['gear'][1]
    --     local temp_y = global_placements['gear'][2]
    --     local temp_z = global_placements['gear'][3] + offset_z * (i - 1)

    --     card_placed = mixed_deck.takeObject({
    --         flip = true,
    --         smooth = false,
    --         position = Vector(temp_x, temp_y, temp_z)
    --     })

    --     wait(2)

    --     card_placed.setLock(true)
    -- end

    -- -- green island 
    -- for i = 1, 3 do
    --     local temp_x = global_placements['green_island'][1]
    --     local temp_y = global_placements['green_island'][2]
    --     local temp_z = global_placements['green_island'][3] + offset_z * (i - 1)

    --     card_placed = mixed_deck.takeObject({
    --         flip = true,
    --         smooth = false,
    --         position = Vector(temp_x, temp_y, temp_z)
    --     })

    --     wait(2)

    --     card_placed.setLock(true)
    -- end

    -- -- purple 
    -- for i = 1, 9 do
    --     local temp_x = global_placements['purple'][1]
    --     local temp_y = global_placements['purple'][2]
    --     local temp_z = global_placements['purple'][3] + offset_z * (i - 1)

    --     card_placed = mixed_deck.takeObject({
    --         flip = true,
    --         smooth = false,
    --         position = Vector(temp_x, temp_y, temp_z)
    --     })

    --     wait(2)

    --     card_placed.setLock(true)
    -- end

    -- -- black 
    -- for i = 1, 21 do
    --     local temp_x = global_placements['black'][1]
    --     local temp_y = global_placements['black'][2]
    --     local temp_z = global_placements['black'][3] + offset_z * (i - 1)

    --     card_placed = mixed_deck.takeObject({
    --         flip = true,
    --         smooth = false,
    --         position = Vector(temp_x, temp_y, temp_z)
    --     })

    --     wait(2)

    --     card_placed.setLock(true)
    -- end
end

function startGame()
    -- main function that will setup and start our game

    -- ! GAME SETUP

    local base_deck = Global.getVar('BASE_DECK_GUID')

    -- since its impossible to play in less than 3 players we can already store our base decks
    -- for every extra player we'll add the extra card decks
    local deck_age1 = getObjectFromGUID(base_deck['age1'][1])
    local deck_age2 = getObjectFromGUID(base_deck['age2'][1])

    -- the base deck for age3 its made of the base age3 cards and N guild cards
    -- so we'll prepare both of them and then join them
    local deck_age3 = getObjectFromGUID(base_deck['age3'][1])
    local deck_guild = getObjectFromGUID(Global.getVar('GUILD_DECK_GUID'))

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

    -- once we've built our decks we'll shuffle them
    deck_age1.shuffle()
    deck_age2.shuffle()
    deck_age3.shuffle()

    testPlacements(deck_age1, deck_age2, deck_age3)

    -- without this the LuaCoroutine will give us an error
    return 1
end