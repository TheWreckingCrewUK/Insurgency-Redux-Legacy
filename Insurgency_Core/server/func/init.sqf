twc_spawnAIUnits = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_spawnAIUnits.sqf";
twc_spawnDefend = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_spawnDefend.sqf";
twc_spawnCiv = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_spawnCiv.sqf";
twc_townSetup = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_spawnTownSetup.sqf";
twc_fnc_townDeciding = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_townDeciding.sqf";
twc_fnc_deleteDead = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_deleteDead.sqf";

twc_fnc_aiWounds = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_aiWounds.sqf";

twc_fnc_campaignserver = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_campaignserver.sqf";

twc_fnc_enemyspawnpos = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_enemyspawnpos.sqf";
twc_fnc_isnearblufor = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_isnearblufor.sqf";
twc_fnc_bluforreport = compile preprocessfilelinenumbers "Insurgency_Core\client\func\fnc_bluforreport.sqf";

[] spawn {
	waituntil {(!(isnil "townLocationArray" ))};
	waituntil {(!(isnil "twc_basepos" ))};
	waituntil {(count townLocationArray ) > 5};
	[] spawn twc_fnc_enemyspawnpos;
};

twc_fnc_findnearestblufor = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_findnearestblufor.sqf";

twc_fnc_findoutsideblufor = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_findoutsideblufor.sqf";

twc_fnc_posNearPlayers = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_posNearPlayers.sqf";
twc_fnc_getRandomNearbyRoad = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_getRandomNearbyRoad.sqf";
twc_fnc_randomBuildingPos = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_randomBuildingPos.sqf";

twc_fnc_stopcivs = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_stopcivs.sqf";
twc_fnc_startcqbrangeserver = compile preprocessfilelinenumbers "Insurgency_Core\client\func\fnc_cqbrange_server.sqf";

twc_fnc_checkLastDamage = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_checkLastDamage.sqf";
twc_fnc_addScore = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_addScore.sqf";
twc_fnc_calculateSpawnAmount = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_calculateSpawnAmount.sqf";
twc_fnc_spawntechnicals = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_spawnTechnicals.sqf";
twc_fnc_deadasset = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_deadAsset.sqf";
twc_fnc_mortarattack = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_mortarattack.sqf";
twc_fnc_spawnmortar = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_spawnmortar.sqf";
twc_fnc_deadmortar = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_deadmortar.sqf";
twc_fnc_commandcheck = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_commandcheck.sqf";

call twc_fnc_spawnmortar;


{ 
_x addEventHandler ["CuratorObjectPlaced", {
	params ["_curator", "_entity"];
	
	if ((side _entity) == east) then {
		_entity setVariable ["twc_isenemy",1];
	};
} 
 
]; 
 
} forEach allCurators;