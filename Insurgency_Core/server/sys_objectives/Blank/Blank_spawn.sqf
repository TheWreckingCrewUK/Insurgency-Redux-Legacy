params [["_objType", -1]];

[
	{
		["TWC_Insurgency_objCompleted", ["Blank", (_this select 0)]] call CBA_fnc_serverEvent;
	},
	[_objType],
	60
] call CBA_fnc_waitAndExecute;