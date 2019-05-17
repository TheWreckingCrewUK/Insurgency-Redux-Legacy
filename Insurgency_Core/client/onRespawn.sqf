

if (["interpreter", typeof player] call BIS_fnc_inString) then {
	twc_terp = player;
	publicvariable "twc_terp";
	};
	
	//make the player middle eastern if they spawn as ANA. Sounds racist, but otherwise it looks dumb
_me = player;
if ((faction player == "ana_units") || ((side player) == east)) then {
[_me, ["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]call bis_fnc_selectrandom] remoteExec ["setFace", 0, _me] 
};
if ((side player) == east) then {
	player setVariable ["twc_isenemy",1, true];
	[player] call ([twc_loadout_insurgent_rifleman,twc_loadout_insurgent_rifleman,twc_loadout_insurgent_medic,twc_loadout_insurgent_grenadier,twc_loadout_insurgent_sniper,twc_loadout_insurgent_MG,twc_loadout_insurgent_RPG] call bis_fnc_selectrandom);
};
/*
_nobackpack = getNumber (configFile >> "cfgVehicles" >> (typeOf player) >> "twc_nobackpack");

if (!isnil "_nobackpack") then {

	if (_nobackpack == 1) then {
		player addEventHandler ["Take", {
			params ["_unit", "_container", "_item"];
			removebackpack player;
		}];
	};
};
*/

if (!((backpack player) == "")) then {
	_playerbackpack = [(configFile >> "CfgVehicles" >> typeof player), "backpack", ""] call BIS_fnc_returnConfigEntry;
	_unit = player;

	if (!((backpack player) == (_playerbackpack))) then {
			
		if ((_playerbackpack == "") || ((side player) == east)) then {
			_unit allowsprint false;
			hint "This Role is unable to fight with a Backpack. You cannot Sprint";
		};
		if ((backpack player) isKindOf ["twc_dpm_belt", configFile >> "CfgVehicles"]) exitwith {
			_unit allowsprint true;
		};
		
		_playerload = [(configFile >> "CfgVehicles" >> _playerbackpack), "maximumload", 0] call BIS_fnc_returnConfigEntry;

		_newbackpack = backpack player;
		
		_newload = [(configFile >> "CfgVehicles" >> _newbackpack), "maximumload", 0] call BIS_fnc_returnConfigEntry;
		
		if (_newload > (_playerload * 1.1)) then {
			hint "This Role is unable to fight with a Backpack. You cannot Sprint";
			_unit allowsprint false;
		};
			
		if (_newload < (_playerload * 1.1)) then {
			_unit allowsprint true;
		};
	};
};

[] spawn {
	waituntil {(!(isnil "twc_missionname"))};
	waitUntil {!isNull player};

	if (((uniform player) == "UK3CB_BAF_U_RolledUniform_MTP") && ((["90", twc_missionname] call BIS_fnc_inString))) then {
	for "_i" from 1 to 3 do {
		sleep 3;
		(player) setObjectTextureGlobal [0, "uk3cb_baf_equipment\backpacks\data\backpack_ddpm_co.paa"];
		};
	};
};

 
 _armourcrew = ["Modern_British_VehicleCrew","Modern_USMC_VehicleCrew","1990_British_Tank_Crew_Desert","2000_British_Vehicle_Crew","Modern_British_VehicleCommander","Modern_USMC_VehicleCommander","1990_British_Tank_Commander_Desert","2000_British_Vehicle_Commander"];
 

 if (typeof player in _armourcrew) then {
 
	[player] remoteExec ["twc_fnc_crewcount", 2];
	
	if ((["infantry", str (group player)] call BIS_fnc_inString)) then {
		if ((group player getvariable ["twc_ismechanised", 0]) == 0) then {
			group player setvariable ["twc_ismechanised", 1, true];
		};
	};
};

if ((group player getvariable ["twc_ismechanised", 0]) == 1) then {
	_crewcount = 0;

	{if (typeof _x in _armourcrew) then {_crewcount = _crewcount + 1;}} foreach units group player;
	group player setvariable ["armourcount", _crewcount, true];
		if ((group player getvariable ["armourcount", 3]) == 0) then {
			group player setvariable ["twc_ismechanised", 0, true];
		};
	
};
 
sleep 10;



if ((random 1)< twc_mortarchance) then {
_ran = (random 3);
waituntil {(!(isnil "twc_mortar_targetlist"))};
for "_i" from 1 to _ran do {
twc_mortar_targetlist pushback ((getpos player) vectoradd [random 1,random 1,random 1]);
publicVariable "twc_mortar_targetlist";
};
};
	