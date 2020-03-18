#include "boxes\init.sqf";
#include "loadouts\init.sqf";
#include "enemy\init.sqf";

twc_fnc_eodflag = compile preProcessFileLineNumbers "Insurgency_Core\client\sys_player\eodflag.sqf";




twc_rearmvehicle = {
params ["_vehicle"];
	_vehicle setVehicleAmmo 1; 
};

	
if ((getPlayerUID player) in twc_approvedenemies) then {
	systemchat "You are whitelisted to the enemy switcher. You can use it when you are occupying a blank unit at the bottom of the rolesheet and there are more than 13 people online to become an aggressor";
};

_arr = missionnamespace getvariable ["twc_goodeggs", []];
if ((getPlayerUID player) in _arr) then {
	systemchat "You have commanded sections in the past. You can now form attachments without being affected by the total server playercount. Individual attachment size restrictions still apply";
} else {
	systemchat "You have not taken command of a section recently. Players that have done so can form attachments without playercount restrictions";
};


["ace_interactMenuOpened", {_forwardbase = getmarkerpos "respawn_west_forwardbase"; if (!((getplayeruid player) in twc_approvedenemies)) exitwith {};if ((player distance _forwardbase) < 300) then {if (!("ACE_Fortify" in ((uniformitems player) + (vestitems player) + (backpackitems player)))) then {[player, "ACE_Fortify"] call twc_core_fnc_additem;};} else {while {("ACE_Fortify" in (items player))} do {player removeitem "ACE_Fortify";};};}] call CBA_fnc_addEventHandler;

["acex_fortify_objectPlaced", {player removeitem "ACE_Fortify";}] call CBA_fnc_addEventHandler;

[{
    params ["_unit", "_object", "_cost"];
    private _return = ((getPosATL _object) distance (getmarkerpos "respawn_west_forwardbase")) < 300;
	if (!_return) then {
		hint "You can only place defenses within 300m of the Patrol Base";
	};
	if (!((getplayeruid player) in twc_approvedenemies)) then {
		_return = false;
		hint "Fortify is restricted to certain players to prevent abuse.";
	};
    _return
}] call acex_fortify_fnc_addDeployHandler;


//gas blowback simulation for firing with suppressors

twc_suppressgasblowback = ppEffectCreate ["DynamicBlur", 401];

player addEventHandler ["Fired", { 
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	if ((vehicle player) != player) exitwith {};
	if ((_weapon != (primaryweapon player)) && (_weapon != (handgunweapon player))) exitwith {};
	_suppressors = [
	"twc_l85_suppressor",
	"twc_acc_rotex5_grey",
	"twc_acc_nt4_tan",
	"rhsusf_acc_omega9k"
	];
	
	_hassuppressor = false;
	
	
	{
		if (((_x in (primaryweaponitems player)) && (_weapon == (primaryweapon player))) || ((_x in (handgunitems player)) && (_weapon == (handgunweapon player)))) then {
			_hassuppressor = true;
		};
	} foreach _suppressors;
	
	if (!_hassuppressor) exitwith {};
	
	_lastblowback = player getvariable ["twc_lastgasblowback", []];
	
	
	{
		if (_x < (time - 10)) then {
			_lastblowback deleteat (_lastblowback find _x);
		};
	} foreach _lastblowback;
	
	_thistime = time;
	_lastblowback pushback _thistime;
	
	player setvariable ["twc_lastgasblowback", _lastblowback];
	
	_tolerance = missionnamespace getvariable ["twcblowbacktolerance", 5];
	
	if ((count _lastblowback) < _tolerance) exitwith {};
	
	_severity = 0.05 * (count _lastblowback);
	
	["DynamicBlur", 400, [_severity], _thistime] spawn {
	params ["_name", "_priority", "_effect", "_thistime"];
	_time = _effect select 0;
	twc_suppressgasblowback ppEffectEnable true; 
	twc_suppressgasblowback ppEffectAdjust _effect; 
	twc_suppressgasblowback ppEffectCommit _time * 2;
	uiSleep (_time * 2);
	twc_suppressgasblowback ppEffectAdjust [0];
	twc_suppressgasblowback ppEffectCommit (_time);
	uiSleep (_time);
	_lastblowback = player getvariable ["twc_lastgasblowback", []];
	if ((_lastblowback select ((count _lastblowback) - 1)) != _thistime) exitwith {};
	twc_suppressgasblowback ppEffectEnable false; 
	
	};
}];

