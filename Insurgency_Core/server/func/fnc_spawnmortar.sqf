//////////
//spawn a mortar truck kinda near base that players sometimes trip with the onplayerrespawn system
_mortartruck = "RHS_Ural_Open_Civ_01" createvehicle [0,0,0];

_pos = [getmarkerpos "base",[1000,3500],random 360,0, [1,250], [50,(typeof _mortartruck)]] call SHK_pos;

_mortartruck setpos _pos;

 twc_mortar = "Rhs_2b14_82mm_ins" createvehicle _pos; 
 
 twc_mortar attachto [_mortartruck, [-0.053,-2.7,0.6]]; 
 
 _box = "ACE_Box_82mm_Mo_HE" createvehicle _pos; _box attachto [_mortartruck, [0.45,-0.1,0]];
 
 
	twc_mortar setVehicleLock "LOCKEDPLAYER";
 
	_mortartruck setVehicleLock "LOCKEDPLAYER";
 
	twc_mortar addEventHandler ["Killed",{
	[twc_mortar] call twc_fnc_deadmortar
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
	
	_unit moveIngunner twc_mortar;
	
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
	

_null = [leader _group, leader _group,150] spawn TWC_fnc_Defend;
	
	};
	
	// obj creation
if (isServer) then {
	_eventHandlerID = ["twc_event_remoteFireMortar", {
params ["_targetpos"];


[_targetpos] spawn {

params ["_targetpos"];

sleep 10 + (random 30);

_total = 3 +(random 7);

if ((twc_mortar distance _targetpos) > 4000) exitwith {};

_radius = (twc_mortar distance _targetpos) / 80;

twc_mortar lookat (_targetpos);

for "_i" from 1 to _total do {

twc_mortar doArtilleryFire [[_targetpos,150] call cba_fnc_randpos, currentmagazine twc_mortar, 1];

sleep 4 +(random 3);

}; twc_mortar lookat objnull;

twc_mortar setvehicleammo 1;

sleep 30 + (random 180);

if ((random 1) < twc_mortarchance) exitwith { [_targetpos] remoteExec ["twc_fnc_mortarattack", 2];};

};

	}] call CBA_fnc_addEventHandler;
};
/*
// call to obj
["twc_event_remoteFireMortar", [getpos player], twc_mortar] call CBA_fnc_targetEvent;
