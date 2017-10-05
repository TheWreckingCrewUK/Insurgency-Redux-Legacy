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
						  
params["_pos","_civnum","_civradius","_groupradius","_thisList"];

[_pos, _civnum, _civradius] call twc_spawnCiv;
_enemies = 0;

_random = random 100;
if(_random > (2.5 * TWC_insMorale))then{

}else{
	_enemies = 1;
	[_pos] spawn twc_spawnDefend;
};

_random = random 100;
if(_random > (2.5 * TWC_insMorale))then{

}else{
	_enemies = 1;
	[_pos, _groupradius,_thisList] spawn twc_spawnAIUnits;
};
if(_enemies == 0)exitWith{};

_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [300, 300, 0, false];
_trg setTriggerActivation ["EAST", "NOT PRESENT", False];
_trg setTriggerTimeout [5,5,5, true];
_trg setTriggerStatements ["this","['TWC_Insurgency_adjustPoints', 25] call CBA_fnc_serverEvent",""];