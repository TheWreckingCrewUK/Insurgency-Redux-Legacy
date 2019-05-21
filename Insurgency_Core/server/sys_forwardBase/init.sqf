//Event Handler to keep track of player respawns
attackForwardBaseCheck = 0;
addMissionEventHandler ["EntityRespawned",{
	params["_unit","_oldUnit"];
	if(getMarkerColor "respawn_west_forwardBase" != "")then{
		if((getPos _unit) distance2D (getMarkerPos "respawn_west_forwardBase") < 10)then{
			attackForwardBaseCheck = attackForwardBaseCheck + 1;
			if(attackForwardBaseCheck >  2)then{
				//add the function to spawn the attack on forward base
				attackForwardBaseCheck = 0;
			};
		};
	};
}];