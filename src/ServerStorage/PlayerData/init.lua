--[[
    THE PLAN:
        PlayerData will construct a player data object that will allow you to get data from keys and allow you to set them.
        Will require you to input a default table dictionary.
        Will use session locking and a caching system to save specific data in a table.
]]
local DataStore = require(script.DataStore)
local SerialiseFunctions = require(script.SerialiseFunctions)

local PlayerData = {}

-- Construct a new player data object
local function new(dataStore: GlobalDataStore, defaultPlayerData, playerDataKey: string)
    local self = {}
    self.playerKey = playerDataKey
    self.dataStore = dataStore
    self.defaultPlayerData = defaultPlayerData

    self.data = nil

    setmetatable(self, {
        __index = PlayerData
    })

    -- Load player data.
    -- Wait for session locking to become over due on another server before loading in player.


    return self
end

return setmetatable({
    new = new,
    DataStore = DataStore
}, {})