local name, addon = ...;


--[[
    as the summon random mount spell doesn't exist in wrath it needs a little work aroudn magic using a macro
]]
local macroId;
local macroName = "RandomMountMacro"
local macroBody = "/click MountJournalSummonRandomFavoriteButton"
local SUMMON_RANDOM_FAVORITE_MOUNT_SPELL = 150544;
local SUMMON_RANDOM_FAVORITE_MOUNT_ICON = "Interface\\Addons\\ClassicWrathCollectionsBuddy\\Media\\achievement_guildperk_mountup.blp"

UIParentLoadAddOn("Blizzard_Collections");
UIParentLoadAddOn("Blizzard_MacroUI");

local function modifyMountInterface()
    hooksecurefunc("MountJournal_UpdateMountDisplay", function()
        local mountID = MountJournal.selectedMountID
        if addon.mountData[mountID] then
            MountJournalSource:SetText(addon.mountData[mountID].sourceText.."\n"..addon.mountData[mountID].description)
        end
    end)

    if not PetJournalPetCardPetInfoSource then
        PetJournalPetCardPetInfoSource = PetJournalPetCard:CreateFontString(nil, "OVERLAY", "GameFontWhite")
        PetJournalPetCardPetInfoSource:SetPoint("TOPLEFT", PetJournalPetCardPetInfoIcon, "BOTTOMLEFT", 0, -6.0)
        PetJournalPetCardPetInfoSource:SetWidth(345)
        PetJournalPetCardPetInfoSource:SetJustifyH("LEFT")
        PetJournalPetCardPetInfoSource:SetJustifyV("TOP")
    end
    hooksecurefunc("PetJournal_UpdatePetCard", function(...)
        -- local t = ...;
        -- DevTools_Dump(t.PetInfo)
        local petID = PetJournalPetCard.speciesID
        if addon.petData[petID] then
            PetJournalPetCardPetInfoSource:SetText(addon.petData[petID].sourceText.."\n"..addon.petData[petID].description)
        end
    end)

    local macroExists = false;
    for i = 1, GetNumMacros() do
        local name, icon, body = GetMacroInfo(i)
        if name == macroName and body == macroBody then
            macroExists = true
            macroId = i;
        end
    end
    if macroExists == false then
        macroId = CreateMacro(macroName, 294468, macroBody, nil)
    end
end


function MountJournalSummonRandomFavoriteButton_OnLoad(self)
	self.spellID = SUMMON_RANDOM_FAVORITE_MOUNT_SPELL;
	local spellName, _, spellIcon = GetSpellInfo(self.spellID);
	--self.texture:SetTexture(spellIcon);
	self.texture:SetTexture(SUMMON_RANDOM_FAVORITE_MOUNT_ICON);
	-- Use the global string instead of the spellName from the db here so that we can have custom newlines in the string
	self.spellname:SetText(MOUNT_JOURNAL_SUMMON_RANDOM_FAVORITE_MOUNT);
	self:RegisterForDrag("LeftButton");
end

function MountJournalSummonRandomFavoriteButton_OnClick(self)
	C_MountJournal.SummonByID(0);
end

function MountJournalSummonRandomFavoriteButton_OnDragStart(self)
	C_MountJournal.Pickup(0);
    PickupMacro(macroId)
end

function MountJournalSummonRandomFavoriteButton_OnEnter(self)
	-- GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	-- GameTooltip:SetMountBySpellID(self.spellID);
end

local e = CreateFrame("FRAME")
e:RegisterEvent("PLAYER_ENTERING_WORLD")
e:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        modifyMountInterface()
    end
end)