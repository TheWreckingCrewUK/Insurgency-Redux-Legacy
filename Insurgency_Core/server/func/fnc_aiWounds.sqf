params["_unit",["_damage",2],["_damageType",["falling","punch","ropeburn","stab","bullet","grenade","vehiclecrash"]],["_damagePart",["hand_l","hand_r","leg_l","leg_r","Head","body"]]];

if(_damage == 2)then{_damage = random 1;};

_bodyPart = _damagePart call bis_fnc_selectRandom;
_type = _damageType call bis_fnc_selectRandom;
[_unit,_damage,_bodyPart,_type] call ace_medical_fnc_addDamageToUnit;