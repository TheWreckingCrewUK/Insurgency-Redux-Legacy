["ace_treatmentSucceded", {_this call twc_fnc_healing}] call CBA_fnc_addEventHandler;

twc_fnc_healing = {
	params["_player","_target","_selectionName","_className"];
	if(side _target != Civilian)exitWith{};
	if !(_target getVariable "ace_medical_isBleeding")exitWith{};
	if(_className == "Morphine" || _className == "Epinephrine")exitWith{};
	_damageSource = _deadGuy getVariable ["ace_medical_lastDamageSource", objNull];
	if(side _damageSource == WEST)exitWith{};
	["TWC_Insurgency_adjustPoints", 2] call CBA_fnc_serverEvent;
};