local name, addon = ...;

Mixin(addon, CallbackRegistryMixin)
addon:GenerateCallbackEvents({
    "CWC_OnTransmogAppearanceAdded",
    "CWC_OnWardrobeItemClicked",

    "Database_OnInitialized",
    "Database_OnProfileAdded",
    "Database_OnProfileSelected",
    "Database_OnOutfitCreated",
    "Database_OnOutfitDeleted",
})
CallbackRegistryMixin.OnLoad(addon);

local inventorySlots = {
    {
        slot = "HEADSLOT",
        icon = 136516,
    },
    {
        slot = "NECKSLOT",
        icon = 136519,
    },
    {
        slot = "SHOULDERSLOT",
        icon = 136526,
    },
    {
        slot = "SHIRTSLOT",
        icon = 136525,
    },
    {
        slot = "CHESTSLOT",
        icon = 136512,
    },
    {
        slot = "WAISTSLOT",
        icon = 136529,
    },
    {
        slot = "LEGSSLOT",
        icon = 136517,
    },
    {
        slot = "FEETSLOT",
        icon = 136513,
    },
    {
        slot = "WRISTSLOT",
        icon = 136530,
    },
    {
        slot = "HANDSSLOT",
        icon = 136515,
    },
    {
        slot = "FINGER0SLOT",
        icon = 136514,
    },
    {
        slot = "FINGER1SLOT",
        icon = 136523,
    },
    {
        slot = "TRINKET0SLOT",
        icon = 136528,
    },
    {
        slot = "TRINKET1SLOT",
        icon = 136528,
    },
    {
        slot = "BACKSLOT",
        icon = 136521,
    },
    {
        slot = "MAINHANDSLOT",
        icon = 136518,
    },
    {
        slot = "SECONDARYHANDSLOT",
        icon = 136524,
    },
    {
        slot = "RANGEDSLOT",
        icon = 136520,
    },
    {
        slot = "TABARDSLOT",
        icon = 136527,
    },
    -- {
    --     slot = "RELICSLOT",
    --     icon = 136522,
    -- },
}


local Util = {}
function Util.ScanEquipment()
    local itemIDs = {}
    for k, v in ipairs(inventorySlots) do
        local itemID = GetInventoryItemID('player', GetInventorySlotInfo(v.slot)) or false
        if itemID then
            table.insert(itemIDs, itemID)
        end
    end
    return itemIDs
end
function Util.ScanContainers(includeBank)

    local itemIDs = {}

    -- player bags
    for bag = 0, 4 do
        local numSlots;
        if C_Container then
            numSlots = C_Container.GetContainerNumSlots(bag);
        else
            numSlots = GetContainerNumSlots(bag);
        end
        for slot = 1, numSlots do
            if C_Container then
                local containerInfo = C_Container.GetContainerItemInfo(bag, slot)
                if containerInfo then
                    table.insert(itemIDs, containerInfo.itemID)
                end
            end
        end
    end

    if includeBank then
        -- main bank
        local bankBagId = -1
        local numSlots;
        if C_Container then
            numSlots = C_Container.GetContainerNumSlots(bankBagId);
        else
            numSlots = GetContainerNumSlots(bankBagId);
        end
        for slot = 1, numSlots do
            if C_Container then
                local containerInfo = C_Container.GetContainerItemInfo(bankBagId, slot)
                if containerInfo then
                    table.insert(itemIDs, containerInfo.itemID)
                end
            end
        end

        -- bank bags
        for bag = 5, 11 do
            local numSlots;
            if C_Container then
                numSlots = C_Container.GetContainerNumSlots(bag);
            else
                numSlots = GetContainerNumSlots(bag);
            end
            for slot = 1, numSlots do
                if C_Container then
                    local containerInfo = C_Container.GetContainerItemInfo(bag, slot)
                    if containerInfo then
                        table.insert(itemIDs, containerInfo.itemID)
                    end
                end
            end
        end
    end
    return itemIDs;
