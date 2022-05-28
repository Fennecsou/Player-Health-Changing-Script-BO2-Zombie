#include common_scripts\utility;
#include maps\mp\_utility;

init()
{
	level thread onPlayerConnect();
}

onPlayerConnect()
{
    for(;;)
    {
        level waittill("connected", player);
        player thread onPlayerSpawned();
    }
}

onPlayerSpawned()
{
    self endon("disconnect");
	level endon("game_ended");
	level endon("end_game");

    self.initial_spawn = true;

	self waittill("spawned_player");
	self IPrintLnBold( "Max Health Boosted From 100hp to 150hp" );
	self.maxhealth=150;
	self.health=self.maxhealth;

	for(;;)
	{
		self waittill( "player_revived" );
        self.maxhealth=150;
		self.health=self.maxhealth;
	}
}
