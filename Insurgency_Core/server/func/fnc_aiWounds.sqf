/*
* Author(s): [TWC] jayman
* AI ACE Damager

* Arguments:
* <OBJECT> Unit
* <Number> 0-1 || 2
* <Array> Array of possible damage string
* <ARRAY> Array of possible Damge part strings
*
* Return Value:
* <NONE>
*
* Example:
* [p1,0.5,["Punch"],["hand_l"]] call twc_fnc_aiWounds;
*
* Public: No
*/

params["_unit",["_damage",2],["_damageType",["falling","punch","ropeburn","stab","bullet","grenade","vehiclecrash"]],["_damagePart",["hand_l","hand_r","leg_l","leg_r","Head","body"]]];

//If damage == 2 then we apply random damage
if(_damage == 2)then{_damage = random 1;};

//Randomly selecting bodyPart and type from given array
_bodyPart = _damagePart call bis_fnc_selectRandom;
_type = _damageType call bis_fnc_selectRandom;

//Ace function to apply the damage
[_unit,_damage,_bodyPart,_type] call ace_medical_fnc_addDamageToUnit;