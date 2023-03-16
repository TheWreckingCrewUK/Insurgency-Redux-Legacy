//Weapons, Binocular Devices etc.
[arsenalAmmoBox,
	[
		"twc_HK_MG3",
		"twc_HK_MG4",
		"CUP_hgun_Glock17"
	],false] call BIS_fnc_addVirtualWeaponCargo;

//Ammunition, Grenades, Etc
[arsenalAmmoBox,
	[
		"CUP_30Rnd_TE1_Red_Tracer_556x45_G36",
		"CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag",
		"UK3CB_BAF_762_200Rnd_T",
		"CUP_200Rnd_TE4_Red_Tracer_556x45_M249",
		"CUP_17Rnd_9x19_glock17",
		"ACE_SpareBarrel",
		"SmokeShell",
		"HandGrenade"
	],false] call BIS_fnc_addVirtualMagazineCargo;

//Equipment
[arsenalAmmoBox,
	[
		"CUP_V_B_GER_PVest_Trop_RFL",
		"CUP_H_Ger_M92_Cover_Trop",
		"CUP_U_B_GER_Tropentarn_1",
		"cup_optic_g36optics15x",1],
        "cup_optic_g36optics",
		"ACRE_PRC148"
	],false] call Bis_fnc_addVirtualItemCargo;
	
//Backpacks
[arsenalAmmoBox,
	[
		"UK3CB_BAF_B_Bergen_TAN_SL_A",
		"CUP_B_GER_Pack_Tropentarn"
	],false] call Bis_fnc_addVirtualBackpackCargo;