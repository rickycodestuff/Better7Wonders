BLUE_ZONE_GUID = "ed05de"

function onLoad(save_state)
    self.UI.setAttribute("blueMenu", "active", "true")

    local card_to_play = Global.getTable("PLAYERS")["blue"]["card_to_play"]
    self.setPosition(card_to_play["card_pos"])
    self.setRotation(card_to_play["card_rot"])
end

function onObjectEnterZone(zone, object)
    if zone.guid == BLUE_ZONE_GUID then
        startLuaCoroutine(self, "showMenu")
    end
end

function onObjectLeaveZone(zone, object)
    if zone.guid == BLUE_ZONE_GUID then
        startLuaCoroutine(self, "hideMenu")
    end
end

function hideMenu()
    coroutine.yield(0)
    self.UI.setAttribute("blueMenu", "active", "false")
    return 1
end

function showMenu()
    coroutine.yield(0)
    self.UI.setAttribute("blueMenu", "active", "true")
    return 1
end

-- ! BUTTON FUNCTIONS
function playCard()
    print("BRO I JUST PLAYED THIS")
end

function wonderStep()
    self.UI.setAttribute("blueBaseMenu", "active", "false")
    self.UI.setAttribute("blueWonderMenu", "active", "true")
end

function sellCard()
    print("NEED CASH")
end

-- ! TESTING
function onChat(msg)
    if msg == "show wonder menu" then
        self.UI.setAttribute("blueBaseMenu", "active", "false")
        self.UI.setAttribute("blueWonderMenu", "active", "true")
    end
end