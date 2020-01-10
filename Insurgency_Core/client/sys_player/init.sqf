#include "boxes\init.sqf";
#include "loadouts\init.sqf";
#include "enemy\init.sqf";

twc_fnc_eodflag = compile preProcessFileLineNumbers "Insurgency_Core\client\sys_player\eodflag.sqf";





	
if ((getPlayerUID player) in twc_approvedenemies) then {
	systemchat "You are whitelisted to the enemy switcher. You can use it when you are occupying a blank unit at the bottom of the rolesheet and there are more than 13 people online to become an aggressor";
};

_arr = missionnamespace getvariable ["twc_goodeggs", []];
if ((getPlayerUID player) in _arr) then {
	systemchat "You have commanded sections in the past. You can now form attachments without being affected by the total server playercount. Individual attachment size restrictions still apply";
} else {
	systemchat "You have not taken command of a section recently. Players that have done so can form attachments without playercount restrictions";
};

//gas blowback simulation for firing with suppressors

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
	
	_severity = 0.03 * (count _lastblowback);
	
	["DynamicBlur", 400, [_severity], _thistime] spawn {
	params ["_name", "_priority", "_effect", "_thistime"];
	_time = _effect select 0;
	twc_suppressgasblowback ppEffectEnable true; 
	twc_suppressgasblowback ppEffectAdjust _effect; 
	twc_suppressgasblowback ppEffectCommit _time;
	uiSleep _time;
	twc_suppressgasblowback ppEffectAdjust [0];
	twc_suppressgasblowback ppEffectCommit (_time * 0.5);
	uiSleep (_time * 0.5);
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