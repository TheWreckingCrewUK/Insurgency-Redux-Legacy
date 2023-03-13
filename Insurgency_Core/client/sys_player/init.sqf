#include "boxes\init.sqf";
#include "loadouts\init.sqf";

twc_rearmvehicle = {
params ["_vehicle"];
	_vehicle setVehicleAmmo 1; 
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

//headshot instakill. must run on server as well

//isserver check for offline testing
//if (isserver) then {
/*
twc_playerheadshoteh = {
	params ["_target"];
	_target addEventHandler ["HitPart", {
		_testing = missionnamespace getvariable ["twc_testmode", false];
		if (!_testing) exitwith {};
		if ((random 1) < 0.5) exitwith {};
		{
			_x params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];
			if (!_direct) exitwith {};
			if (!("head" in _selection)) exitwith {};
			if ((getNumber (configFile >> "CfgWeapons" >> headgear _target >> "iteminfo" >> "HitpointsProtectionInfo" >> "head" >> "armor")) > 0) exitwith {};
			_target setdamage 1;
		} foreach _this;
	}];
};


[player] call twc_playerheadshoteh;
[player] remoteExec ["twc_playerheadshoteh", 2, true];

*/

twc_playerbfaeh = {
	params ["_target"];
	_target addEventHandler ["HitPart", {
		_testing = missionnamespace getvariable ["twc_testmode", false];
		if (!_testing) exitwith {};
		{
			_x params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];
			
			if (!(isplayer _target)) exitwith {};
			if (!(isplayer _shooter)) exitwith {};
			if (!(_isDirect)) exitwith {};
			
			_items = primaryweaponitems _shooter;
			_hasbfa = false;
			
			{
				if (_x in ["UK3CB_BAF_BFA_L85", "UK3CB_BAF_BFA_L110", "UK3CB_BAF_BFA_L7", "UK3CB_BAF_BFA_L129"]) then {
					_hasbfa = true;
				};
			} foreach _items;
			if (_hasbfa) exitwith {
				_target call ace_hitreactions_fnc_throwWeapon;
				
				if (currentweapon _target in (_target getVariable ["ace_safemode_safedweapons", []])) then {
					[_target, currentWeapon _target, currentMuzzle _target] call ace_safemode_fnc_lockSafety;
				};
				[_target, true] call ACE_captives_fnc_setSurrendered;
			};
			
		} foreach _this;
	}];
};
[player] call twc_playerbfaeh;
[player] remoteExec ["twc_playerbfaeh", -2, true];


//};


//gas blowback simulation for firing with suppressors

twc_suppressgasblowback = ppEffectCreate ["DynamicBlur", 401];

/*player addEventHandler ["Fired", { 
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	if ((vehicle player) != player) exitwith {};
	if ((_weapon != (primaryweapon player)) && (_weapon != (handgunweapon player))) exitwith {};
	_suppressors = [
	"twc_l85_suppressor",
	"twc_acc_rotex5_grey",
	"twc_acc_nt4_tan",
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

if (false) then {
player addEventHandler ["Fired", { 
 params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
if (!(_unit == player)) exitwith {};
if (!((vehicle player) == player)) exitwith {}; 
if ((speed _projectile) < 950) exitwith {};[_projectile] spawn {params ["_projectile"];waituntil {((((speed _projectile) < 1450))) || (!alive _projectile)};if (!alive _projectile) exitwith {}; 

//_mult = (((player distance _projectile) * -1) + 2000) * 0.0003;
_mult = (((((player distance _projectile) * -1) + 2000) * 0.0002) max 0.01) min 0.4;

if (isserver) then {
	
	systemchat ("transonic at " + (str(player distance _projectile)) + "m with a mult of " + (str _mult));
};

if (false) then {
while {alive _projectile} do {
if ((speed _projectile) < 900) exitwith {};_projectile setvelocity [(velocity _projectile select 0) + (((random 8) - 4) * _mult), (velocity _projectile select 1) + (((random 8) - 4) * _mult), 	(velocity _projectile select 2) + (((random 4) - 2) * _mult)];sleep (random 1)};
};

}}];

	
};

player addEventHandler ["InventoryClosed", {
	params ["_unit", "_container"];
	_suppressors = [
	"twc_l85_suppressor",
	"twc_acc_rotex5_grey",
	"twc_acc_nt4_tan",
	];
	
	_hassuppressor = false;
	
	{
		if ((_x in (primaryweaponitems player)) || (_x in (handgunitems player))) then {
			_hassuppressor = true;
		};
	} foreach _suppressors;
	
	_msgdone = player getvariable ["twc_hassuppmessage", false];
	
	if (!_hassuppressor) exitwith {
	//	if (_msgdone) then {
	//		player setvariable ["twc_hassuppmessage", false];
	//	};
	};
	
	
	if (_msgdone) exitwith {};
	
	hint "You have a suppressor attached. Your shots will be harder to locate but you will suffer gas blowback under sustained fire, making it hard to see";
	player setvariable ["twc_hassuppmessage", true];
	
}];

player addEventHandler ["InventoryClosed", {
	params ["_unit", "_container"];
	
		//_testing = missionnamespace getvariable ["twc_testmode", false];
		//if (!_testing) exitwith {};
	_msgdone = player getvariable ["twc_hasheadgearmessage", false];
	
	if (_msgdone) exitwith {};
	
	if ((getNumber (configFile >> "CfgWeapons" >> headgear player >> "iteminfo" >> "HitpointsProtectionInfo" >> "head" >> "armor")) > 0) exitwith {};
	
	
	
	hint "Civs are more likely to help you when you're not wearing a helmet but you can be instakilled";
	player setvariable ["twc_hasheadgearmessage", true];
	
}];*/