player addEventHandler ["InventoryClosed", {
	params ["_unit", "_container"];
	_suppressors = [
	"twc_l85_suppressor",
	"twc_acc_rotex5_grey",
	"twc_acc_nt4_tan",
	"rhsusf_acc_omega9k"
	];
	
	_hassuppressor = false;
	
	{
		if ((_x in (primaryweaponitems player)) || (_x in (handgunitems player))) then {
			_hassuppressor = true;
		};
	} foreach _suppressors;
	
	_msgdone = player getvariable ["twc_hassuppmessage", false];
	
	if (!_hassuppressor) exitwith {
		if (_msgdone) then {
			player setvariable ["twc_hassuppmessage", false];
		};
	};
	
	
	if (_msgdone) exitwith {};
	
	hint "You have a suppressor attached. Your shots will be harder to locate but you will suffer gas blowback under sustained fire, making it hard to see";
	player setvariable ["twc_hassuppmessage", true];
	
}];
player addEventHandler ["Put", { 
	params ["_unit", "_veh", "_item"];
	_var = player getvariable ["twc_isclearingvehiclemagcargo", -999];
	if (_var < (time - 20)) exitwith {};
	player setvariable ["twc_isclearingvehiclemagcargo", -999];
	hint "Magazines removed";
	if (_unit != player) exitwith {};
	_magcargo = magazinecargo _veh;
	if (!(_item in _magcargo)) exitwith {hint "Purge cancelled, not a magazine";};
	

	while {(_item in _magcargo)} do {
		_magcargo deleteat (_magcargo find _item);
	};
	clearmagazinecargoglobal _veh;
	{
		_veh addmagazinecargo [_x, 1];
	} foreach _magcargo;
}];

player addEventHandler ["Put", { 
	params ["_unit", "_veh", "_item"];
	_var = player getvariable ["twc_isclearingvehicleitemcargo", -999];
	if (_var < (time - 20)) exitwith {};
	player setvariable ["twc_isclearingvehicleitemcargo", -999];
	hint "Items removed";
	
	if (_unit != player) exitwith {};
	_magcargo = itemcargo _veh;
	if (!(_item in _magcargo)) exitwith {hint "Purge cancelled, not an item";};
	

	while {(_item in _magcargo)} do {
		_magcargo deleteat (_magcargo find _item);
	};
	clearitemcargoglobal _veh;
	{
		_veh additemcargo [_x, 1];
	} foreach _magcargo;
}];

player addEventHandler ["Put", { 
	params ["_unit", "_veh", "_item"];
	_var = player getvariable ["twc_isclearingvehicleweaponcargo", -999];
	if (_var < (time - 20)) exitwith {};
	player setvariable ["twc_isclearingvehicleweaponcargo", -999];
	hint "Weapons removed";
	
	if (_unit != player) exitwith {};
	_magcargo = weaponcargo _veh;
	if (!(_item in _magcargo)) exitwith {hint "Purge cancelled, not an item or only one in cargo";};
	

	while {(_item in _magcargo)} do {
		_magcargo deleteat (_magcargo find _item);
	};
	clearweaponcargoglobal _veh;
	{
		_veh addweaponcargo [_x, 1];
	} foreach _magcargo;
	
}];
player addEventHandler ["Take", { 
	params ["_unit", "_veh", "_item"];
	_var = player getvariable ["twc_isclearingvehiclemagcargo", -999];
	if (_var < (time - 20)) exitwith {};
	player setvariable ["twc_isclearingvehiclemagcargo", -999];
	hint "Magazines removed";
	if (_unit != player) exitwith {};
	_magcargo = magazinecargo _veh;
	if (!(_item in _magcargo)) exitwith {hint "Purge cancelled, not a magazine";};
	

	while {(_item in _magcargo)} do {
		_magcargo deleteat (_magcargo find _item);
	};
	clearmagazinecargoglobal _veh;
	{
		_veh addmagazinecargo [_x, 1];
	} foreach _magcargo;
	player removeitem _item;
}];

player addEventHandler ["Take", { 
	params ["_unit", "_veh", "_item"];
	_var = player getvariable ["twc_isclearingvehicleitemcargo", -999];
	if (_var < (time - 20)) exitwith {};
	player setvariable ["twc_isclearingvehicleitemcargo", -999];
	hint "Items removed";
	
	if (_unit != player) exitwith {};
	_magcargo = itemcargo _veh;
	if (!(_item in _magcargo)) exitwith {hint "Purge cancelled, not an item";};
	

	while {(_item in _magcargo)} do {
		_magcargo deleteat (_magcargo find _item);
	};
	clearitemcargoglobal _veh;
	{
		_veh additemcargo [_x, 1];
	} foreach _magcargo;
	player removeitem _item;
}];

player addEventHandler ["Take", { 
	params ["_unit", "_veh", "_item"];
	_var = player getvariable ["twc_isclearingvehicleweaponcargo", -999];
	if (_var < (time - 20)) exitwith {};
	player setvariable ["twc_isclearingvehicleweaponcargo", -999];
	hint "Weapons removed";
	
	if (_unit != player) exitwith {};
	_magcargo = weaponcargo _veh;
	if (!(_item in _magcargo)) exitwith {hint "Purge cancelled, not an item or only one in cargo";};
	

	while {(_item in _magcargo)} do {
		_magcargo deleteat (_magcargo find _item);
	};
	clearweaponcargoglobal _veh;
	{
		_veh addweaponcargo [_x, 1];
	} foreach _magcargo;
	if (_item in (items player)) then {
		player removeitem _item;
	} else {
		player removeweapon _item;
	};
}];