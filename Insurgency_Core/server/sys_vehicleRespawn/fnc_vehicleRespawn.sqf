/*
* Author: [TWC] jayman
* Function for Vehicle Respawn using event handlers for minimal lag
*
* Arguments:
* 0: Vehicle <Object>
*
* Return Value:
* <NONE>
*
* Example:
* [veh1] spawn twc_fnc_vehicleRespawn;
*
* Public: No
*/
params["_veh"];

if(isNil "_veh")exitWith{hint "twc_fnc_vehicleRespawn was not even given a vehicle. Exiting..."};

_veh setVariable ["twc_cacheDisabled",true];

_veh setrepaircargo -1;
_veh setammocargo -1;

if(isNil {_veh getVariable "respawnInfo"})then{
	_weapons = getWeaponCargo _veh;
	_items = getitemCargo _veh;
	_magazines = getmagazineCargo _veh;
	_backpacks = getBackpackCargo _veh;

	_veh setVariable ["respawnInfo",[(typeOf _veh),(getPosASL _veh),(getDir _veh),_weapons,_items,_magazines,_backpacks],true];
};

if ((typeof _veh) == "CUP_O_Ural_Open_RU") then {
	_veh addEventHandler ["GetIn", {
		 params ["_vehicle", "_role", "_unit", "_turret"];
		 _name = missionnamespace getvariable ["twc_missionname", "non"];
		 if (!(["70", _name] call BIS_fnc_inString)) exitwith {};
		_base = missionnamespace getvariable ["twc_basepos", [0,0,0]];
		if ((_vehicle distance _base) < 300) then {
			_texture = ["cup\wheeledvehicles\cup_wheeledvehicles_ural\data\ural_kabina_khk_co.paa","cup\wheeledvehicles\cup_wheeledvehicles_ural\data\ural_open_co.paa"];
			if (["twc_ana", typeof _unit] call BIS_fnc_inString) then {
				_texture = ([["cup\wheeledvehicles\cup_wheeledvehicles_ural\data\ural_kabina_civ1_co.paa","cup\wheeledvehicles\cup_wheeledvehicles_ural\data\ural_plachta_civ1_co.paa"], ["cup\wheeledvehicles\cup_wheeledvehicles_ural\data\ural_kabina_civ2_co.paa","cup\wheeledvehicles\cup_wheeledvehicles_ural\data\ural_plachta_civil_co.paa"]] call bis_fnc_selectrandom);
			};
			_vehicle setobjecttextureglobal [0, _texture select 0];
			_vehicle setobjecttextureglobal [1, _texture select 1];

		};
	}];
};


_veh addEventHandler ["GetOut",{
	params["_veh"];
	[_veh] call twc_fnc_addvehtorespawnlist;
}];

_veh addEventHandler ["Killed",{
	params["_veh"];
	[_veh] call twc_fnc_addvehtorespawnlist
}];