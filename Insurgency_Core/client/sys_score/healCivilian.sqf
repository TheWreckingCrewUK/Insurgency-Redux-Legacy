["ace_treatmentSucceded", {[(_this select 0),(_this select 1)] call twc_fnc_healing}] call CBA_fnc_addEventHandler;

twc_fnc_healing = {
	params["_player","_civ"];
	if(side _civ != "CIV")exitWith{};
	_damageSource = _deadGuy getVariable ["ace_medical_lastDamageSource", objNull];
	if(side _damageSource == "WEST")then{
		
	}else{
		["TWC_Insurgency_adjustPoints", 2] call CBA_fnc_serverEvent;
	};
};