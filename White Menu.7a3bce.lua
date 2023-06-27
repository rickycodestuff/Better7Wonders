WHITE_ZONE_GUID = Global.getTable("PLAYERS")["white"]["card_to_play"]["zone_guid"]

function onLoad(save_state)
    self.UI.setAttribute("whiteMenu", "active", "false")
end

function onObjectEnterZone(zone, object)
    if zone.guid == WHITE_ZONE_GUID then
        startLuaCoroutine(self, "showMenuUI")
    end
end

function onObjectLeaveZone(zone, object)
    if zone.guid == WHITE_ZONE_GUID then
        startLuaCoroutine(self, "hideMenuUI")
    end
end

function hideMenuUI()
    coroutine.yield(0)
    self.UI.setAttribute("whiteMenu", "active", "false")
    return 1
end

function showMenuUI()
    coroutine.yield(0)
    self.UI.setAttribute("whiteMenu", "active", "true")
    return 1
end

function playCard()
    print("BRO I JUST PLAYED THIS")
end

function wonderStep()
    self.UI.setAttribute("whiteBaseMenu", "active", "false")
    self.UI.setAttribute("whiteWonderMenu", "active", "true")
end

function sellCard()
    print("NEED CASH")
end