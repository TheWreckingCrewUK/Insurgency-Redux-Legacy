params ["_checkedseat", "_roles"];




if (isnil "twc_fullrestrictactive") then {
twc_fullrestrictactive = 0};

if (twc_fullrestrictactive == 1) exitwith {// systemchat "already active"
};

twc_fullrestrictactive = 1;

_playerunit = player;
	if (vehicle _playerUnit == _playerUnit) exitWith { // systemchat "no longer in vehicle"; 
	twc_fullrestrictactive = 0;
	cutText ["","Black IN",0.001];}; // double check
	
 _slotFull = fullCrew vehicle player; 
 _slotFullData = _slotFull select 0; 
 _currentSeat = _slotFullData select 1;
 
 //if (_checkedseat != _currentseat) exitwith {// systemchat "no longer in old seat";};

 
	_slotFull = fullcrew [vehicle player, "",true];
	_takenslotplayers = [];
	_takenslots = [];
	_restrictedslots = [];
	
	{_restrictedslots pushback (_x select 0)} foreach _roles;
	

	{if (!(isnull (_x select 0))) then {_takenslots pushback _x}} foreach _slotFull;
	
	//// systemchat format ["%1", _roles];
	
	//put a waituntil here to prevent scummy people getting in to fulfil the restriction and then getting out
	while {!(vehicle _playerUnit == _playerUnit)} do {
	
	
	_takenslotplayers = [];
	_takenslots = [];

	
	_slotFull = fullcrew [vehicle player, "",true];
	{if (!(isnull (_x select 0))) then {_takenslots pushback _x}} foreach _slotFull;
	
	{if((_x select 1) in _restrictedslots) then {_takenslotplayers pushback (_x select 1)}} foreach _takenslots;
 // systemchat	format ["%1 restricted, %2 currently", _restrictedslots, _takenslotplayers];
 
 if ((count _takenslotplayers) == 0) exitwith {// systemchat "vehicle empty";
 twc_fullrestrictactive = 0;
 
	cutText ["","Black IN",0.001];};
		

		
	if (vehicle _playerUnit == _playerUnit) exitWith { // systemchat "no longer in vehicle";
twc_fullrestrictactive = 0; 
	cutText ["","Black IN",0.001];}; // double check
	
 _slotFull = fullCrew vehicle player; 
 _slotFullData = _slotFull select 0; 
 _currentSeat = _slotFullData select 1;
 
 

 		if (count _restrictedslots != count _takenslotplayers) then {
		
cutText ["", "Black", 0.001];
		// systemchat "get out";
		    [
        "<t size='1.2'>Vehicle Crew</t><br/><t size='0.6'>This vehicle needs a full crew before you can proceed</t>", 0, 0.22, 5, 0, 0, 2
    ] spawn bis_fnc_dynamictext;
	} else {
	cutText ["","Black IN",0.001];};
 
 
		sleep 5;};
	cutText ["","Black IN",0.001];
	// systemchat "you're good";
	twc_fullrestrictactive = 0;
sleep 1;

[_checkedseat, _roles] execvm "Insurgency_Core\client\sys_restrict\fullvehicle.sqf";