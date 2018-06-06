["ace_treatmentSucceded", {_this call twc_fnc_healing}] call CBA_fnc_addEventHandler;

twc_fnc_healing = {
	params["_player","_target","_selectionName","_className"];
	if(side _target != Civilian)exitWith{};
	if(_className == "Morphine" || _className == "Epinephrine")exitWith{};
	[_target] remoteExecCall ["twc_fnc_checkLastDamage",2];
	
//	[_target, true] call ace_medical_fnc_setUnconscious;
};