//////////
//spawn a mortar truck kinda near base that players sometimes trip with the onplayerrespawn system
_mortartruck = "RHS_Ural_Open_Civ_01" createvehicle [0,0,0];

_pos = [getmarkerpos "base",[1000,3500],random 360,0, [1,250], [50,(typeof _mortartruck)]] call SHK_pos;

_mortartruck setpos _pos;

 _mortar = "Rhs_2b14_82mm_ins" createvehicle _pos; 
 
 _mortar attachto [_mortartruck, [-0.053,-2.7,0.6]]; 
 
_box = "ACE_Box_82mm_Mo_HE" createvehicle _pos; _box attachto [_mortartruck, [0.45,-0.1,0]];
 
 
_mortar setVehicleLock "LOCKED";

_mortartruck setvariable ["twc_attachedmortar", _mortar, true];
 
_mortartruck setVehicleLock "LOCKEDPLAYER";
 
_mortartruck addEventHandler ["Killed",{
params ["_unit", "_killer", "_instigator", "_useEffects"];
[_unit] call twc_fnc_deadmortar
}];

_group = createGroup East;
	
_unit = _group createUnit [(selectRandom townSpawn), [0,0,0], [], 5, "NONE"];
_unit addEventHandler ["Killed",{
	[(_this select 0)] call twc_fnc_deleteDead;
	if (side (_this select 1) == WEST) then{
		["TWC_Insurgency_adjustInsurgentMorale", -0.25] call CBA_fnc_serverEvent;
		["TWC_Insurgency_adjustCivilianMorale", 0.25] call CBA_fnc_serverEvent;
	};
}];
	
_unit disableai "AUTOTARGET";
_unit disableai "TARGET";
	
_unit moveIngunner _mortar;
_unit setVariable ["twc_isenemy",1];
	
//now get the guarding infantry sorted
	
_groupcount = 3 + (random 5);
_infpos = getpos _mortartruck;
	
_group = createGroup East;
	for "_i" from 1 to _groupcount do {
	_unit = _group createUnit [(townSpawn select (floor random (count townspawn))), _infpos,[], 5,"NONE"];
	_unit addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;
		if (side (_this select 1) == WEST) then{
			["TWC_Insurgency_adjustInsurgentMorale", -0.25] call CBA_fnc_serverEvent;
			["TWC_Insurgency_adjustCivilianMorale", 0.25] call CBA_fnc_serverEvent;
		};
	}];
	
	_unit setVariable ["twc_isenemy",1];

	_null = [leader _group, leader _group,150] spawn TWC_fnc_Defend;
	
	};
	
	[_mortar] spawn twc_fnc_mortarattack;
	/*
	_mortar addEventHandler ["Fired", {
		[_this select 6, _this select 7] call twc_fnc_mortarwalk; }];
	*/
