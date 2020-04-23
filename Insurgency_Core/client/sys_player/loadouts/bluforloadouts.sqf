/*
by hobbs
example: twc_loadout_usaf_jtac call twc_loadout_switchloadout
*/

twc_loadout_basicmedicitems = [["ACE_fieldDressing", 30], ["ACE_elasticBandage", 15], ["ACE_quikclot", 20], ["ACE_tourniquet", 8], ["ACE_morphine", 15], ["ACE_epinephrine", 10], ["ACE_salineIV_500", 15], ["ACE_salineIV_250", 15]];

twc_loadout_basicuniformitems = [["ACE_EarPlugs", 1], ["ACE_CableTie", 3], ["ACE_fieldDressing", 12], ["ACE_elasticBandage", 5], ["ACE_quikclot", 4], ["ACE_tourniquet", 2], ["ACE_morphine", 1], ["ACE_epinephrine", 1], ["ACE_Canteen", 1]];

twc_loadout_basiclinkeditems = ["ItemMap", "ItemCompass", "ItemWatch"];

waituntil {!isnil "twc_crateitems"};

#include "pilots.sqf";
#include "sniper.sqf";
#include "sf.sqf";

twc_loadout_usaf_jtac = [
	//uniform
	(["rhs_uniform_g3_mc"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC148", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"CUP_H_PMC_Cap_EP_Grey",

	//vest
	(["CUP_V_B_Ciras_Khaki"] call bis_fnc_selectrandom),

	//vestitems

	[["ACRE_PRC152", 1], ["rhs_mag_20Rnd_SCAR_762x51_m80a1_epr", 5], ["rhs_mag_20Rnd_SCAR_762x51_m62_tracer", 3], ["HandGrenade", 2], ["SmokeShell", 2]],

	//backpack
	"UK3CB_BAF_B_Bergen_TAN_JTAC_H_A",

	//backpackitems

	[["rhs_mag_20Rnd_SCAR_762x51_m80a1_epr", 6], ["rhsusf_opscore_ut_pelt", 1], ["Laserbatteries", 2], ["1Rnd_HE_Grenade_shell", 10], ["1Rnd_SmokeRed_Grenade_shell", 5], ["1Rnd_SmokeBlue_Grenade_shell", 5], ["1Rnd_SmokeGreen_Grenade_shell", 5]],

	//night kit
	["rhs_uniform_g3_mc", "rhsusf_ANPVS_15", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 6], ["Chemlight_red", 6], ["Chemlight_blue", 6]]],

	//weapons

	[["twc_mk17_elcan", []], ["rhs_weap_M320", []], ["UK3CB_BAF_Soflam_Laserdesignator", []]],

	//linkeditems

	(["itemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["rhs_mag_20Rnd_SCAR_762x51_m80a1_epr", 50], ["rhs_mag_20Rnd_SCAR_762x51_m62_tracer", 10], ["1Rnd_HE_Grenade_shell", 30], ["1Rnd_SmokeRed_Grenade_shell", 30], ["1Rnd_SmokeBlue_Grenade_shell", 30], ["1Rnd_SmokeGreen_Grenade_shell", 30]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["UK3CB_BAF_Kite"], ([["ACE_SpraypaintGreen", 1]])],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], []]

];
twc_loadout_baf_jtac = [
	//uniform
	(["UK3CB_BAF_U_CombatUniform_MTP_TShirt_RM"] call bis_fnc_selectrandom),

	//uniformitems
	([["ACRE_PRC343", 1], ["ACE_MapTools", 1]] + twc_loadout_basicuniformitems),

	//helmet

	"UK3CB_BAF_H_Mk7_Camo_ESS_B",

	//vest
	(["twc_warriorvest_dcs"] call bis_fnc_selectrandom),

	//vestitems

	[["ACRE_PRC152", 2], ["rhsusf_mag_17Rnd_9x19_JHP", 2], ["UK3CB_BAF_556_30Rnd", 8], ["UK3CB_BAF_556_30Rnd_T", 3], ["HandGrenade", 2], ["SmokeShell", 2]],

	//backpack
	"UK3CB_BAF_B_Bergen_MTP_JTAC_H_A",

	//backpackitems

	[["UK3CB_BAF_556_30Rnd", 6], ["UK3CB_BAF_556_30Rnd_T", 3], ["CUP_H_PMC_Cap_Back_EP_Grey", 1], ["Laserbatteries", 2], ["1Rnd_HE_Grenade_shell", 10], ["1Rnd_SmokeRed_Grenade_shell", 5], ["1Rnd_SmokeBlue_Grenade_shell", 5], ["1Rnd_SmokeGreen_Grenade_shell", 5]],

	//night kit
	["UK3CB_BAF_U_CombatUniform_MTP", "rhsusf_ANPVS_14", [["ACE_Flashlight_KSF1", 1], ["ACE_Chemlight_IR", 6], ["Chemlight_red", 6], ["Chemlight_blue", 6]]],

	//weapons

	[["UK3CB_BAF_L85A2_UGL_ELCAN3D", []], ["rhsusf_weap_glock17g4", []], ["UK3CB_BAF_Soflam_Laserdesignator", []]],

	//linkeditems

	(["itemcTab"] + twc_loadout_basiclinkeditems),
	
	//weapons to remove from crate, weapons to add
	
	[["all"], ([] + twc_crateweapons)],
	
	//mags to remove from crate, mags to add
	
	[["all"], ([["UK3CB_BAF_556_30Rnd", 50], ["UK3CB_BAF_556_30Rnd_T", 10], ["1Rnd_HE_Grenade_shell", 30], ["1Rnd_SmokeRed_Grenade_shell", 30], ["1Rnd_SmokeBlue_Grenade_shell", 30], ["1Rnd_SmokeGreen_Grenade_shell", 30]] + twc_cratemagazines)],
	
	//items to remove from crate, mags to add
	
	[["UK3CB_BAF_Kite"], ([["ACE_SpraypaintGreen", 1]])],
	
	//backpacks to remove from crate, backpacks to add
	
	[["all"], []]

];


twc_loadout_switchloadout = {
	params ["_uniform", "_uniformitems", "_helmet", "_vest", "_vestitems", "_backpack", "_backpackitems", "_nightkit", "_weapons", "_linkeditems", ["_crateweapons", []], ["_cratemags", []], ["_crateitems", []], ["_cratebackpacks", []]];
	
	(group player) setvariable ["twc_nopersistentloadout", true, true];
	
	_nightkit params ["_nightuniform", "_nightNVGs", "_nightitems"];
	
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	
	_suntime = date call BIS_fnc_sunriseSunsetTime;
	
	_isnighttime = ((daytime < ((_suntime select 0) - 0.5)) || (daytime > ((_suntime select 1) - 1)));
	
	if (_isnighttime) then {
		if (_nightuniform != "") then {
			_uniform = _nightuniform;
		};
		player linkitem _nightNVGs;
	};
	
	player forceadduniform _uniform;
	
	{
		for "_i" from 1 to (_x select 1) do {
			player additemtouniform (_x select 0);
		};
	} foreach _uniformitems;
	
	player addheadgear _helmet;
	
	player addvest _vest;
	
	{
		for "_i" from 1 to (_x select 1) do {
			player additemtovest (_x select 0);
		};
	} foreach _vestitems;
	
	player addbackpack _backpack;
	
	_newload = [(configFile >> "CfgVehicles" >> _backpack), "maximumload", 0] call BIS_fnc_returnConfigEntry;
	missionnamespace setvariable ["twc_maxbagload", _newload];
	
	{
		for "_i" from 1 to (_x select 1) do {
			player additemtobackpack (_x select 0);
		};
	} foreach _backpackitems;
	
	{
		player addweapon (_x select 0);
		if ((count (_x select 1)) > 0) then {
			if ((_x select 0) == primaryweapon player) then {
				{
					player addprimaryweaponitem _x;
				} foreach (_x select 1);
			};
			if ((_x select 0) == secondaryweapon player) then {
				{
					player addsecondaryweaponitem _x;
				} foreach (_x select 1);
			};
			if ((_x select 0) == handgunweapon player) then {
				{
					player addHandgunItem _x;
				} foreach (_x select 1);
			};
		};
	} foreach _weapons;
	
	group player setvariable ["twc_magazinearray", []];
	group player setvariable ["twc_itemarray", []];
	
	if (_isnighttime) then {
		{
			for "_i" from 1 to (_x select 1) do {
				player additem (_x select 0);
			};
		} foreach _nightitems;
	};
	
	{
		player linkitem _x;
	} foreach _linkeditems;
	[player] call twc_fnc_buildmagarray_set;
	
	_box = missionnamespace getvariable ["cratebox", objnull];
	
	if (!isnull _box) then {
	
		if ((count _crateweapons) > 0) then {
			_crateweapons params ["_deleteweps", "_addweps"];
			if ((_deleteweps select 0) == "all") then {
				clearweaponcargo _box;
			} else {
				_origweps = weaponcargo _box;
				{
					while {(_x in _origweps)} do {
						_origweps deleteat (_origweps find _x);
					};
				} foreach _deleteweps;
				clearweaponcargo _box;
				{
					_box addweaponcargo [_x, 1];
				} foreach _origweps;
			};
			
			{
				_box addweaponcargo [_x select 0, _x select 1];
			} foreach _addweps;
		};
	
		if ((count _cratemags) > 0) then {
			_cratemags params ["_deleteweps", "_addweps"];
			if ((_deleteweps select 0) == "all") then {
				clearmagazinecargo _box;
			} else {
				_origweps = magazinecargo _box;
				{
					while {(_x in _origweps)} do {
						_origweps deleteat (_origweps find _x);
					};
				} foreach _deleteweps;
				clearmagazinecargo _box;
				{
					_box addmagazinecargo [_x, 1];
				} foreach _origweps;
			};
			
			{
				_box addmagazinecargo [_x select 0, _x select 1];
			} foreach _addweps;
		};
	
		if ((count _crateitems) > 0) then {
			_crateitems params ["_deleteweps", "_addweps"];
			if ((_deleteweps select 0) == "all") then {
				clearitemcargo _box;
			} else {
				_origweps = itemcargo _box;
				{
					while {(_x in _origweps)} do {
						_origweps deleteat (_origweps find _x);
					};
				} foreach _deleteweps;
				clearitemcargo _box;
				{
					_box additemcargo [_x, 1];
				} foreach _origweps;
			};
			
			{
				_box additemcargo [_x select 0, _x select 1];
			} foreach _addweps;
		};
	
		if ((count _cratebackpacks) > 0) then {
			_cratebackpacks params ["_deleteweps", "_addweps"];
			if ((_deleteweps select 0) == "all") then {
				clearbackpackcargo _box;
			} else {
				_origweps = backpackcargo _box;
				{
					while {(_x in _origweps)} do {
						_origweps deleteat (_origweps find _x);
					};
				} foreach _deleteweps;
				clearbackpackcargo _box;
				{
					_box addbackpackcargo [_x, 1];
				} foreach _origweps;
			};
			
			{
				_box addbackpackcargo [_x select 0, _x select 1];
			} foreach _addweps;
		};
	};
	[] spawn {
		sleep (random 3);
		[player] call twc_fnc_buildmagarray;
	};
};
