#include "func\init.sqf";
//#include "sys_civilianVehicles\init.sqf";
#include "sys_vehicleRespawn\init.sqf";
#include "sys_cleanup\init.sqf";
#include "sys_ied\init.sqf";
#include "sys_townLocations\init.sqf";
#include "sys_controllers\init.sqf";
#include "sys_cache\init.sqf";
#include "sys_score\init.sqf";
//#include "sys_objectives\init.sqf";


nonQuestionableList = [];
publicVariable "nonQuestionableList";

//Event handler to stop players from airdropping
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