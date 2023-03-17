//Weapons, Binocular Devices etc.
[arsenalAmmoBox,
	[
		"CUP_arifle_G36A",
		"CUP_hgun_Glock17",
		"twc_nightvision_gen3"
	],false] call BIS_fnc_addVirtualWeaponCargo;

//Ammunition, Grenades, Etc
[arsenalAmmoBox,
	[
		"CUP_30Rnd_556x45_G36",
		"CUP_30Rnd_TE1_Red_Tracer_556x45_G36",
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
		"ACE_bodyBag",
		"ACE_salineIV_500",
		"ACE_salineIV_1000",
		"ACE_personalAidKit",
		"ACE_surgicalKit",
		"ACRE_PRC148"
	],false] call Bis_fnc_addVirtualItemCargo;

//Backpacks
[arsenalAmmoBox,
	[
		"UK3CB_BAF_B_Bergen_TAN_SL_A",
		"CUP_B_GER_Pack_Tropentarn"
	],false] call Bis_fnc_addVirtualBackpackCargo;
