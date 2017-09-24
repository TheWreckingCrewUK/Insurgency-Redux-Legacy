params["_unit"];

_damageSource = _unit getVariable ["ace_medical_lastDamageSource", objNull];
if(side _damageSource == WEST)exitWith{};
if !(_unit getVariable "ace_medical_isBleeding")exitWith{};
["TWC_Insurgency_adjustPoints", 2] call CBA_fnc_serverEvent;