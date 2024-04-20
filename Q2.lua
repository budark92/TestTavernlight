

function printSmallGuildNames(memberCount)
-- this method is supposed to print names of all guilds that have less than memberCount max members
-- Store all the query string in the local variable to avoid injection vulnerabilities
local selectGuildQuery = string.format("SELECT name FROM guilds WHERE max_members < %d;", memberCount)
local resultId = db.storeQuery(selectGuildQuery)
-- check if resultId is not null
	if resultId ~= nil then

		-- To print all guilds we should loop into the results and print all names
		repeat
			local guildName = result.getString(resultId, "name")
			print(guildName)
		until not result.next(resultId)

		-- We have to free the resources. If we are using LuaSQL 
		result.free(resultId)
	else
	-- To know if the check failed
		print("Error: No guilds found.")
	end
end
