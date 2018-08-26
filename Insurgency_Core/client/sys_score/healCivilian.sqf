["ace_treatmentSucceded", {_this call twc_fnc_healing}] call CBA_fnc_addEventHandler;

twc_fnc_healing = {
	params ["_player", "_target", "_selectionName", "_className"];

	if (
		_className == "Morphine" ||
		_className == "Epinephrine" ||
		_className == "CheckBloodPressure" ||
		_className == "CheckResponse" ||
		_className == "CheckPulse" ||
		_className == "Diagnose" ||
		_className == "CPR" ||
		_className == "Defib" ||
		_className == "LogDebug"
	) exitWith {};
	
	if (side _target == west) exitWith {};
	_target setvariable ["ACE_isUnconscious", false, true];
	_target setUnconscious false;

	[_target] remoteExecCall ["twc_fnc_checkLastDamage", 2];
};