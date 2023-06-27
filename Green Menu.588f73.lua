GREEN_ZONE_GUID = Global.getTable("PLAYERS")["green"]["card_to_play"]["zone_guid"]

function onLoad(save_state)
    self.UI.setAttribute("greenMenu", "active", "false")
end

function onObjectEnterZone(zone, object)
    if zone.guid == GREEN_ZONE_GUID then
        startLuaCoroutine(self, "showMenuUI")
    end
end

function onObjectLeaveZone(zone, object)
    if zone.guid == GREEN_ZONE_GUID then
        startLuaCoroutine(self, "hideMenuUI")
    end
end

function hideMenuUI()
    coroutine.yield(0)
    self.UI.setAttribute("greenMenu", "active", "false")
    return 1
end

function showMenuUI()
    coroutine.yield(0)
    self.UI.setAttribute("greenMenu", "active", "true")
    return 1
end

function playCard()
    print("BRO I JUST PLAYED THIS")
end

function wonderStep()
    self.UI.setAttribute("greenBaseMenu", "active", "false")
    self.UI.setAttribute("greenWonderMenu", "active", "true")
end

function sellCard()
    print("NEED CASH")
end