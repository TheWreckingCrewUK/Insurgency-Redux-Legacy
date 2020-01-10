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
	_mod = _this;
	TWC_civMorale = ((TWC_civMorale + _mod) max 0) min 100;
	
	publicVariable "TWC_civMorale";
}] call CBA_fnc_addEventHandler;

["TWC_Insurgency_adjustInsurgentMorale", {
	_mod = _this;
	TWC_insMorale = ((TWC_insMorale + _mod) max 0) min 100;
	
	publicVariable "TWC_insMorale";
}] call CBA_fnc_addEventHandler;

addMissionEventHandler ["buildingChanged", {
	params ["_from", "_to", "_isRuin"];
	
	// In the future, there could be a (map specific) list of objects that have higher affect
	// Such as a mosque, or a bridge etc. Would need to be a hardcoded check list, sadly.
	if (_isRuin) then {
		["TWC_Insurgency_adjustCivilianMorale", -2.5] call CBA_fnc_serverEvent;
	};
}];