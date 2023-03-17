//Weapons, Binocular Devices etc.
[arsenalAmmoBox,
	[
		"twc_m4_acog_lazer",
		"CUP_hgun_M9",
		"CUP_launch_M136",
		"ACE_VMM3",
		"twc_nightvision_gen3"
	],false] call BIS_fnc_addVirtualWeaponCargo;

//Ammunition, Grenades, Etc
[arsenalAmmoBox,
	[
		"30Rnd_556x45_Stanag",
		"30Rnd_556x45_Stanag_Tracer_Red",
		"CUP_15Rnd_9x19_M9",
		"SmokeShell",
		"HandGrenade"
	],false] call BIS_fnc_addVirtualMagazineCargo;

//Equipment
[arsenalAmmoBox,
	[
		"CUP_U_B_USArmy_ACU_OCP",
		"CUP_V_B_IOTV_OCP_SL_USArmy",
		"CUP_V_B_IOTV_OCP_Grenadier_USArmy",
		"CUP_V_B_IOTV_OCP_SAW_USArmy",
		"CUP_V_B_IOTV_OCP_Rifleman_USArmy",
		"CUP_V_B_IOTV_OCP_Medic_USArmy",
		"CUP_H_USArmy_HelmetACH_GCOVERED_Headset_OCP",
		"CUP_H_USArmy_Boonie_OCP",
		"CUP_optic_CompM4",
        "CUP_optic_HoloBlack",
        "CUP_acc_ANPEQ_15_Black",
		"ACRE_PRC148"
	],false] call Bis_fnc_addVirtualItemCargo;
	
//Backpacks
[arsenalAmmoBox,
	[
		"CUP_B_US_IIID_OCP"
	],false] call Bis_fnc_addVirtualBackpackCargo;