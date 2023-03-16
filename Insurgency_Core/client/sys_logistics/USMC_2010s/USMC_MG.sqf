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
