/*
* Details:
* 
* Creates a enemy squad to defend around a given marker
*
* Required parameters:
*
* 0 - String     Marker name
*
* Example:
*
*["bastam"] spawn twc_SpawnDefend
*
* Author: [TWC] Fakematty / [TWC] Jayman
*/

params["_pos"];

{ 
 if (_x isKindOf "twc_ana_interpreter") then { 
 
twc_terp = _x;
publicVariable "twc_terp"}; 
} forEach allUnits; 

if (!(isnull twc_terp)) then {
if ((twc_terp distance _pos) < 1000) then {
execvm "Insurgency_Core\server\sys_terp\fnc_terp_enemy.sqf"};
};


//_spawnPos = [_pos, 50] call CBA_fnc_randPos;
_spawnPos = [0,0,0];
_num = 0;
_total = (([_pos] call twc_fnc_calculateSpawnAmount) * 2) max 20;
_group = createGroup East;
for "_i" from 1 to _total do{
	_unit = _group createUnit [(townSpawn select (floor random (count townspawn))), _spawnPos,[], 5,"NONE"];
	_unit addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;
		if (side (_this select 1) == WEST) then{
			["TWC_Insurgency_adjustInsurgentMorale", -0.25] call CBA_fnc_serverEvent;
			["TWC_Insurgency_adjustCivilianMorale", 0.25] call CBA_fnc_serverEvent;
		};
	}];
	_unit addMagazines ["handGrenade",2];
	_unit setVariable ["unitsHome",_pos,false];
	_num = _num + 1;
	sleep 0.2;
	
	
};

	[_pos, nil, units _group, 300, 2, true, true] call ace_ai_fnc_garrison;
//_null = [leader _group, leader _group,150] spawn TWC_fnc_Defend;


for "_i" from 1 to 2 do{
if ((random 1) < 0.15) then {
_group createUnit ["CUP_O_TK_INS_Soldier_AA", _pos,[], 25,"NONE"];
};
};


	sleep 5;
	[_pos, nil, units _group, 300, 2, true, false] call ace_ai_fnc_garrison;
