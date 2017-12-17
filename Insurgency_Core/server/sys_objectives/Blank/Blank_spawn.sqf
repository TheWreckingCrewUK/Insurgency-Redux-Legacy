params [["_objType", -1]];

[
	{
		["TWC_Insurgency_objCompleted", ["Blank", _objType]] call CBA_fnc_serverEvent;
	},
	[""],
	60
] call CBA_fnc_waitAndExecute;