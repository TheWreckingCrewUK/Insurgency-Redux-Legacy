
		systemchat "restrict init";

player addEventHandler ["InventoryOpened", {
	if((getPos player) distance2D (getMarkerPos "base") < 200) then{
		if(primaryWeapon player in twc_restrictedPrimaryWeapons)then{
			player removeWeapon (primaryWeapon player);
		};
		if(secondaryWeapon player in twc_restrictedSecondaryWeapons)then{
			player removeWeapon (secondaryWeapon player);
		};
		if(handgunWeapon player in twc_restrictedHangunWeapons)then{
			player removeWeapon (handgunWeapon player);
		};
	};
}];
_local_restrictedPrimaryWeapons = ["twc_ksvk", "CUP_srifle_SVD_des_ghillie_pso", "CUP_arifle_M16A2", "CUP_arifle_FNFAL", "CUP_arifle_RPK74", "CUP_lmg_PKM", "CUP_arifle_AK74_GL", "CUP_arifle_AK74"];

if(isNil "twc_restrictedPrimaryWeapons") then{
twc_restrictedPrimaryWeapons = _local_restrictedPrimaryWeapons;
publicVariable "twc_restrictedPrimaryWeapons";
} else {
{twc_restrictedPrimaryWeapons pushback _x} foreach _local_restrictedPrimaryWeapons;
publicVariable "twc_restrictedPrimaryWeapons";};

twc_restrictedSecondaryWeapons = ["CUP_launch_RPG7V"];

player addEventHandler ["Take", {
	params["_unit","_container","_item"];
		if (_item in twc_restrictedPrimaryWeapons) then {
		execvm "Insurgency_Core\client\sys_restrict\restrictedprimary.sqf";
	};
	
		if(_item in twc_restrictedSecondaryWeapons)then{
		execvm "Insurgency_Core\client\sys_restrict\restrictedsecondary.sqf";
					if (random 1>0.98) then {
			"R_60mm_HE" createVehicle (getPos player);
			hint "WEAPON DETONATION";	
			sleep 0.5;
			player removeweapon secondaryWeapon player;
		};
		};

		
	
}];