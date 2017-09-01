/*
* Author: [TWC] Bosenator
* Server controller & interface for handling morale increases/decreases. 
* Is percentage based; 100% is max morale, 0 is min.
*
* Arguments:
* 0: "TWC_Insurgency_adjustInsurgentMorale" <String>
* 1: Integer
*
* Return Value:
* <NONE>
*
* Example:
* ["TWC_Insurgency_adjustInsurgentMorale", 5] call CBA_fnc_serverEvent;
* ["TWC_Insurgency_adjustCivilianMorale", 10] call CBA_fnc_serverEvent;
*
* Public: No
*/
TWC_civMorale = 30;
TWC_insMorale = 30;

// run once to init, publicVariables for display only
publicVariable "TWC_civMorale";
publicVariable "TWC_insMorale";

["TWC_Insurgency_adjustCivilianMorale", {
	_mod = (this select 0);
	TWC_insMorale = ((TWC_insMorale + _mod) max 0) min 100;
	publicVariable "TWC_insMorale";
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_adjustInsurgentMorale", {
	_mod = (this select 0);
	TWC_insMorale = ((TWC_insMorale + _mod) max 0) min 100;
	publicVariable "TWC_insMorale";
}] call CBA_fnc_addEventHandler;