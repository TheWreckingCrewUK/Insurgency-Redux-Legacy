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
	
	//
	if(typeOf _exp in ["ATMine_Range_Ammo", "rhsusf_mine_m14_ammo", "APERSMine_Range_Ammo", "rhs_ammo_ptm1", "rhs_mine_pmn2_ammo", "rhs_ammo_pfm1", "ACE_IEDLandBig_Range_Ammo","ACE_IEDLandSmall_Range_Ammo","ACE_IEDUrbanBig_Range_Ammo","ACE_IEDUrbanSmall_Range_Ammo"])exitWith{
		deleteVehicle _exp;
		hint "You are supposed to clean up the explosives, not plant them";
	};
}] call CBA_fnc_addEventHandler;

["ace_explosives_defuse", {
	params ["_exp", "_unit"];
	if(typeOf _exp in ["ATMine_Range_Ammo", "rhsusf_mine_m14_ammo", "APERSMine_Range_Ammo", "rhs_ammo_ptm1", "rhs_mine_pmn2_ammo", "rhs_ammo_pfm1", "ACE_IEDLandBig_Range_Ammo","ACE_IEDLandSmall_Range_Ammo","ACE_IEDUrbanBig_Range_Ammo","ACE_IEDUrbanSmall_Range_Ammo"])then{
		["TWC_Insurgency_adjustPoints", 5] call CBA_fnc_serverEvent;
	};
}] call CBA_fnc_addEventHandler;