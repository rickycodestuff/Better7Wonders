-- ┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
-- │                                                   GLOBAL VARIABLES                                               │
-- └──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

-- this Players Menu object will create a panel menu for each seated players
-- so this table will help us position all of these menus 
-- i would have happily made this as dynamic as possibile but it seems like ther's 
-- no way to understand the link between the in game position/location and the one inside XML
MENUS_OFFEST = {
    ["white"] = {
        ["offsetXY"] = "2640 -2200",
        ["rotation"] = "0 0 0"
    },
    ["purple"] = {
        ["offsetXY"] = "-2640 -2200",
        ["rotation"] = "0 0 0"
    },
    ["red"] = {
        ["offsetXY"] = "-4000 -2144",
        ["rotation"] = "0 0 270"
    },
    ["yellow"] = {
        ["offsetXY"] = "-4000 2144",
        ["rotation"] = "0 0 270"
    },
    ["green"] = {
        ["offsetXY"] = "-2640 2200",
        ["rotation"] = "0 0 180"
    },
    ["orange"] = {
        ["offsetXY"] = "2640 2200",
        ["rotation"] = "0 0 180"
    },
    ["blue"] ={
        ["offsetXY"] = "4000 0",
        ["rotation"] = "0 0 90"
    }
}

function onLoad()
    self.interactable = false
    STATUS_PANEL = Global.getVar("STATUS_PANEL")
end

-- ┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
-- │                                                   FUNCTIONS                                                      │
-- └──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

