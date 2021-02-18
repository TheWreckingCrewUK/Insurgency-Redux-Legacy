/*
* Event Handler to stop players from being morons with ace placed explosives
*/

["ace_explosives_place", {
	params ["_exp", "_dir", "_pitch", "_unit"];

	//First check stops players from planting any explosive in base
	if((getPos _unit) distance2D (getMarkerPos "base") < 1000)exitWith{
		deleteVehicle _exp;
		hint "You Cannot place explosives this close to base";
	};
	
	if(typeOf _exp in ["ATMine_Range_Ammo",  "APERSMine_Range_Ammo",    "ACE_IEDLandBig_Range_Ammo","ACE_IEDLandSmall_Range_Ammo","ACE_IEDUrbanBig_Range_Ammo","ACE_IEDUrbanSmall_Range_Ammo"])exitWith{
		deleteVehicle _exp;
		if ((side player) != east) then {
			hint "You are supposed to clean up the explosives, not plant them";
		} else {
			hint "Good thinking, but its caused too much trouble in the past. IED removed.";
		};
	};
}] call CBA_fnc_addEventHandler;

["ace_explosives_defuse", {
	params ["_exp", "_unit"];
	if(typeOf _exp in ["ATMine_Range_Ammo",  "APERSMine_Range_Ammo",    "ACE_IEDLandBig_Range_Ammo","ACE_IEDLandSmall_Range_Ammo","ACE_IEDUrbanBig_Range_Ammo","ACE_IEDUrbanSmall_Range_Ammo"])then{
	//totalPoints = totalPoints + 5;
	//publicVariable "totalPoints";
	
	if (!hasinterface) exitwith {};
	if (player != _unit) exitwith {};
	["TWC_Insurgency_adjustPoints", 5] call CBA_fnc_serverEvent;
	_marker = createMarker [format ["%1", _exp], getpos _exp];
	_marker setMarkerType "mil_triangle";
	_marker setMarkerColor "ColorYellow";
	_marker setMarkerText ("IED Defused");
	_marker setMarkerSize [0.75, 0.75];
	hint "IED Defused. Bring it back to base and deposit it in your main ammobox for extra points and intel";
	};
}] call CBA_fnc_addEventHandler;