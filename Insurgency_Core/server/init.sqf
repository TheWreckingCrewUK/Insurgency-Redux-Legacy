// Includes
#include "func\init.sqf";
#include "sys_townLocations\init.sqf";
#include "sys_civilianVehicles\init.sqf";
#include "sys_vehicleRespawn\init.sqf";
#include "sys_cleanup\init.sqf";
#include "sys_ied\init.sqf";
#include "sys_controllers\init.sqf";
#include "sys_cache\init.sqf";
#include "sys_score\init.sqf";
#include "sys_objectives\init.sqf";
#include "sys_forwardBase\init.sqf";

// List of civilians who were already questioned
nonQuestionableList = [];
publicVariable "nonQuestionableList";

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

//Event Handler to stop players from  airdropping crates.
["ace_cargoUnloaded", {
	params ["_item", "_vehicle", ["_dropStyle", ""]];
	
	if (_dropStyle == "paradrop") then {
		if (!((typeOf _vehicle) in paradropVehicleWhitelist)) then {
			{
				deleteVehicle _x;
			} forEach (attachedObjects _item);
		};
	};
}] call CBA_fnc_addEventHandler;