-- automatically generete the Menus for each seated player
function generateMenus()
    local xml_table = self.UI.getXmlTable()
    local offset_table = self.getTable("MENUS_OFFEST")
    local new_children = {}

    for _, color in pairs(getSeatedPlayers()) do

        -- ! GETTING THE STEPS
        -- the first part of this function will focus on getting the number of step of the player's wonder
        local wonders_table = Global.getVar("GAME_MANAGER").getTable("WONDERS")
        local player_wonder_data = Global.getTable("PLAYERS")[string.lower(color)]["objects"]["wonder"]
        local player_wonder_side = player_wonder_data["side"]
        local steps = nil

        -- if somehow the object registered as "wonder" in the players table isn't a wonder we'll exit the function
        if not getObjectFromGUID(player_wonder_data["guid"]).hasTag("Wonder") then return end

        -- iterate through every guids to find the one that matches the player's wonder guid
        -- and getting the steps for that wonder side 
        for guid, global_wonder_data in pairs(wonders_table) do
            if guid == player_wonder_data["guid"] then
                steps = global_wonder_data[player_wonder_side]["steps"]
            end
        end

        -- ! BUILDING XML 
        -- the second part of the fucntion will instead focus on generating the xml for each menu
        -- i will try to explain how this should work

        -- ? <Panel>
        -- ?
        -- ?    basically this TableLayout it's the first menu, which i like to call the "main menu"
        -- ?    the one when you can choose "play/wonder/sell" as options
        -- ?    i will just write a single row tag but in reality there are three, one for each option of course
        -- ?
        -- ?    <TableLayout>                                  
        -- ?        <Row>                                    
        -- ?            <Cell>                                 
        -- ?                <Button><Text>PLAY</Text></Button>     
        -- ?            </Cell>                                
        -- ?        </Row>                                  
        -- ?    </TableLayout>                            
        -- ?    
        -- ?    this HorizontalLayout instead is the "wonder step menu"
        -- ?    the one that pops up when you click on "wonder step" 
        -- ?    it only contais two elements, a button and another TableLayout
        -- ?    now the button only serves as a "back button" : it let you go back to the main menu
        -- ?
        -- ?    <HorizontalLayout>
        -- ?        <Button><Image></Image></Button>
        -- ?        
        -- ?        the table, instead, will display each step of the player's wonder 
        -- ?        so for example, if player red has a wonder of 2 steps, the script will only generete 2 rows tag 
        -- ?        each row will then contain a button with in-game features, such as: 
        -- ?        letting the player now when they can build that step or telling him what that step does
        -- ?
        -- ?        <TableLayout>
        -- ?            <Row>
        -- ?                <Cell>
        -- ?                    <Button><Text>FIRST STEP</Text></Button>
        -- ?                </Cell>
        -- ?            </Row>
        -- ?        </TableLayout>
        -- ? </Panel>

        -- if you want to understand better start writing from the bottom of this loop
        -- the xml building start at the "panel tag" table
        local steps_table = {}

        for i = 1, steps do
            local text_button_step = {
                tag = "Text",
                attributes = {class="textMenu"},
                value = i .. "° STEP",
                children = {}
            }

            local button_step = {
                tag = "Button",
                attributes = {},
                children = {text_button_step}
            }

            local cell_step = {
                tag = "Cell",
                attributes = {},
                children = {button_step}
            }

            local row_step = {
                tag = "Row",
                attributes = {},
                children = {cell_step}
            }

            steps_table[#steps_table + 1] = row_step
        end

        local tl_steps = {
            tag = "TableLayout",
            attributes = {class = "tableMenuSteps"},
            children = steps_table
        }

        local img_back = {
            tag = "Image",
            attributes = {class = "imgArrow"},
            children = {}
        }

        local button_back = {
            tag = "Button",
            attributes = {
                class="buttonBack",
                onClick="onClickSwitchToBaseMenu"
            },
            children = {img_back}
        }

        local hl_wonder_menu = {
            tag = "HorizontalLayout",
            attributes = {
                id = string.lower(color) .. "WonderMenu",
                class = "tableWonderMenu"
            },
            children = {button_back, tl_steps}
        }

        local text_button_sell = {
            tag = "Text",
            attributes = {class="textMenu"},
            value = "SELL",
            children = {}
        }

        local button_sell = {
            tag = "Button",
            attributes = {
                id = string.lower(color) .. "ButtonSell",
                class = "buttonChooseAction",
                onClick = "onClickActionSell"
            },
            children = {text_button_sell}
        }

        local cell_sell = {
            tag = "Cell",
            attributes = {},
            children = {button_sell}
        }

        local row_sell = {
            tag = "Row",
            attributes = {},
            children = {cell_sell}
        }

        local text_button_wonder = {
            tag = "Text",
            attributes = {class="textMenu"},
            value = "WONDER STEP",
            children = {}
        }

        local button_wonder = {
            tag = "Button",
            attributes = {
                id = string.lower(color) .. "ButtonWonder",
                class = "buttonChooseAction",
                onClick = "onClickSwitchToWonderMenu"
            },
            children = {text_button_wonder}
        }

        local cell_wonder = {
            tag = "Cell",
            attributes = {},
            children = {button_wonder}
        }

        local row_wonder = {
            tag = "Row",
            attributes = {},
            children = {cell_wonder}
        }

        local text_button_play = {
            tag = "Text",
            attributes = {class="textMenu"},
            value = "PLAY",
            children = {}
        }

        local button_play = {
            tag = "Button",
            attributes = {
                id = string.lower(color) .. "ButtonPlay",
                class = "buttonChooseAction",
                onClick = "onClickActionPlay"
            },
            children = {text_button_play}
        }

        local cell_play = {
            tag = "Cell",
            attributes = {},
            children = {button_play}
        }

        local row_play = {
            tag = "Row",
            attributes = {},
            children = {cell_play}
        }

        local tl_base_menu = {
            tag = "TableLayout",
            attributes = {
                id = string.lower(color) .. "BaseMenu",
                class = "tableBaseMenu"
            },
            children = {row_play, row_wonder, row_sell}
        }

        local panel_tag = {
            tag = "Panel",
            attributes = {
                id = string.lower(color) .. "PanelMenu",
                class = "panelMenu",
                offsetXY = offset_table[string.lower(color)]["offsetXY"],
                rotation = offset_table[string.lower(color)]["rotation"],
                visibility = color
            },
            children = {tl_base_menu, hl_wonder_menu}
        }

        -- once we've built this panel tag will append it inside the children table
        new_children[#new_children + 1] = panel_tag
    end

    -- and overwrite the old children the xml_table[2], that is an empty Panel tag
    xml_table[2].children = new_children

    -- lastly we update the xml using a lua coroutine
    function coinside()
        coroutine.yield(0)
        self.UI.setXmlTable(xml_table)
        return 1
    end

    startLuaCoroutine(self, "coinside")
end

-- ┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
-- │                                                   ZONES FUNCTIONS                                                │
-- └──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

function onObjectEnterZone(zone, object)
    for _, color in pairs(getSeatedPlayers()) do
        local player_color = string.lower(color)
        local new_players = Global.getTable("PLAYERS")
        local player_zone = new_players[player_color]["card_zone"]["guid"]

        function showPanelMenu()
            coroutine.yield(0)

            -- whenever an object, new or not, enter the zones it just makes sense that
            -- the menu "refresh itself"; if i for example have changed my mind and wanted 
            -- to play another card i would like to see a "fresh menu" when i drop the new card

            -- so first we turn off all the buttons
            self.UI.setAttribute(player_color .. "ButtonPlay", "color", "white")
            self.UI.setAttribute(player_color .. "ButtonWonder", "color", "white")
            self.UI.setAttribute(player_color .. "ButtonSell", "color", "white")

            -- and obviously reset the player's action
            new_players[player_color]["card_zone"]["action"] = nil
            Global.setTable("PLAYERS", new_players)

            -- finally "refresh" the menu
            self.UI.setAttribute(player_color .. "WonderMenu", "active", "false")
            self.UI.setAttribute(player_color .. "BaseMenu", "active", "true")
            self.UI.setAttribute(player_color .. "PanelMenu", "active", "true")

            return 1
        end

        -- basically the function will only be executed if a card enter a player's zone
        -- each player has already a zone registered to him so the red player can only access the red zone
        if zone.guid == player_zone and object.type == "Card" then
            startLuaCoroutine(self, "showPanelMenu")
        end
    end
end

function onObjectLeaveZone(zone, object)
    for _, color in pairs(getSeatedPlayers()) do
        local player_color = string.lower(color)
        local new_players = Global.getTable("PLAYERS")
        local player_zone = new_players[player_color]["card_zone"]["guid"]

        function hidePanelMenu()
            coroutine.yield(0)

            -- first reset the player's action
            new_players[player_color]["card_zone"]["action"] = nil
            Global.setTable("PLAYERS", new_players)

            -- then reset the status
            local new_status = STATUS_PANEL.getTable("PLAYERS_STATUS")
            new_status[player_color] = false
            STATUS_PANEL.setTable("PLAYERS_STATUS", new_status)
            STATUS_PANEL.call("updateButtonReadyUI", player_color)

            -- finally hide the menu
            self.UI.setAttribute(player_color .. "PanelMenu", "active", "false")

            return 1
        end

        -- basically the function will only be executed if a card enter a player's zone
        if zone.guid == player_zone and object.type == "Card" then
            startLuaCoroutine(self, "hidePanelMenu")
        end
    end
end

-- ┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
-- │                                                   BUTTON FUNCTIONS                                               │
-- └──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

-- called whenever a player clicks on the Play button 
function onClickActionPlay(player, value, id)
    local color = string.lower(player.color)
    local new_players = Global.getTable("PLAYERS")

    if self.UI.getAttribute(id, "color") == "white" then
        new_players[color]["card_zone"]["action"] = "play"
        Global.setTable("PLAYERS", new_players)

        buttonOn(id, color)
        return

    elseif self.UI.getAttribute(id, "color") == "green" then
        new_players[color]["card_zone"]["action"] = nil
        Global.setTable("PLAYERS", new_players)

        buttonOff(id, color)
    end
end

-- called whenever a player clicks on the Wonder button 
-- switch to the wonder menu where the player can choose what step he wants to build
function onClickSwitchToWonderMenu(player, value, id)
    local player_color = string.lower(player.color)

    function coinside()
        self.UI.setAttribute(player_color .. "BaseMenu", "active", "false")
        self.UI.setAttribute(player_color .. "WonderMenu", "active", "true")

        return 1
    end

    startLuaCoroutine(self, "coinside")
end

-- switch to the base menu
function onClickSwitchToBaseMenu(player, value, id)
    local player_color = string.lower(player.color)

    function coinside()
        self.UI.setAttribute(player_color .. "WonderMenu", "active", "false")
        self.UI.setAttribute(player_color .. "BaseMenu", "active", "true")

        return 1
    end

    startLuaCoroutine(self, "coinside")
end

-- called whenever a player clicks on the Sell button
function onClickActionSell(player, value, id)
    local color = string.lower(player.color)
    local new_players = Global.getTable("PLAYERS")

    if self.UI.getAttribute(id, "color") == "white" then
        new_players[color]["card_zone"]["action"] = "sell"
        Global.setTable("PLAYERS", new_players)

        buttonOn(id, color)
        return

    elseif self.UI.getAttribute(id, "color") == "green" then
        new_players[color]["card_zone"]["action"] = nil
        Global.setTable("PLAYERS", new_players)

        buttonOff(id, color)
    end
end

-- this function will turn green the chosen button
function buttonOn(button_id, player_color)
    function coinside()
        coroutine.yield(0)

        -- first we make sure that the player status is set to false
        -- so if a player already set their status as true but changed his mind
        -- by clicking again on another button he'll both turn off his status and set his action
        -- this way ONLY by clicking on the ready button he'll set his status
        local new_status = STATUS_PANEL.getTable("PLAYERS_STATUS")
        new_status[player_color] = false
        STATUS_PANEL.setTable("PLAYERS_STATUS", new_status)
        STATUS_PANEL.call("updateButtonReadyUI", player_color)

        -- then turn off all the buttons
        self.UI.setAttribute(player_color .. "ButtonPlay", "color", "white")
        self.UI.setAttribute(player_color .. "ButtonWonder", "color", "white")
        self.UI.setAttribute(player_color .. "ButtonSell", "color", "white")

        -- finally turn on only the button passed by onClick function
        self.UI.setAttribute(button_id, "color", "green")

        return 1
    end

    startLuaCoroutine(self, "coinside")
end

-- will turn off every button
function buttonOff(button_id, player_color)
    function coinside()
        coroutine.yield(0)

        -- first reset the status
        local new_status = STATUS_PANEL.getTable("PLAYERS_STATUS")
        new_status[player_color] = false
        STATUS_PANEL.setTable("PLAYERS_STATUS", new_status)
        STATUS_PANEL.call("updateButtonReadyUI", player_color)

        -- then turn off only the button passed by onClick function
        self.UI.setAttribute(button_id, "color", "white")

        return 1
    end

    startLuaCoroutine(self, "coinside")
end

-- ┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
-- │                                                            TESTING                                               │
-- └──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

function onChat(message, player)
    if message == "check actions" then
        for _, color in pairs(getSeatedPlayers()) do
            local player_color = string.lower(color)
            local new_players = Global.getTable("PLAYERS")
            local player_action = new_players[player_color]["card_zone"]["action"]

            print(player_color .. " " .. tostring(player_action))
        end
    end

    if message == "white test menu" then
        local offset_table = self.getTable("MENUS_OFFEST")
        local test_xml = self.UI.getXmlTable()
        local new_children = {}

        local mhanz_tag = {
            tag = "Panel",
            attributes = {
                class = "panelMenu",
                color = "red",
                offsetXY = offset_table["purple"]["offsetXY"],
                rotation = offset_table["purple"]["rotation"],
            },
            children = {}
        }

        new_children[#new_children + 1] = mhanz_tag
        test_xml[2].children = new_children
        
        function coinside()
            coroutine.yield(0)
            self.UI.setXmlTable(test_xml)
            return 1
        end
    
        startLuaCoroutine(self, "coinside")
    end
end