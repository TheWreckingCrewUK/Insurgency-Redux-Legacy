//Weapons, Binocular Devices etc.
[arsenalAmmoBox,
	[
		"twc_rhs_weap_m240G_mdo_lazer",
		"CUP_hgun_Colt1911",
		"twc_nightvision_gen3"
	],false] call BIS_fnc_addVirtualWeaponCargo;

//Ammunition, Grenades, Etc
[arsenalAmmoBox,
	[
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
		"CUP_V_B_Eagle_SPC_MG",
		"ACRE_PRC148"
	],false] call Bis_fnc_addVirtualItemCargo;
	
//Backpacks
[arsenalAmmoBox,
	[
		"CUP_B_AssaultPack_Coyote"
	],false] call Bis_fnc_addVirtualBackpackCargo;
