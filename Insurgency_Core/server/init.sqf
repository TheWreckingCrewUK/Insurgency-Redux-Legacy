// Includes
#include "func\init.sqf";
//#include "sys_civilianVehicles\init.sqf";
#include "sys_vehicleRespawn\init.sqf";
#include "sys_cleanup\init.sqf";
//#include "sys_ied\init.sqf";
#include "sys_controllers\init.sqf";
#include "sys_cache\init.sqf";
#include "sys_score\init.sqf";
//#include "sys_objectives\init.sqf";

// List of civilians who were already questioned
nonQuestionableList = [];
publicVariable "nonQuestionableList";

//Event handler to stop players from airdropping
["ace_cargoUnloaded", {
if((_this select 2) == "paradrop")then
{
	{
		deleteVehicle _x;
	}forEach (attachedObjects (_this select 0));
}
}] call CBA_fnc_addEventHandler;

// Array of the locations and the strongholds
townLocationArray = nearestLocations [[worldSize/2,worldSize/2], ["NameVillage","NameCity","NameCityCapital","nameLocal"], (sqrt 2 *(worldSize / 2))] ;
_strongholdArray = [];
while{count _strongholdArray < 3}do{
	_town = townLocationArray call bis_fnc_selectRandom;
	if(!((text _town) in badTownArray))then{
		townLocationArray = townLocationArray - [_town];
		_strongholdArray pushback _town;
	};
};
//Strongholds
{
	[_x] execVM "Insurgency_Core\server\sys_strongholds\createStronghold.sqf";
}forEach _strongholdArray;

townLocationArray = townLocationArray - _strongholdArray;
execVM "Insurgency_Core\server\sys_townLocations\getLocations.sqf";