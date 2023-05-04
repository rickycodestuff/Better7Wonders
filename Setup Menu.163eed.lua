---@diagnostic disable: lowercase-global, undefined-global

function onLoad()
    local players = getObjectFromGUID(Global.getVar('UTILS')).call('getPlayerCount')

    -- update the number of player on the setup UI
    -- the next times we will call this function this part wont to interfere with anything 
    self.UI.setValue("playerCountLabel", "Players: " .. players)
end

function onPlayerChangeColor()
    local players = getObjectFromGUID(Global.getVar('UTILS')).call('getPlayerCount')

    -- update the number of player on the setup UI
    -- the next times we will call this function this part wont to interfere with anything 
    self.UI.setValue("playerCountLabel", "Players: " .. players)
end

function startGameClick()
    -- i dont really understand this function but it seems to be mandatory 

    startLuaCoroutine(self, 'startGame')
    self.destruct()
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
    if getObjectFromGUID(Global.getVar('UTILS')).call('getPlayerCount') >= 4 then
        deck_age1.putObject(getObjectFromGUID(base_deck['age1'][2]))
        deck_age2.putObject(getObjectFromGUID(base_deck['age2'][2]))
        deck_age3.putObject(getObjectFromGUID(base_deck['age3'][2]))
    end

    -- add 5+ cards
    if getObjectFromGUID(Global.getVar('UTILS')).call('getPlayerCount') >= 5 then
        deck_age1.putObject(getObjectFromGUID(base_deck['age1'][3]))
        deck_age2.putObject(getObjectFromGUID(base_deck['age2'][3]))
        deck_age3.putObject(getObjectFromGUID(base_deck['age3'][3]))
    end

    -- add 6+ cards
    if getObjectFromGUID(Global.getVar('UTILS')).call('getPlayerCount') >= 6 then
        deck_age1.putObject(getObjectFromGUID(base_deck['age1'][4]))
        deck_age2.putObject(getObjectFromGUID(base_deck['age2'][4]))
        deck_age3.putObject(getObjectFromGUID(base_deck['age3'][4]))
    end

    -- add 7+ cards
    if getObjectFromGUID(Global.getVar('UTILS')).call('getPlayerCount') == 7 then
        deck_age1.putObject(getObjectFromGUID(base_deck['age1'][5]))
        deck_age2.putObject(getObjectFromGUID(base_deck['age2'][5]))
        deck_age3.putObject(getObjectFromGUID(base_deck['age3'][5]))
    end

    -- prepare the guild deck
    for i = 1, getObjectFromGUID(Global.getVar('UTILS')).call('getPlayerCount') + 2 do
        deck_guild.shuffle()

        deck_age3.putObject(deck_guild.takeObject())
    end

    -- once we've built our decks we'll shuffle them
    deck_age1.shuffle()
    deck_age2.shuffle()
    deck_age3.shuffle()
    
    -- without this the LuaCoroutine will give us an error
    return 1
end