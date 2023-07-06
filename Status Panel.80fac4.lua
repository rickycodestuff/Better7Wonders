-- these are variables that will help us regolate the game's flow

GLOBAL_STATUS = false   -- whenever players can edit their status or not
PLAYERS_STATUS = {}     -- every player's status
ALL_READY = false       -- if all players are ready

GAME_MANAGER_GUID = "db716c"

function onLoad(save_state)
    GAME_MANAGER = getObjectFromGUID(GAME_MANAGER_GUID)
end

function populateStatusPanel()

    -- ! docstring
    -- the goal for this function is to populate the status UI everytime a player joins or changes color
    -- inside our Global.xml we already have a <TableLayout> inside a <Panel> ready to be populated

    -- for every n players we will "build" n rows to collect inside a table 
    -- the xml schema for every row will be as follow
    -- ? <Row>
    -- ?     <Cell>
    -- ?          <Panel class = 'statusBox'>
    -- ?          </Panel>
    -- ?     </Cell>
    -- ?     <Cell>
    -- ?          <Text class = 'playerName'> player.steam_name</Text>
    -- ?     </Cell>
    -- ? </Row>

    -- once we've built all the rows we'll "overwrite" the current children of <TableLayout>
    -- and not append the new children to the old ones
    -- otherwise the status panel will append every new row without removing the old ones

    -- ! real function
    -- all the tags inside Global.xml
    local xml_table = Global.UI.getXmlTable()

    -- this we'll be our "collection" of all the row tags
    -- one row (=table) for each player in the match
    local new_children = {}

    -- except for the first table, it will be the title of our panel
    new_children[1] = xml_table[2]      -- the second child of Global.xml that is <Panel>    
                        .children[1]    -- the first child of <Panel> that is <TableLayout>
                        .children[1]    -- the first child of <TableLayout> that is the title row

    -- now for each player we will generate a row tag
    -- containing his status box and his steam name 
    for _, color in pairs(getSeatedPlayers()) do

        -- this is pretty much for the init of this PLAYERS_STATUS table
        -- so this if statement is saying 'if staus x is nill set it to false'
        if PLAYERS_STATUS[string.lower(color)] == nil then
            PLAYERS_STATUS[string.lower(color)] = false
        end

        -- start reading this from the last table, the row_player  

        -- the player name in question
        local text_player_name = {
            tag            = 'Text',
            attributes     = {class = 'textPlayerName'},
            value          = Player[string.lower(color)].steam_name,
            children       = {}
        }

        -- and this is the second and last child of the <Row>
        -- this <Cell> contains that player's name, it will be displayed next to his status
        local cell_player_name = {
            tag            = 'Cell',
            attributes     = {},
            children       = {text_player_name}
        }

        -- the "check" inside the panel
        -- it will show ✔ for ready; ✘ for not ready
        local text_player_status = {
            tag = 'Text',
            attributes = {
                class = 'textPlayerStatus',
                -- the player.color always return a capitalized color, and I don't like capitalized attributes lmao
                -- so this id will be something like : id = 'whiteTextStatus'
                -- you'll see more of these in my script
                id = string.lower(color) .. 'TextStatus'
            },
            value = PLAYERS_STATUS[string.lower(color)] and '✔' or '✘',
            children = {}
        }

        -- the status box in question
        local panel_player_status = {
            tag            = 'Panel',
            attributes     = {
                class = 'panelPlayerStatus', 
                id = string.lower(color) .. 'BoxStatus',
                color = PLAYERS_STATUS[string.lower(color)] and 'green' or 'red'   -- ternary operator in lua
            },
            children       = {text_player_status}
        }

        -- this is the first child tag, the <Cell> containg the status box
        -- this box will display whenever a player is ready or not
        local cell_player_status = {
            tag            = 'Cell',
            attributes     = {},
            children       = {panel_player_status}
        }

        -- this the parent tag <Row> that contains every other table you see above this 
        local row_player = {
            tag            = 'Row',
            attributes     = {class = 'rowPlayer'},
            children       = {cell_player_status, cell_player_name}
        }

        -- after building this tag we'll append to our collection
        new_children[#new_children + 1] = row_player
    end

    -- before we can update our status panel we'll also check for the minum players for 7 Wonders
    -- spoiler it's 3
    if #getSeatedPlayers() >= 3 then

        -- as asson as 3 or more players are in valid seats let's create a button
        for _, color in pairs(getSeatedPlayers()) do

            -- this is the button that will change our status inside the status panel 
            -- as you can see it's not inside a row nor a cell, and also its visibility changes for every player

            -- without a row and cell tag parent this button (still inside the table) acts like a panel 
            -- that means i can use attributes such as height, width, offsetXY etc. 
            -- but this also means that every button created inside this loop will be at the same position everytime 
            -- in other words every button "overlap" each other

            -- and since their visibility changes for every player you can only see and interact with "your button"
            local button_ready = {
                tag = 'Button',
                attributes = {
                    class = 'buttonReady',
                    id = string.lower(color) .. 'ButtonReady',
                    text = PLAYERS_STATUS[string.lower(color)] and 'Undo Ready' or 'Ready',
                    visibility = color
                },
                children = {}
            }

            -- now this table is full of x rows for every player + x buttons
            new_children[#new_children + 1] = button_ready
        end
    end

    -- lastly we update the UI
    xml_table[2].children[1].children = new_children
    Global.UI.setXmlTable(xml_table)
    updateStatusPanelUI(#getSeatedPlayers())
end

-- since the startLuaCoroutine() function does not let you use paramaters
-- we use this first function as the "outside" of the coroutine function
-- thanks to it we can use its paramater in the "inside"
function updateStatusPanelUI(n_players)
    function coinside()

        -- pauses the coroutine to resolve the UI
        coroutine.yield(0)

        -- to "visually" add a row inside our panel we have to edit its height, using:
        -- 1) each row height
        -- 2) the spacing between each one of them
        -- 3) the height of the panel itself
        -- 4) the padding of the panel
        local row_height = tonumber(Global.UI.getAttribute('rowTitle', 'preferredHeight'))
        local table_spacing = tonumber(Global.UI.getAttribute('tableStatus', 'cellSpacing'))
        local panel_height = tonumber(Global.UI.getAttribute('panelStatus', 'height'))
        local panel_padding = tonumber(Global.UI.getAttribute('panelStatus', 'padding'))

        -- this is the "minum" size of our panel, meaning the size needed to only contain the title
        local new_panel_height = panel_padding + row_height + table_spacing

        -- and we add to it the new player rows
        new_panel_height = new_panel_height + (row_height + table_spacing) * n_players

        if new_panel_height ~= panel_height then
            -- update panel height
            Global.UI.setAttribute('panelStatus', 'height', new_panel_height)
        end

        -- edit the panel based on the ready button 
        -- that shows up only when there are >= 3 players
        if #getSeatedPlayers() >= 3 then

            -- this only serve us to have a more "dynamic" panel
            -- since we have multiple ids built like: "colorButtonReady"
            -- we take the first player and his button id
            local color = getSeatedPlayers()[1]
            local ready_button = string.lower(color) .. 'ButtonReady'
            local row_button_height = tonumber(Global.UI.getAttribute(ready_button, 'height'))

            -- we calculate and update the panel's height based on this height now
            new_panel_height = new_panel_height + row_button_height + panel_padding
            Global.UI.setAttribute('panelStatus', 'height', new_panel_height)
        end

    return 1
    end

    -- the updateStatusPanelUI() will ignore everything in coinside() and jump right into this 
    -- as you can see this is the real function called by the LuaCoroutine
    startLuaCoroutine(self, 'coinside')

    -- if you are wondering why using a LuaCoroutine to do this it's because (as the docs says)
    -- ! "UI changes do not take effect immediately. Any attempt to query the contents of the XML will return stale results"
    -- the LuaCoroutine generates a new "thread" to "resolve" the UI changes
