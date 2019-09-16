/*
* Created by [TWC] jayman
*
* Is pre-compiled as twc_townSetup
* Called from server\townSetup\%townName\init
*
* Example:
*  _Bastamstart setTriggerStatements ["this","['Bastam',7,100,3,[600,700]] call twc_townSetup"
*
* This example gives the town of Bastam 7 civs with a radius of 100.
* It has 3 Waves morale not withstanding, which spawn between 600 and 700 meters away.
*
* Creates a trigger to spawn the town capture and cleanup
*/ 
params["_pos","_thisList"];

if((west countSide _thisList) == 0)then{
//systemchat "delete check";
	{
		if(str (_x getVariable "unitsHome") == str _pos)then{
			deleteVehicle _x;
		};
	}forEach _thisList;
	
	_trg = createTrigger ["EmptyDetector", _pos];
	_trg setTriggerArea [800, 800, 0, false];
	_trg setTriggerActivation ["West", "PRESENT", False];
	_trg setTriggerTimeout[2, 2, 2, true];
	_trg setTriggerStatements ["{(((getPosATL _x) select 2) < 50)} count thislist > 0;","[(thisTrigger getvariable ['unitsHome', (getpos thistrigger)]),0,100,[100,200],thisList,false,false] spawn twc_townSetup;",""];
	_trg setVariable ["unitsHome",_pos];
	
}else{
	//systemchat "town complete";
	_random = random 100;
	if (_random < ((2.5 * TWC_civMorale) min 80))then{
		//systemchat "town converted";
		[_pos] spawn {
			params ["_pos"];
			sleep 60;
			profilenamespace setvariable ['twcenemytown' + (str _pos), 1];
			//[_pos, 0] call twc_fnc_townmarker;
		};
	};
	
	["TWC_Insurgency_adjustPoints", 20] call CBA_fnc_serverEvent;
};

{deleteGroup _x}forEach allGroups;