end

addon.Util = Util;


local Database = {}

function Database:Init()

    if not ClassicWrathCollectionsBuddy_Global then
        ClassicWrathCollectionsBuddy_Global = {
            profiles = {},
            minimapButton = {},
            config = {},
            outfits = {},
        }
    end

    self.db = ClassicWrathCollectionsBuddy_Global;

    for name, profile in pairs(self.db.profiles) do
        profile.name = name;
    end

    addon:TriggerEvent("Database_OnInitialized")
end

function Database:CreateOutfit(characterName, outfitName)
    if self.db then
         table.insert(self.db.outfits, {
            character = characterName,
            name = outfitName,
            items = {},
         })
         addon:TriggerEvent("Database_OnOutfitCreated", #self.db.outfits, self.db.outfits[#self.db.outfits])
    end
end

function Database:DeleteOutfit(index)
    if self.db then
        table.remove(self.db.outfits, index)
        addon:TriggerEvent("Database_OnOutfitDeleted")
    end
end

function Database:AddProfile(nameRealm, classID, setAsCurrentProfile)
    if self.db then
        if not self.db.profiles[nameRealm] then
            self.db.profiles[nameRealm] = {
                classID = classID,
                containers = {},
                name = nameRealm,
            }
        else
            print(string.format("[%s] profile exists!", name))
        end

        --added after so
        if not self.db.profiles[nameRealm].raceName then
            self.ticker = C_Timer.NewTicker(1, function()
                local _, _, _, englishRace, sex = GetPlayerInfoByGUID(UnitGUID("player"))
                if englishRace and sex then
                    self.db.profiles[nameRealm].raceName = englishRace
                    self.ticker:Cancel()
                end
            end)
        end
        if not self.db.profiles[nameRealm].name then
            self.db.profiles[nameRealm].name = nameRealm
        end
        if setAsCurrentProfile then
            self:SetProfile(nameRealm)
        end
    end
end

function Database:GetItemIDsForAppearanceID(invSlot, appearanceID)
    local itemIDs = {}
    if addon.transmogItemData[invSlot] and addon.transmogItemData[invSlot][appearanceID] then
        for k, v in ipairs(addon.transmogItemData[invSlot][appearanceID]) do
            table.insert(itemIDs, v.itemID)
        end
    end
    return itemIDs
end

function Database:GetAppearanceID(itemID)
    for k, v in ipairs(addon.transmogData) do
        if v[2] == itemID then
            return v[4]
        end
    end
end

function Database:IsItemKnown(itemID)
    if self.db then
        for nameRealm, profile in pairs(self.db.profiles) do
            for id, _ in pairs (profile.containers) do
                if id == itemID then
                    return 1, nameRealm
                end
            end
        end
    end
    return 0, ""
end

function Database:GetProfile()
    if self.selectedProfile then
        return self.selectedProfile;
    end
end

function Database:SetProfile(nameRealm)
    if self.db and self.db.profiles[nameRealm] then
        self.selectedProfile = self.db.profiles[nameRealm]
        addon:TriggerEvent("Database_OnProfileSelected", self.selectedProfile)
    end
end

function Database:RefreshCharacterContainers(includeBank)
    local isNew = false;
    if self.selectedProfile then
        local itemIDs = Util.ScanContainers(includeBank)
        for k, itemID in ipairs(itemIDs) do
            if not self.selectedProfile.containers[itemID] then
                self.selectedProfile.containers[itemID] = true
                isNew = true
            end
        end
        local itemIDs = Util.ScanEquipment()
        for k, itemID in ipairs(itemIDs) do
            if not self.selectedProfile.containers[itemID] then
                self.selectedProfile.containers[itemID] = true
                isNew = true
            end
        end
    end
    if isNew then
        addon:TriggerEvent("CWC_OnTransmogAppearanceAdded")
    end
end


addon.Database = Database;