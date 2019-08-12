



twc_loadout_pilotus_pilot = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "rhs_uniform_cu_ocp_1stcav";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
	_unit addItemToUniform "ACE_MapTools";
	_unit addVest "CUP_V_B_PilotVest";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	_unit addHeadgear "rhsusf_hgu56p_visor_green";

	_unit addWeapon "rhs_weap_m4_carryhandle";
	_unit addWeapon "rhsusf_weap_glock17g4";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	crateBox addMagazineCargo ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 50];
};


twc_loadout_pilotus_crewchief = {params ["_unit"];
	[_unit] call twc_loadout_pilotus_pilot;
	removeHeadgear _unit;

	_unit addHeadgear "rhsusf_hgu56p_visor_mask_green";
};

twc_loadout_pilotcag_pilot = {params ["_unit"];
	[_unit] call twc_loadout_pilotus_pilot;
	removeUniform _unit;

	_unit forceAddUniform "CUP_U_B_USMC_PilotOverall";
};

twc_loadout_pilotcag_crewchief = {params ["_unit"];
	[_unit] call twc_loadout_pilotus_pilot;
	removeUniform _unit;

	_unit forceAddUniform "CUP_U_B_USMC_PilotOverall";
};

twc_loadout_pilotbaf_pilot = {params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;

	_unit forceAddUniform "UK3CB_BAF_U_RolledUniform_MTP";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	_unit addItemToUniform "ACRE_PRC148";
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
	_unit addItemToUniform "ACE_MapTools";
	_unit addVest "UK3CB_BAF_V_Pilot_A";
	_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "B_IR_Grenade";
	for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
	_unit addHeadgear "UK3CB_BAF_H_PilotHelmetHeli_A";

	_unit addWeapon "UK3CB_BAF_L22A2";
	_unit addWeapon "rhsusf_weap_glock17g4";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	
	crateBox addMagazineCargo ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 50];
};


twc_loadout_pilotbaf_crewchief = {params ["_unit"];
	[_unit] call twc_loadout_pilotbaf_pilot;
	removeHeadgear _unit;

	_unit addHeadgear "rhsusf_hgu56p_visor_mask_green";
};
