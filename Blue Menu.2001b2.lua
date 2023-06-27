BLUE_ZONE_GUID = Global.getTable("PLAYERS")["blue"]["card_to_play"]["zone_guid"]

function onLoad(save_state)
    self.UI.setAttribute("blueMenu", "active", "false")
end

function onObjectEnterZone(zone, object)
    if zone.guid == BLUE_ZONE_GUID then
        startLuaCoroutine(self, "showMenuUI")
    end
end

function onObjectLeaveZone(zone, object)
    if zone.guid == BLUE_ZONE_GUID then
        startLuaCoroutine(self, "hideMenuUI")
    end
end

function hideMenuUI()
    coroutine.yield(0)
    self.UI.setAttribute("blueMenu", "active", "false")
    return 1
end

function showMenuUI()
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
    if msg == "populate" then
        populateWonderMenuUI()
    end
end