end

-- this is a "toggle" for the status panel 
-- it change and shows whenever a player is ready or not 
function switchStatus(player, value, id)
    local color = string.lower(player.color)

    -- first early return: if player's can't set their status yet
    if not GLOBAL_STATUS then
        return broadcastToColor("Can't change status right now", player.color)
    end

    -- second early return: if a player hasn't chosen an action yet
    local current_phase = GAME_MANAGER.getVar("CURRENT_PHASE")
    local player_action = Global.getTable("PLAYERS")[color]["card_to_play"]["chosen_action"]

    if current_phase > 0 and player_action == nil then
        return broadcastToColor("You must choose an action inside your menu first", player.color)
    end

    -- switch the player status to true -> false and viceversa
    PLAYERS_STATUS[color] = not PLAYERS_STATUS[color]

    -- after switching the status now we must update the Status Panel
    updateButtonReadyUI(color)

    -- check if all players are ready
    if arePlayersReady() then
        GLOBAL_STATUS = false
        broadcastToAll("All players ready!")

        GAME_MANAGER.call("nextGamePhase")
    end

    -- the LuaCoroutine function
    -- function updateButtonReadyUI()

    --     -- pauses the coroutine to resolve the UI
    --     coroutine.yield(0)

    --     -- to display the player status we update 
    --     -- his panel: ✔ = ready and ✘ = not ready (duh)
    --     Global.UI.setAttribute(player_color .. "BoxStatus", "color", PLAYERS_STATUS[player.color] and 'green' or 'red')

    --     -- the text inside the panel green = ready and red = not ready (duh2)
    --     Global.UI.setValue(player_color .. "TextStatus", PLAYERS_STATUS[player.color] and '✔' or '✘')

    --     -- and the text on the button just pressed
    --     Global.UI.setAttribute(player_color .. "ButtonReady", "text", PLAYERS_STATUS[player.color] and 'Undo Ready' or 'Ready')

    --     return 1
    -- end

    -- since we are going to update the UI better do it using a coroutine
    -- startLuaCoroutine(self, 'updateButtonReadyUI')
