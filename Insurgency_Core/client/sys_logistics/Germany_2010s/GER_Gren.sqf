//Weapons, Binocular Devices etc.
[arsenalAmmoBox,
	[
		"twc_G36A_AG36_acog",
		"CUP_hgun_Glock17",
		"ACE_VMM3",
		"twc_nightvision_gen3",
		"CUP_launch_M136",
		"RW_Launch_ASM_AS_Loaded",
		"ACE_Vector"
	],false] call BIS_fnc_addVirtualWeaponCargo;

//Ammunition, Grenades, Etc
[arsenalAmmoBox,
	[
		"CUP_30Rnd_556x45_G36",
		"CUP_30Rnd_TE1_Red_Tracer_556x45_G36",
		"CUP_1Rnd_HEDP_M203",
		"1Rnd_Smoke_Grenade_shell",
		"CUP_17Rnd_9x19_glock17",
		"SmokeShell",
		"HandGrenade"
	],false] call BIS_fnc_addVirtualMagazineCargo;

//Equipment
[arsenalAmmoBox,
	[
		"CUP_V_B_GER_PVest_Trop_RFL",
		"CUP_H_Ger_M92_Cover_Trop",
		"CUP_U_B_GER_Tropentarn_1",
		"cup_optic_g36optics15x",
        "cup_optic_g36optics_holo",
        "cup_optic_g36optics",
		"ACRE_PRC148"
	],false] call Bis_fnc_addVirtualItemCargo;
	
//Backpacks
[arsenalAmmoBox,
	[
		"UK3CB_BAF_B_Bergen_TAN_SL_A",
		"CUP_B_GER_Pack_Tropentarn"
	],false] call Bis_fnc_addVirtualBackpackCargo;
