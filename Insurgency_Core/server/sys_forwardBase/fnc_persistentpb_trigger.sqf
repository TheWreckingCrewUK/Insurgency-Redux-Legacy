
params ["_table"];

_pos = getpos _table;


_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [300, 300, 0, false];
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", True];
_trg setTriggerTimeout[2, 2, 2, true];
_trg setTriggerStatements ["this","thistrigger setvariable ['twcpb_active', 1];[thistrigger] call twc_fnc_perspb_trgwrite;","[thistrigger] call twc_fnc_perspb_write; thistrigger setvariable ['twcpb_active', 0];_profile = profilenamespace getvariable ['twcpb' + missionname, []]; diag_log ('patrolbasebackup' + (str _profile));"];


//blufluff
_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [500, 500, 0, false];
_trg setTriggerActivation ["west", "PRESENT", true];
_trg setTriggerTimeout [10,10,10, false];

_trg setTriggerStatements ["this","[getpos thistrigger, true] call twc_fnc_civfluff;",""];


twc_fnc_perspb_trgwrite = {
	params ["_trigger"];
	if ((_trigger getvariable ["twcpb_active", 0]) == 0)  exitwith {};
	[{[_this] call twc_fnc_perspb_write; [_this] call twc_fnc_perspb_trgwrite;}, _trigger, 60] call CBA_fnc_waitAndExecute;
};
