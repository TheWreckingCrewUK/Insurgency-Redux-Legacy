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

	{
		if(str (_x getVariable "unitsHome") == str _pos)then{
			deleteVehicle _x;
		};
	}forEach _thisList;
	
	_trg = createTrigger ["EmptyDetector", _pos];
	_trg setTriggerArea [600, 600, 0, false];
	_trg setTriggerActivation ["West", "PRESENT", False];
	_trg setTriggerTimeout[1, 1, 1, true];
	_trg setTriggerStatements ["(((objectParent (thisList call bis_fnc_selectRandom)) isKindOf 'air') && (getPosATL (thisList call bis_fnc_selectRandom)) select 2 < 25) || !((objectParent (thisList call bis_fnc_selectRandom)) isKindOf 'air')","[(getPos thisTrigger),0,100,[100,200],thisList,false,true] spawn twc_townSetup",""];
	
}else{
	["TWC_Insurgency_adjustPoints", 20] call CBA_fnc_serverEvent;
};