//Weapons, Binocular Devices etc.
[arsenalAmmoBox,
	[
		"CUP_arifle_M16A4_ACOG_Laser",
		"CUP_hgun_Colt1911",
		"CUP_launch_M136",
		"ACE_VMM3",
		"twc_nightvision_gen3"
	],false] call BIS_fnc_addVirtualWeaponCargo;

//Ammunition, Grenades, Etc
[arsenalAmmoBox,
	[
		"30Rnd_556x45_Stanag",
		"30Rnd_556x45_Stanag_Tracer_Red",
		"CUP_200Rnd_TE4_Red_Tracer_556x45_M249",
		"CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",
		"CUP_7Rnd_45ACP_1911",
		"SmokeShell",
		"HandGrenade"
	],false] call BIS_fnc_addVirtualMagazineCargo;

//Equipment
[arsenalAmmoBox,
	[
		"CUP_U_B_USMC_FROG1_DMARPAT",
		"CUP_H_LWHv2_MARPAT_des",
		"CUP_V_B_Eagle_SPC_SL",
		"CUP_V_B_Eagle_SPC_Rifleman",
		"CUP_V_B_Eagle_SPC_Corpsman",
		"CUP_optic_CompM4",
        "CUP_optic_HoloBlack",
        "CUP_acc_ANPEQ_15_Black",
		"ACRE_PRC148"
	],false] call Bis_fnc_addVirtualItemCargo;
	
//Backpacks
[arsenalAmmoBox,
	[
		"CUP_B_AssaultPack_Coyote"
	],false] call Bis_fnc_addVirtualBackpackCargo;