local name, addon = ...;

local function modifyMountInterface()
    UIParentLoadAddOn("Blizzard_Collections");
    hooksecurefunc("MountJournal_UpdateMountDisplay", function()
        local mountID = MountJournal.selectedMountID
        MountJournalSource:SetText(addon.mountData[mountID].sourceText)
    end)
end

local e = CreateFrame("FRAME")
e:RegisterEvent("PLAYER_ENTERING_WORLD")
e:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        modifyMountInterface()
    end
end)