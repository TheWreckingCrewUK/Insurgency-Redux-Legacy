params ["_unit"];

{
	
	_x addEventHandler ["FiredNear", {
	params ["_unit"];
	if (((group _unit) getvariable ["twc_aiscramkey", 0]) == 0) then {
		[_unit] execvm "Insurgency_Core\server\func\ai\fnc_aiscramblenew.sqf";
//diag_log ("pinefiredeh");
	};
}];
} foreach (units (group _unit));