end

function updateButtonReadyUI(player_color)
    function coinside()
        coroutine.yield(0)

        -- to display the player status we update 
        -- his panel: ✔ = ready and ✘ = not ready (duh)
        Global.UI.setAttribute(player_color .. "BoxStatus", "color", PLAYERS_STATUS[player_color] and 'green' or 'red')

        -- the text inside the panel green = ready and red = not ready (duh2)
        Global.UI.setValue(player_color .. "TextStatus", PLAYERS_STATUS[player_color] and '✔' or '✘')

        -- and the text on the button just pressed
        Global.UI.setAttribute(player_color .. "ButtonReady", "text", PLAYERS_STATUS[player_color] and 'Undo Ready' or 'Ready')

        return 1
    end

    startLuaCoroutine(self, "coinside")
end

function setStatusPanelTitle(title)
    function coinside()

        -- pauses the coroutine to resolve the UI
        coroutine.yield(0)

        -- update the status panel title
        Global.UI.setValue('textStatusTitle', title)

        return 1
    end

    startLuaCoroutine(self, 'coinside')
end

-- the PLAYERS_STATUS table often get "messy" (GOAAAL) when someone changes color 
-- because it stores even colors not used, this is just a way to reset it
-- ! even tho it's not recomended to change seat during the game
function resetPlayersStatus()
    GLOBAL_STATUS = false
    PLAYERS_STATUS = {}

    for _, seated_color in pairs(getSeatedPlayers()) do
        PLAYERS_STATUS[seated_color] = false
    end

    populateStatusPanel()
end

function arePlayersReady()
    for _, status in pairs(PLAYERS_STATUS) do
        if not status then return false end
    end

    ALL_READY = true -- TODO maybe remove???
    return true
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