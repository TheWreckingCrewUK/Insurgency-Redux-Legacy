[
	{
		// probably for production make random between two - idk
		["TWC_Insurgency_objCompleted", ["BlankHAM"]] call CBA_fnc_serverEvent;
		["TWC_Insurgency_objCompleted", ["BlankSAD"]] call CBA_fnc_serverEvent;
	},
	[""],
	10 // 10 seconds for testing, should be 1 minute production
] call CBA_fnc_waitAndExecute;