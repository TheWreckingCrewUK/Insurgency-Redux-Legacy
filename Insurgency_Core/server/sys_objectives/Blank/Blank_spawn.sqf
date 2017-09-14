params [["_objType", -1]];

[
	{
		["TWC_Insurgency_objCompleted", ["Blank", _objType]] call CBA_fnc_serverEvent;
	},
	[""],
	10 // 10 seconds for testing, should be 1 minute production
] call CBA_fnc_waitAndExecute;