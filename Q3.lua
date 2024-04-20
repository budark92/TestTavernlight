function do_sth_with_PlayerParty(playerId, membername)
player = Player(playerId)
	if not player then
		print("Player with ID " ..playerId .. "")
	return
	end

local party = player:getParty()

	for k,member in pairs(party:getMembers()) do
	 -- instead of creating players each time it iterates
	 -- it will check the player name and remove from the party
		if member:getName() == membername then
			party:removeMember(member)
			-- logs to know the result of the function
			print("Removed " .. membername .. "  from the party.")
			return
		end
	end
	-- logs to know the result of the function
	print("Player " .. membername .. " doesn't exist.")
end