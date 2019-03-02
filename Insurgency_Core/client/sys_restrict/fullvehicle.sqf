params ["_checkedseat", "_roles", "_vehicle"];



// putting in an active check because the get in eventhandler seems to fire multiple times
if (isnil "twc_fullrestrictactive") then {
twc_fullrestrictactive = 0};

if (twc_fullrestrictactive == 1) exitwith { 
//systemchat "already active"
};

twc_fullrestrictactive = 1;

_playerunit = player;
	if (vehicle _playerUnit == _playerUnit) exitWith { // systemchat "no longer in vehicle"; 
	twc_fullrestrictactive = 0;
	cutText ["","Black IN",0.001];}; // double check
	
 
 //if (_checkedseat != _currentseat) exitwith { systemchat "no longer in old seat";};
_vehicle = (vehicle player);
 
	_takenslotplayers = [];
	_restrictedslots = [];
	
	{_restrictedslots pushback (_x select 0)} foreach _roles;
	_restrictedslotsorig = _restrictedslots;
	
	
	//systemchat "2";
_takenslots = fullcrew vehicle player;
	
	{
	if((_x select 1) in _restrictedslots) then {
		_takenslotplayers pushback (_x select 1)
		};
	sleep 0.1;
	} foreach _takenslots;
	
	
	_stryker = 0;
	if ((typeof vehicle player) == "CUP_B_M1130_CV_M2_Woodland_Slat") then {_stryker = 1;};
	
	_isair = 0;
	if ((vehicle player) isKindOf "air") then {
		_isair = 1;
	};
	
	{_restrictedslots deleteat (_restrictedslots find _x)} foreach _takenslotplayers;
	
	systemchat format ["%1, %2", _restrictedslots, _takenslotplayers];
	
	if (_isair == 1) then {
		waituntil {((((vehicle player)) distance twc_basepos) < 300) || ((vehicle _playerUnit == _playerUnit))};
	} else {
		waituntil {(((speed (vehicle player)) < 3)) || ((vehicle _playerUnit == _playerUnit))};
	};
	while {(!(vehicle _playerUnit == _playerUnit)) && (count _restrictedslots == 0) && ((((gunner vehicle player) == player)) || (_isair == 1))} do {
	
	_restrictedslots = [];
	
	{_restrictedslots pushback (_x select 0)} foreach _roles;
		
	_takenslotplayers = []; 
	_takenslots = fullCrew vehicle player;

	{_takenslotplayers pushback (_x select 1)} foreach _takenslots;
	
	{_restrictedslots deleteat (_restrictedslots find _x)} foreach _takenslotplayers;
	sleep 3;
	systemchat format ["%1", random 1];
	if (_isair == 1) then {
		waituntil {((((vehicle player)) distance twc_basepos) < 300) || ((vehicle _playerUnit == _playerUnit))};
		waituntil {((((getposatl (vehicle player)) select 2) < 1) && (speed (vehicle player)) < 10) || ((vehicle _playerUnit == _playerUnit))};
	} else {
		waituntil {((speed (vehicle player)) < 3) || ((vehicle _playerUnit == _playerUnit))};
	};
	
	
	};
	
	if ((vehicle _playerUnit == _playerUnit)) exitwith {
		twc_fullrestrictactive = 0;
	};
	//waits until crew positions aren't filled before doing anything proper. dumb script because fullcrew can't filter multiple types
	
	

	
	//put a waituntil here to prevent scummy people getting in to fulfil the restriction and then getting out
	while {(!(vehicle _playerUnit == _playerUnit)) && (count _restrictedslots > 0)} do {
	
	
		
	_takenslotplayers = []; 
	_takenslots = fullCrew vehicle player;

	
	{_takenslotplayers pushback (_x select 1)} foreach _takenslots;
	
	{_restrictedslots deleteat (_restrictedslots find _x)} foreach _takenslotplayers;
 
	if ((count _restrictedslotsorig) == 0) exitwith {
		// systemchat "vehicle empty";
		twc_fullrestrictactive = 0;	 
		cutText ["","Black IN",0.001];
	};
		

		
	if ((vehicle _playerUnit == _playerUnit) || ((!((gunner vehicle player) == player)) && (_isair == 0))) exitWith {
		// systemchat "no longer in vehicle";
		twc_fullrestrictactive = 0; 
		cutText ["","Black IN",0.001];
	}; // double check
 

	//systemchat	format ["%1 restricted, %2 currently", _restrictedslots, _takenslotplayers];
		
	cutText ["", "Black", 0.001];
	// systemchat "get out";
    ["<t size='1.2'>Vehicle Crew</t><br/><t size='0.6'>This vehicle needs a full crew before you can proceed</t>", 0, 0.22, 5, 0, 0, 2
	] spawn bis_fnc_dynamictext;
	sleep 1;
};
	if ((vehicle _playerUnit == _playerUnit) || ((!((gunner vehicle player) == player)) && (_isair == 0))) exitWith {
		// systemchat "no longer in vehicle";
		twc_fullrestrictactive = 0; 
		cutText ["","Black IN",0.001];
	};

cutText ["","Black IN",0.001];
// systemchat "you're good";
twc_fullrestrictactive = 0;
//sleep 1;

[_checkedseat, _roles, _vehicle] execvm "Insurgency_Core\client\sys_restrict\fullvehicle.sqf";