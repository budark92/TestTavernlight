
//this function causes a memory leak because it creates a dynamic memory
//if the player doesn't exist and it doesn't release it in some points of the code
//It can be solved adding a flag to check if the dynamic pointer has a new in some part
//and delete it wherever it calls return
//other solution is adding smart pointers 
void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
	Player* player = g_game.getPlayerByName(recipient);
	bool causeMemoryLeak = false;
	if (!player) 
	{
		//memory created locally
		player = new Player(nullptr);
		causeMemoryLeak = true;
		if (!IOLoginData::loadPlayerByName(player, recipient)) {
			delete player;
			return;
		}
	}

	Item* item = Item::CreateItem(itemId);
	if (!item) {
		//if the item fails, it checks if it creates locally the player and release it
		if (causeMemoryLeak) {
			delete player;
		}
		return;
	}

	g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

	if (player->isOffline()) {
		IOLoginData::savePlayer(player);
	}
	//if it creates locally the player and release it
	if (causeMemoryLeak) {
		delete player;
	}
}