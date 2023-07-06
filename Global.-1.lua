-- ! SCRIPTS GUID
-- i always love to seprate my script in more script to get a cleaer result
-- and in lua tts this is a bit weird because you can't just create a file.lua and that's it 
-- you have to create an in-game object and call its fuction using his guid
STATUS_PANEL_GUID = "80fac4"
STATUS_PANEL = nil

GAME_MANAGER_GUID = "db716c"
GAME_MANAGER = nil

PLAYERS_MENU_GUID = "dfbc38"
PLAYERS_MENU = nil

-- i dont remeber this
TABLE_HEIGHT = 1.41

-- ! OBJECT PLACEMENTS
PLAYERS = {
    ["white"] = {
        ["card_to_play"] = {
            ["zone_guid"] = "80aa1f",
            ["chosen_action"] = nil
        },
        ["objects"] = {
            ["wonder"] = {
                ["guid"] = "",
                ["default_pos"] = nil,
                ["default_rot"] = nil,
                ["side"] = nil
            },
            ["menu"] = {
                ["guid"] = "7a3bce",
                ["pos"] = nil,
                ["rot"] = nil,
            }
        },
        ["stacks"] = {
            ["non_buyable_res_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["brown_res_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["grey_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["commerce_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["blue_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["war_conflict_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["naval_conflict_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["compass_stack"] = {
                ["guid_zone"] = '',
                ["origin"] =nil,

                ["cards"] = {}
            },

            ["tablet_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["gear_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["green_island_stack"] = {
                ["guid_zone"] = '',
                ["origin"] =nil,

                ["cards"] = {}
            },

            ["purple_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["black_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },
        }
    },

    ["purple"] = {
        ["card_to_play"] = {
            ["zone_guid"] = "4dc378",
            ["chosen_action"] = nil
        },
        ["objects"] = {
            ["wonder"] = {
                ["guid"] = "",
                ["default_pos"] = nil,
                ["default_rot"] = nil,
                ["side"] = nil
            },
            ["menu"] = {
                ["guid"] = "79713f",
                ["pos"] = nil,
                ["rot"] = nil
            }
        },
        ["stacks"] = {
            ["non_buyable_res_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["brown_res_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["grey_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["commerce_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["blue_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["war_conflict_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["naval_conflict_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["compass_stack"] = {
                ["guid_zone"] = '',
                ["origin"] =nil,

                ["cards"] = {}
            },

            ["tablet_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["gear_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["green_island_stack"] = {
                ["guid_zone"] = '',
                ["origin"] =nil,

                ["cards"] = {}
            },

            ["purple_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["black_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },
        }
    },

    ["red"] = {
        ["card_to_play"] = {
            ["zone_guid"] = "ac77c1",
            ["chosen_action"] = nil
        },
        ["objects"] = {
            ["wonder"] = {
                ["guid"] = "",
                ["default_pos"] = nil,
                ["default_rot"] = nil,
                ["side"] = nil
            },
            ["menu"] = {
                ["guid"] = "c98713",
                ["pos"] = nil,
                ["rot"] = nil
            }
        },
        ["stacks"] = {
            ["non_buyable_res_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["brown_res_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["grey_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["commerce_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["blue_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["war_conflict_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["naval_conflict_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["compass_stack"] = {
                ["guid_zone"] = '',
                ["origin"] =nil,

                ["cards"] = {}
            },

            ["tablet_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["gear_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["green_island_stack"] = {
                ["guid_zone"] = '',
                ["origin"] =nil,

                ["cards"] = {}
            },

            ["purple_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["black_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },
        }
    },

    ["yellow"] = {
        ["card_to_play"] = {
            ["zone_guid"] = "7acf60",
            ["chosen_action"] = nil
        },
        ["objects"] = {
            ["wonder"] = {
                ["guid"] = "",
                ["default_pos"] = nil,
                ["default_rot"] = nil,
                ["side"] = nil
            },
            ["menu"] = {
                ["guid"] = "c0c800",
                ["pos"] = nil,
                ["rot"] = nil
            }
        },
        ["stacks"] = {
            ["non_buyable_res_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["brown_res_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["grey_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["commerce_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["blue_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["war_conflict_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["naval_conflict_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["compass_stack"] = {
                ["guid_zone"] = '',
                ["origin"] =nil,

                ["cards"] = {}
            },

            ["tablet_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["gear_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["green_island_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["purple_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["black_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },
        }
    },

    ["green"] = {
        ["card_to_play"] = {
            ["zone_guid"] = "f35770",
            ["chosen_action"] = nil
        },
        ["objects"] = {
            ["wonder"] = {
                ["guid"] = "",
                ["default_pos"] = nil,
                ["default_rot"] = nil,
                ["side"] = nil
            },
            ["menu"] = {
                ["guid"] = "588f73",
                ["pos"] = nil,
                ["rot"] = nil
            }
        },
        ["stacks"] = {
            ["non_buyable_res_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["brown_res_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["grey_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["commerce_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["blue_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["war_conflict_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["naval_conflict_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["compass_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["tablet_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["gear_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["green_island_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["purple_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["black_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },
        }
    },

    ["orange"] = {
        ["card_to_play"] = {
            ["zone_guid"] = "cade49",
            ["chosen_action"] = nil
        },
        ["objects"] = {
            ["wonder"] = {
                ["guid"] = "",
                ["default_pos"] = nil,
                ["default_rot"] = nil,
                ["side"] = nil
            },
            ["menu"] = {
                ["guid"] = "4dc5e4",
                ["pos"] = nil,
                ["rot"] = nil
            }
        },
        ["stacks"] = {
            ["non_buyable_res_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["brown_res_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["grey_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["commerce_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["blue_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["war_conflict_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["naval_conflict_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["compass_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["tablet_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["gear_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["green_island_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["purple_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["black_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },
        }
    },

    ["blue"] = {
        ["card_to_play"] = {
            ["zone_guid"] = "ed05de",
            ["chosen_action"] = nil
        },
        ["objects"] = {
            ["wonder"] = {
                ["guid"] = "",
                ["default_pos"] = nil,
                ["default_rot"] = nil,
                ["side"] = nil
            },
            ["menu"] = {
                ["guid"] = "2001b2",
                ["pos"] = nil,
                ["rot"] = nil
            }
        },
        ["stacks"] = {
            ["non_buyable_res_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["brown_res_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["grey_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["commerce_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["blue_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["war_conflict_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["naval_conflict_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["compass_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["tablet_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["gear_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["green_island_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["purple_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            },

            ["black_stack"] = {
                ["guid_zone"] = '',
                ["origin"] = nil,

                ["cards"] = {}
            }
        }
    }
}

OBJECTS_OFFSETS = {
    ["stacks"] = {
        ["non_buyable_res_stack"] = -16.2,
        ["brown_res_stack"] = -13.50,
        ["grey_stack"] = -10.80,
        ["commerce_stack"] = -8.10,
        ["blue_stack"] = -5.40,
        ["war_conflict_stack"] = -2.70,
        ["naval_conflict_stack"] = 0,
        ["compass_stack"] = 2.70,
        ["tablet_stack"] = 5.40,
        ["gear_stack"] = 8.10,
        ["green_island_stack"] = 10.80,
        ["purple_stack"] = 13.50,
        ["black_stack"] = 16.2,

        ["z"] = 41
    },

    ["card_to_play"] = 48,

    ["wonder"] = 14,

    ["coins"] = {
        ["x"] = 5,
        ["z"] = 17.5,
        ["padding"] = -0.80
    }
}

-- ! ONLOAD()
function onLoad(saved_data)

    -- ! GLOBAL VARIABLES INIT
    STATUS_PANEL = getObjectFromGUID(STATUS_PANEL_GUID)
    GAME_MANAGER = getObjectFromGUID(GAME_MANAGER_GUID)
    PLAYERS_MENU = getObjectFromGUID(PLAYERS_MENU_GUID)
    Global.setVar('STATUS_PANEL', STATUS_PANEL)

    -- ! SETTING SNAP POINTS

    -- ! FUNCTIONS
    calulcateOrigins()
    generateSnapPoints()
    STATUS_PANEL.call('populateStatusPanel')

end

function onPlayerChangeColor(player_color)
    generateSnapPoints()
    STATUS_PANEL.call('populateStatusPanel')
end

-- one important feature of this mod is the auto placement of ["cards"]
-- every single column in a player's board is made for specific kind of ["cards"] (not colors)
-- so to make things easier we calculate every ["origin"](x, y, z) for each stack
function calulcateOrigins()
    -- instaed of editing every value of PLAYERS we'll just use a temp table
    local new_stack = Global.getTable('PLAYERS')

    for _, color in pairs(getSeatedPlayers()) do

        -- for every player we calculate these ["origin"]s based on its hand transform (position, rotation etc. etc.)
        local origin = Player[color].getHandTransform(1)

        -- a table of offsets for each kind of ["cards"]
        local stack_offsets = Global.getTable("OBJECTS_OFFSETS")["stacks"]

        -- for every kind of stack we then calculate the ["origin"] using our offsets
        for stack_name, _ in pairs(new_stack[string.lower(color)]['stacks']) do

            -- the ["origin"] we are going to calculate
            local stack_origin = Vector(0, 0, 0)
            stack_origin[1] = origin.position[1] + origin.forward[1] * stack_offsets['z'] + origin.right[1] * stack_offsets[stack_name]
            stack_origin[2] = TABLE_HEIGHT
            stack_origin[3] = origin.position[3] + origin.forward[3] * stack_offsets['z'] + origin.right[3] * stack_offsets[stack_name]

            -- in the end we update the ["origin"] in our temp table
            new_stack[string.lower(color)]['stacks'][stack_name]["origin"] = stack_origin
        end

    end

    -- lastly we commit the changes to the ["origin"]al table
    Global.setTable('PLAYERS', new_stack)
end

-- this function will generate the snap points in front of every player
function generateSnapPoints()
    local snap_points_table = {}
    local new_players = Global.getTable("PLAYERS")

    for _, color in pairs(getSeatedPlayers()) do
        -- init of the position and roation of the snap point
        local snap_point_pos = Vector(0, 0, 0)
        local snap_point_rot = Vector(0, 0, 0)

        -- we always set the player's hand as our ["origin"]
        local origin = Player[color].getHandTransform()
        local offset = self.getTable("OBJECTS_OFFSETS")["card_to_play"]

        -- calculating the position of the snap points
        snap_point_pos[1] = origin.position[1] + (origin.forward[1] * offset)
        snap_point_pos[2] = TABLE_HEIGHT
        snap_point_pos[3] = origin.position[3] + (origin.forward[3] * offset)

        -- calculating the rotaton of the snap points
        snap_point_rot[1] = origin.rotation[1]
        snap_point_rot[2] = origin.rotation[2] + 180
        snap_point_rot[3] = origin.rotation[3]

        -- appending each snap point just made
        table.insert(snap_points_table, {
            position = snap_point_pos,
            rotation = snap_point_rot,
            rotation_snap = true,
            tags = {"Card"}
        })

        -- once we made this snap point we'll use its position and rotation for the menu of each player
        local menu_pos = Vector(snap_point_pos)
        local menu_rot = Vector(snap_point_rot)

        -- editing so the cube to which is attached the panel is lined up underneath the snap point
        menu_pos[2] = TABLE_HEIGHT - 0.50
        menu_rot[2] = menu_rot[2] + 180

        -- saving the vectors inside our main players table
        new_players[string.lower(color)]["objects"]["menu"]["pos"] = menu_pos
        new_players[string.lower(color)]["objects"]["menu"]["rot"] = menu_rot
    end

    -- setting them all at once
    self.setSnapPoints(snap_points_table)
    Global.setTable("PLAYERS", new_players)
end

-- generate the menu that pops up whenever a player click on the "wonder step" button in his menu
function populateWonderMenuUI()
    local wonders_table = GAME_MANAGER.getTable("WONDERS")

    for _, color in pairs(getSeatedPlayers()) do

        -- the first part of this function will focus on getting the number of step of the player's wonder
        local player_wonder_data = Global.getTable("PLAYERS")[string.lower(color)]["objects"]["wonder"]
        local player_wonder_side = player_wonder_data["side"]
        local steps = nil

        -- if somehow the object isn't a wonder we'll just exit the function
        if not getObjectFromGUID(player_wonder_data["guid"]).hasTag("Wonder") then return end

        -- iterate through every guids to find the one that matches the player's wonder guid
        -- and getting the steps for that wonder side
        for guid, global_wonder_data in pairs(wonders_table) do
            if guid == player_wonder_data["guid"] then
                steps = global_wonder_data[player_wonder_side]["steps"]
            end
        end

        -- once we've got the number of steps we can go ahead and build the xml menu
        -- for each "color menu" object we already defined a <TableLayout> so now we'll build every row
        -- following the schema:

        -- ?    <Row>
        -- ?        <Cell>    
        -- ?            <Button>
        -- ?                <Text>N Step</Text>
        -- ?            </Button>
        -- ?        </Cell>
        -- ?    </Row>

        -- getting the menu object linked to the menuUI as well as its xml table
        local menu_data = Global.getTable("PLAYERS")[string.lower(color)]["objects"]["menu"]
        local menu_obj = getObjectFromGUID(menu_data["guid"])
        local xml_table = menu_obj.UI.getXmlTable()

        local new_children = {}

        -- making n row tag for n steps
        for i = 1, steps do
            local text_step = {
                tag = "Text",
                attributes = {class="textMenu"},
                value = i .. "° STEP",
                children = {}
            }

            local button_step = {
                tag = "Button",
                attributes = {},
                children = {text_step}
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

            new_children[#new_children + 1] = row_step
        end

        -- finally setting the UI
        xml_table[2].children[2].children[2].children = new_children
        updateStepsUI(xml_table, menu_obj)
    end
end

function updateStepsUI(xml, obj)
    function coinside()
        coroutine.yield(0)
        obj.UI.setXmlTable(xml)

        return 1
    end

    startLuaCoroutine(self, "coinside")
end

-- this function helps us regolate the order of seats
-- since calling getSeatedPlayers() doesn't give us the players in the right oder
function getPlayersSorted()
    local players = {}

    -- the turn type should always be custom (type = 2) and it should alwyas be in the correct order
    -- but just in case we set our defined order
    if Turns.type == 1 then
        Turns.type = 2
        Turns.order = {'White', 'Purple', 'Red', 'Yellow', 'Green', 'Orange', 'Blue'}
    end

    -- following the order just set we append the matching colors 
    for _, color in pairs(Turns.order) do
        if Player[color].seated then
            players[#players + 1] = color
        end
    end

    return players
end

-- ! used only to set automatically the menu object "inside" the table
-- ! might come in handy so i'll keep it
function generateMenus()
    for _, color in pairs({"White", "Purple", "Red", "Yellow", "Green", "Orange", "Blue"}) do
        local menu_data = Global.getTable("PLAYERS")[string.lower(color)]["objects"]["menu"]
        local menu_obj = getObjectFromGUID(menu_data["guid"])
        local menu_pos = menu_data["pos"]
        local menu_rot = menu_data["rot"]

        menu_obj.setPosition(menu_pos)
        menu_obj.setRotation(menu_rot)
    end
end

function onChat(msg)
    if msg == "actions" then
        local players = Global.getTable("PLAYERS")
        for _, color in pairs(getSeatedPlayers()) do
            print(color .. " " .. players[string.lower(color)]["card_to_play"]["chosen_action"])
        end
    end

    if msg == "zone" then
        local zone = getObjectFromGUID("80aa1f")

        for _, objects in pairs(zone.getObjects()) do
            print(objects)
        end
    end
end