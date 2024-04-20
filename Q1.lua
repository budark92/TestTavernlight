
-- define a constant to store the key
local STORAGE_KEY = 1000

-- this function release the storage for a player
local function releaseStorage(player)
player:setStorageValue(STORAGE_KEY, -1)
end

-- Function to handle the player logout
function onLogout(player)
-- Check if the value of the storage is set to 1
if player : getStorageValue(STORAGE_KEY) == 1 then
	addEvent(releaseStorage, STORAGE_KEY, player)
end
return true
end