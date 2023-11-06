local name, addon = ...;




UIResettableDropdownButtonMixin = {};

function UIResettableDropdownButtonMixin:OnLoad()
	self.ResetButton:SetScript("OnClick", function(button, buttonName, down)
		if self.resetFunction then
			 self.resetFunction();
		end

		self.ResetButton:Hide();
	end);
end

function UIResettableDropdownButtonMixin:OnMouseDown()
	UIMenuButtonStretchMixin.OnMouseDown(self, button);
	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
end

function UIResettableDropdownButtonMixin:SetResetFunction(resetFunction)
	self.resetFunction = resetFunction;
end







--[[
    as the summon random mount spell doesn't exist in wrath it needs a little work aroudn magic using a macro
]]
local summonRandomMountMacroID;
local summonRandomMountMacroName = "RandomMountMacro"
local SUMMON_RANDOM_FAVORITE_MOUNT_SPELL = 150544;
local SUMMON_RANDOM_FAVORITE_MOUNT_ICON = "Interface\\Addons\\ClassicWrathCollectionsBuddy\\Media\\achievement_guildperk_mountup.blp"

UIParentLoadAddOn("Blizzard_Collections");
UIParentLoadAddOn("Blizzard_MacroUI");

local titles =
{
	[1] = MOUNTS,
	[2] = PET_JOURNAL,
	[3] = TOY_BOX,
	[4] = HEIRLOOMS,
	[5] = WARDROBE,
};

local function modifyMountInterface()

    --hook into the mount changing call
    hooksecurefunc("MountJournal_UpdateMountDisplay", function()
        local mountID = MountJournal.selectedMountID
        if addon.mountData[mountID] then
            MountJournalSource:SetText(addon.mountData[mountID].sourceText.."\n"..addon.mountData[mountID].description)
        end
    end)

    --summon random macro
    local macroExists = 0;
    local numMacros = GetNumMacros()
    for i = 1, numMacros do
        local name, icon, body = GetMacroInfo(i)
        if (name == summonRandomMountMacroName) then
            macroExists = 1
            summonRandomMountMacroID = i;
        end
    end
    if macroExists == 0 then
        summonRandomMountMacroID = CreateMacro(summonRandomMountMacroName, 294468, "/click MountJournalSummonRandomFavoriteButton", nil)
    end


    --set up the pet journal
    if not PetJournalPetCardPetInfoSource then
        PetJournalPetCardPetInfoSource = PetJournalPetCard:CreateFontString(nil, "OVERLAY", "GameFontWhite")
        PetJournalPetCardPetInfoSource:SetPoint("TOPLEFT", PetJournalPetCardPetInfoIcon, "BOTTOMLEFT", 0, -6.0)
        PetJournalPetCardPetInfoSource:SetWidth(345)
        PetJournalPetCardPetInfoSource:SetJustifyH("LEFT")
        PetJournalPetCardPetInfoSource:SetJustifyV("TOP")
    end
    hooksecurefunc("PetJournal_UpdatePetCard", function(...)
        local petID = PetJournalPetCard.speciesID
        if addon.petData[petID] then
            PetJournalPetCardPetInfoSource:SetText(addon.petData[petID].sourceText.."\n"..addon.petData[petID].description)
        end
    end)

    function CollectionsJournal_UpdateSelectedTab(self)
        local selected = CollectionsJournal_GetTab(self);
    
        if (not CollectionsJournal_ValidateTab(selected)) then
            PanelTemplates_SetTab(self, 1);
            selected = 1;
        end
    
        MountJournal:SetShown(selected == 1);
    
        
        PetJournal:SetShown(selected == 2);
    
        
        ToyBox:SetShown(selected == 3);
    
        
        HeirloomsJournal:SetShown(selected == 4);

        CollectionsJournal.Wardrobe:SetShown(selected == 5)

        self:SetTitle(titles[selected]);
    
        EventRegistry:TriggerEvent("CollectionsJournal.TabSet", CollectionsJournal, selected);
    end

    PanelTemplates_SetNumTabs(CollectionsJournal, 5);

    local wardrobeTab = CreateFrame("Button", "CollectionsJournalTab5", CollectionsJournal, "CollectionsJournalTab", 5)
    wardrobeTab:SetPoint("LEFT", "CollectionsJournalTab4", "RIGHT", -16, 0)
    wardrobeTab:SetText(WARDROBE)

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
    PickupMacro(summonRandomMountMacroID)
end

function MountJournalSummonRandomFavoriteButton_OnEnter(self)

end



local function getItemsWithAppearanceID(appearanceID)

    local t = {}
    for k, v in ipairs(addon.transmogData) do
        if v[4] == appearanceID then
            table.insert(t, v)
        end
    end
    return t;
end

local e = CreateFrame("FRAME")
e:RegisterEvent("PLAYER_ENTERING_WORLD")
e:RegisterEvent("BAG_UPDATE_DELAYED")
e:RegisterEvent("BANKFRAME_OPENED")
e:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        modifyMountInterface()

        addon.Database:Init()

        local name, realm = UnitName("player")
        if not realm then
            realm = GetNormalizedRealmName()
        end
        addon.characterNameRealm = string.format("%s-%s", name, realm)
        local _, _, classID = UnitClass("player")

        addon.Database:AddProfile(addon.characterNameRealm, classID, true)
    end

    if event == "BAG_UPDATE_DELAYED" then
        addon.Database:RefreshCharacterContainers()
    end
    if event == "BANKFRAME_OPENED" then
        C_Timer.After(0.1, function()
            addon.Database:RefreshCharacterContainers(true)
        end)
    end
end)