/*
by [TWC] Hobbs
one way enemy generation
*/

twc_approvedenemies = [
"76561198030665694",
"76561198005456546",
"76561198024831311",
"76561198049111014",
"76561197981096983",
"76561198053960783",
"76561198021236275",
"76561198001649761",
"76561198067006602",
"76561198007009266",
"76561198054727971",
"76561198018609662",
"76561198042520910"];

_boxaction = ["enemymenu","Switch to Enemy","",{
},{((getPlayerUID player) in twc_approvedenemies)}] call ace_interact_menu_fnc_createAction;
[crateBox,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;

_boxaction = ["enemymenurif","Rifleman","",{["rifleman"] call twc_loadout_insurgentswitch;
},{true}] call ace_interact_menu_fnc_createAction;
[crateBox,0,["ACE_MainActions", "enemymenu"],_boxaction] call ace_interact_menu_fnc_addActionToobject;

_boxaction = ["enemymenurif","MG","",{["mg"] call twc_loadout_insurgentswitch;
},{true}] call ace_interact_menu_fnc_createAction;
[crateBox,0,["ACE_MainActions", "enemymenu"],_boxaction] call ace_interact_menu_fnc_addActionToobject;

_boxaction = ["enemymenurif","Grenadier","",{["grenadier"] call twc_loadout_insurgentswitch;
},{true}] call ace_interact_menu_fnc_createAction;
[crateBox,0,["ACE_MainActions", "enemymenu"],_boxaction] call ace_interact_menu_fnc_addActionToobject;

_boxaction = ["enemymenurif","RPG Gunner","",{["rpg"] call twc_loadout_insurgentswitch;
},{true}] call ace_interact_menu_fnc_createAction;
[crateBox,0,["ACE_MainActions", "enemymenu"],_boxaction] call ace_interact_menu_fnc_addActionToobject;

_boxaction = ["enemymenurif","Sniper","",{["sniper"] call twc_loadout_insurgentswitch;
},{true}] call ace_interact_menu_fnc_createAction;
[crateBox,0,["ACE_MainActions", "enemymenu"],_boxaction] call ace_interact_menu_fnc_addActionToobject;

_boxaction = ["enemymenurif","Heavy Gunner","",{["heavygunner"] call twc_loadout_insurgentswitch;
},{(totalpoints > (pointlimit * 0.3))}] call ace_interact_menu_fnc_createAction;
[crateBox,0,["ACE_MainActions", "enemymenu"],_boxaction] call ace_interact_menu_fnc_addActionToobject;

_boxaction = ["enemymenurif","Heavy Sniper","",{["heavysniper"] call twc_loadout_insurgentswitch;
},{(totalpoints > (pointlimit * 0.8))}] call ace_interact_menu_fnc_createAction;
[crateBox,0,["ACE_MainActions", "enemymenu"],_boxaction] call ace_interact_menu_fnc_addActionToobject;


twc_loadout_insurgent_rifleman = {

	_timer = player getvariable ["twc_lastloadoutswitch", -999];
	if (_timer > (time - 300)) exitwith {
		hint "its been less than 5 minutes since your last loadout switch";
	};
	player setvariable ["twc_lastloadoutswitch", time];
	
	
	_prev = player getvariable ["twc_enemyrole", "rifleman"];
	[_prev] spawn twc_removeoldenemyrole;
	player setvariable ["twc_enemyrole", "rifleman"];
	
	_arr = missionnamespace getvariable ["twc_enemyplayerroles", []];
	//_arr pushback "rifleman";
	//missionnamespace setvariable ["twc_enemyplayerroles", _arr, true];
	
	_uniform = ["CUP_O_TKI_Khet_Partug_01","CUP_O_TKI_Khet_Partug_02","CUP_O_TKI_Khet_Partug_03","CUP_O_TKI_Khet_Partug_04","CUP_O_TKI_Khet_Partug_05","CUP_O_TKI_Khet_Partug_06","CUP_O_TKI_Khet_Partug_07","CUP_O_TKI_Khet_Partug_08"] call bis_fnc_selectrandom;
	
	_wep = [["CUP_arifle_AK47_Early", "rhs_75Rnd_762x39mm_tracer"], 
	["CUP_arifle_AK47_Early", "rhs_30Rnd_762x39mm"], 
	["CUP_arifle_AK47_Early", "CUP_20Rnd_762x39_AMD63_M"], 
	["CUP_arifle_AKM_Early", "rhs_30Rnd_762x39mm"], 
	["CUP_arifle_AKMS_Early", "rhs_75Rnd_762x39mm_tracer"], 
	["CUP_arifle_AK47_Early", "CUP_30Rnd_762x39_AK47_TK_M"], 
	["CUP_arifle_AKM_Early", "rhs_30Rnd_762x39mm_polymer_tracer"], 
	["CUP_arifle_AK47_Early", "CUP_40Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M"]
	] call bis_fnc_selectrandom;
	
	_vest = ["rhsgref_chestrig", 
	"twc_lightcarrier_oli",
	"CUP_V_B_ALICE",
	"twc_lightcarrier_tan",
	"twc_V_HarnessO_dpmt"
	] call bis_fnc_selectrandom;

	params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_unit forceAddUniform _uniform;
	
	_unit addItemToUniform "ACRE_PRC152";
	[] spawn {sleep 1;_radioID = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
	_channelNumber = missionnamespace getvariable ["twc_enemychannel", 2]; 
	_switchChannel = [_radioID, _channelNumber] call acre_api_fnc_setRadioChannel;};
	
	for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addVest _vest;
	
	for "_i" from 1 to 5 do {_unit addItemToUniform (_wep select 1);};
	for "_i" from 1 to 15 do {_unit addItemToVest (_wep select 1);};
	_unit addWeapon (_wep select 0);
	_unit addItemToVest (_wep select 1);
	

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemGPS";
	_unit linkItem "ItemWatch";
	_me = player;
	[_me, (["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]call bis_fnc_selectrandom)] remoteExec ["setFace", 0, _me];
};

twc_loadout_insurgent_grenadier = {

	_timer = player getvariable ["twc_lastloadoutswitch", -999];
	if (_timer > (time - 300)) exitwith {
		hint "its been less than 5 minutes since your last loadout switch";
	};
	player setvariable ["twc_lastloadoutswitch", time];
	
	_prev = player getvariable ["twc_enemyrole", "rifleman"];
	[_prev] spawn twc_removeoldenemyrole;
	
	player setvariable ["twc_enemyrole", "grenadier"];
	
	_arr = missionnamespace getvariable ["twc_enemyplayerroles", []];
	_arr pushback "grenadier";
	missionnamespace setvariable ["twc_enemyplayerroles", _arr, true];
	
	_uniform = ["CUP_O_TKI_Khet_Partug_01","CUP_O_TKI_Khet_Partug_02","CUP_O_TKI_Khet_Partug_03","CUP_O_TKI_Khet_Partug_04","CUP_O_TKI_Khet_Partug_05","CUP_O_TKI_Khet_Partug_06","CUP_O_TKI_Khet_Partug_07","CUP_O_TKI_Khet_Partug_08"] call bis_fnc_selectrandom;
	
	_wep = [["CUP_arifle_AK47_GL_Early", "rhs_30Rnd_762x39mm_89"], 
	["CUP_arifle_AKM_GL_Early", "rhs_30Rnd_762x39mm"], 
	["CUP_arifle_AKMS_GL_Early", "rhs_30Rnd_762x39mm"]
	] call bis_fnc_selectrandom;
	
	
	_vest = ["rhsgref_chestrig", 
	"twc_lightcarrier_oli",
	"CUP_V_B_ALICE",
	"CUP_V_OI_TKI_Jacket1_01",
	"CUP_V_OI_TKI_Jacket1_02",
	"CUP_V_OI_TKI_Jacket1_03",
	"CUP_V_OI_TKI_Jacket1_04",
	"CUP_V_OI_TKI_Jacket1_05",
	"CUP_V_OI_TKI_Jacket1_06",
	"CUP_V_OI_TKI_Jacket2_01",
	"CUP_V_OI_TKI_Jacket2_02",
	"CUP_V_OI_TKI_Jacket2_03",
	"CUP_V_OI_TKI_Jacket2_04",
	"CUP_V_OI_TKI_Jacket2_05",
	"CUP_V_OI_TKI_Jacket2_06",
	"CUP_V_OI_TKI_Jacket5_01",
	"CUP_V_OI_TKI_Jacket5_02",
	"CUP_V_OI_TKI_Jacket5_03",
	"CUP_V_OI_TKI_Jacket5_04",
	"CUP_V_OI_TKI_Jacket5_05",
	"CUP_V_OI_TKI_Jacket5_06",
	"CUP_V_OI_TKI_Jacket3_02",
	"CUP_V_OI_TKI_Jacket3_03",
	"CUP_V_OI_TKI_Jacket3_04",
	"CUP_V_OI_TKI_Jacket3_05",
	"CUP_V_OI_TKI_Jacket3_06"
	] call bis_fnc_selectrandom;

	params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_unit forceAddUniform _uniform;
	
	_unit addItemToUniform "ACRE_PRC152";
	[] spawn {sleep 1;_radioID = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
	_channelNumber = missionnamespace getvariable ["twc_enemychannel", 2]; 
	_switchChannel = [_radioID, _channelNumber] call acre_api_fnc_setRadioChannel;};
	
	for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_quikclot";};
	for "_i" from 1 to 8 do {_unit addItemToUniform "rhs_VOG25";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addVest _vest;
	
	for "_i" from 1 to 7 do {_unit addItemToVest (_wep select 1);};
	_unit addWeapon (_wep select 0);
	_unit addItemToVest (_wep select 1);
	

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemGPS";
	_unit linkItem "ItemWatch";
	_me = player;
	[_me, (["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]call bis_fnc_selectrandom)] remoteExec ["setFace", 0, _me];
};


twc_loadout_insurgent_sniper = {

	_timer = player getvariable ["twc_lastloadoutswitch", -999];
	if (_timer > (time - 300)) exitwith {
		hint "its been less than 5 minutes since your last loadout switch";
	};
	player setvariable ["twc_lastloadoutswitch", time];
	
	_prev = player getvariable ["twc_enemyrole", "rifleman"];
	[_prev] spawn twc_removeoldenemyrole;
	
	player setvariable ["twc_enemyrole", "sniper"];
	
	_arr = missionnamespace getvariable ["twc_enemyplayerroles", []];
	_arr pushback "sniper";
	missionnamespace setvariable ["twc_enemyplayerroles", _arr, true];
	
	_uniform = ["CUP_O_TKI_Khet_Partug_01","CUP_O_TKI_Khet_Partug_02","CUP_O_TKI_Khet_Partug_03","CUP_O_TKI_Khet_Partug_04","CUP_O_TKI_Khet_Partug_05","CUP_O_TKI_Khet_Partug_06","CUP_O_TKI_Khet_Partug_07","CUP_O_TKI_Khet_Partug_08"] call bis_fnc_selectrandom;
	
	_wep = ["rhs_weap_svdp_pso1", "rhs_10Rnd_762x54mmR_7N1"];
	
	
	_vest = ["rhsgref_chestrig", 
	"twc_lightcarrier_oli",
	"CUP_V_B_ALICE",
	"CUP_V_OI_TKI_Jacket1_01",
	"CUP_V_OI_TKI_Jacket1_02",
	"CUP_V_OI_TKI_Jacket1_03",
	"CUP_V_OI_TKI_Jacket1_04",
	"CUP_V_OI_TKI_Jacket1_05",
	"CUP_V_OI_TKI_Jacket1_06",
	"CUP_V_OI_TKI_Jacket2_01",
	"CUP_V_OI_TKI_Jacket2_02",
	"CUP_V_OI_TKI_Jacket2_03",
	"CUP_V_OI_TKI_Jacket2_04",
	"CUP_V_OI_TKI_Jacket2_05",
	"CUP_V_OI_TKI_Jacket2_06",
	"CUP_V_OI_TKI_Jacket5_01",
	"CUP_V_OI_TKI_Jacket5_02",
	"CUP_V_OI_TKI_Jacket5_03",
	"CUP_V_OI_TKI_Jacket5_04",
	"CUP_V_OI_TKI_Jacket5_05",
	"CUP_V_OI_TKI_Jacket5_06",
	"CUP_V_OI_TKI_Jacket3_02",
	"CUP_V_OI_TKI_Jacket3_03",
	"CUP_V_OI_TKI_Jacket3_04",
	"CUP_V_OI_TKI_Jacket3_05",
	"CUP_V_OI_TKI_Jacket3_06"
	] call bis_fnc_selectrandom;

	params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_unit forceAddUniform _uniform;
	
	_unit addItemToUniform "ACRE_PRC152";
	[] spawn {sleep 1;_radioID = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
	_channelNumber = missionnamespace getvariable ["twc_enemychannel", 2]; 
	_switchChannel = [_radioID, _channelNumber] call acre_api_fnc_setRadioChannel;};
	
	for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addVest _vest;
	
	for "_i" from 1 to 30 do {_unit addItemToVest (_wep select 1);};
	_unit addWeapon (_wep select 0);
	_unit addItemToVest (_wep select 1);
	

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemGPS";
	_unit linkItem "ItemWatch";
	_me = player;
	[_me, (["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]call bis_fnc_selectrandom)] remoteExec ["setFace", 0, _me];
};


twc_loadout_insurgent_heavysniper = {

	_timer = player getvariable ["twc_lastloadoutswitch", -999];
	if (_timer > (time - 300)) exitwith {
		hint "its been less than 5 minutes since your last loadout switch";
	};
	player setvariable ["twc_lastloadoutswitch", time];
	
	_prev = player getvariable ["twc_enemyrole", "rifleman"];
	[_prev] spawn twc_removeoldenemyrole;
	
	player setvariable ["twc_enemyrole", "heavysniper"];
	
	_arr = missionnamespace getvariable ["twc_enemyplayerroles", []];
	_arr pushback "heavysniper";
	missionnamespace setvariable ["twc_enemyplayerroles", _arr, true];
	
	_uniform = ["CUP_O_TKI_Khet_Partug_01","CUP_O_TKI_Khet_Partug_02","CUP_O_TKI_Khet_Partug_03","CUP_O_TKI_Khet_Partug_04","CUP_O_TKI_Khet_Partug_05","CUP_O_TKI_Khet_Partug_06","CUP_O_TKI_Khet_Partug_07","CUP_O_TKI_Khet_Partug_08"] call bis_fnc_selectrandom;
	
	_wep = ["twc_ksvk", "twc_23mm_1rnd"];
	
	

	params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_unit forceAddUniform _uniform;
	
	_unit addItemToUniform "ACRE_PRC152";
	[] spawn {sleep 1;_radioID = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
	_channelNumber = missionnamespace getvariable ["twc_enemychannel", 2]; 
	_switchChannel = [_radioID, _channelNumber] call acre_api_fnc_setRadioChannel;};
	
	for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	
	_unit addbackpack "twc_oli_belt_2";
	for "_i" from 1 to 20 do {_unit addItemToBackpack (_wep select 1);};
	for "_i" from 1 to 8 do {_unit addItemToBackpack "rhs_mag_9x18_8_57N181S";};
	_unit addWeapon (_wep select 0);
	_unit addWeapon "rhs_weap_makarov_pm";
	_unit addItemToVest (_wep select 1);
	

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemGPS";
	_unit linkItem "ItemWatch";
	_me = player;
	[_me, (["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]call bis_fnc_selectrandom)] remoteExec ["setFace", 0, _me];
};

twc_loadout_insurgent_MG = {

	_timer = player getvariable ["twc_lastloadoutswitch", -999];
	if (_timer > (time - 300)) exitwith {
		hint "its been less than 5 minutes since your last loadout switch";
	};
	player setvariable ["twc_lastloadoutswitch", time];
	
	_prev = player getvariable ["twc_enemyrole", "rifleman"];
	[_prev] spawn twc_removeoldenemyrole;
	
	player setvariable ["twc_enemyrole", "mg"];
	
	_arr = missionnamespace getvariable ["twc_enemyplayerroles", []];
	_arr pushback "mg";
	missionnamespace setvariable ["twc_enemyplayerroles", _arr, true];
	
	_uniform = ["CUP_O_TKI_Khet_Partug_01","CUP_O_TKI_Khet_Partug_02","CUP_O_TKI_Khet_Partug_03","CUP_O_TKI_Khet_Partug_04","CUP_O_TKI_Khet_Partug_05","CUP_O_TKI_Khet_Partug_06","CUP_O_TKI_Khet_Partug_07","CUP_O_TKI_Khet_Partug_08"] call bis_fnc_selectrandom;
	
	_wep = [["rhs_weap_pkm", "rhs_100Rnd_762x54mmR_green"], 
	["CUP_arifle_RPK74", "rhs_75Rnd_762x39mm_tracer"]
	] call bis_fnc_selectrandom;
	
	
	_vest = ["rhsgref_chestrig", 
	"twc_lightcarrier_oli",
	"CUP_V_B_ALICE",
	"CUP_V_OI_TKI_Jacket1_01",
	"CUP_V_OI_TKI_Jacket1_02",
	"CUP_V_OI_TKI_Jacket1_03",
	"CUP_V_OI_TKI_Jacket1_04",
	"CUP_V_OI_TKI_Jacket1_05",
	"CUP_V_OI_TKI_Jacket1_06",
	"CUP_V_OI_TKI_Jacket2_01",
	"CUP_V_OI_TKI_Jacket2_02",
	"CUP_V_OI_TKI_Jacket2_03",
	"CUP_V_OI_TKI_Jacket2_04",
	"CUP_V_OI_TKI_Jacket2_05",
	"CUP_V_OI_TKI_Jacket2_06",
	"CUP_V_OI_TKI_Jacket5_01",
	"CUP_V_OI_TKI_Jacket5_02",
	"CUP_V_OI_TKI_Jacket5_03",
	"CUP_V_OI_TKI_Jacket5_04",
	"CUP_V_OI_TKI_Jacket5_05",
	"CUP_V_OI_TKI_Jacket5_06",
	"CUP_V_OI_TKI_Jacket3_02",
	"CUP_V_OI_TKI_Jacket3_03",
	"CUP_V_OI_TKI_Jacket3_04",
	"CUP_V_OI_TKI_Jacket3_05",
	"CUP_V_OI_TKI_Jacket3_06"
	] call bis_fnc_selectrandom;

	params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_unit forceAddUniform _uniform;
	
	_unit addItemToUniform "ACRE_PRC152";
	[] spawn {sleep 1;_radioID = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
	_channelNumber = missionnamespace getvariable ["twc_enemychannel", 2]; 
	_switchChannel = [_radioID, _channelNumber] call acre_api_fnc_setRadioChannel;};
	
	for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addVest _vest;
	
	for "_i" from 1 to 7 do {_unit addItemToVest (_wep select 1);};
	_unit addbackpack "CUP_B_AlicePack_OD";
	for "_i" from 1 to 7 do {_unit addItemToBackpack (_wep select 1);};
	_unit addWeapon (_wep select 0);
	_unit addItemToVest (_wep select 1);
	

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemGPS";
	_unit linkItem "ItemWatch";
	_me = player;
	[_me, (["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]call bis_fnc_selectrandom)] remoteExec ["setFace", 0, _me];
};


twc_loadout_insurgent_heavygunner = {

	_timer = player getvariable ["twc_lastloadoutswitch", -999];
	if (_timer > (time - 300)) exitwith {
		hint "its been less than 5 minutes since your last loadout switch";
	};
	player setvariable ["twc_lastloadoutswitch", time];
	
	_prev = player getvariable ["twc_enemyrole", "rifleman"];
	[_prev] spawn twc_removeoldenemyrole;
	
	player setvariable ["twc_enemyrole", "heavygunner"];
	
	_arr = missionnamespace getvariable ["twc_enemyplayerroles", []];
	_arr pushback "heavygunner";
	missionnamespace setvariable ["twc_enemyplayerroles", _arr, true];
	
	_uniform = ["CUP_O_TKI_Khet_Partug_01","CUP_O_TKI_Khet_Partug_02","CUP_O_TKI_Khet_Partug_03","CUP_O_TKI_Khet_Partug_04","CUP_O_TKI_Khet_Partug_05","CUP_O_TKI_Khet_Partug_06","CUP_O_TKI_Khet_Partug_07","CUP_O_TKI_Khet_Partug_08"] call bis_fnc_selectrandom;
	
	
	_wep = [["CUP_arifle_AK47_Early", "rhs_75Rnd_762x39mm_tracer"], 
	["CUP_arifle_AK47_Early", "rhs_30Rnd_762x39mm"], 
	["CUP_arifle_AK47_Early", "CUP_20Rnd_762x39_AMD63_M"], 
	["CUP_arifle_AKM_Early", "rhs_30Rnd_762x39mm"], 
	["CUP_arifle_AKMS_Early", "rhs_75Rnd_762x39mm_tracer"], 
	["CUP_arifle_AK47_Early", "CUP_30Rnd_762x39_AK47_TK_M"], 
	["CUP_arifle_AKM_Early", "rhs_30Rnd_762x39mm_polymer_tracer"], 
	["CUP_arifle_AK47_Early", "CUP_40Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M"]
	] call bis_fnc_selectrandom;
	
	_vest = [
	"CUP_V_OI_TKI_Jacket1_01",
	"CUP_V_OI_TKI_Jacket1_02",
	"CUP_V_OI_TKI_Jacket1_03",
	"CUP_V_OI_TKI_Jacket1_04",
	"CUP_V_OI_TKI_Jacket1_05",
	"CUP_V_OI_TKI_Jacket1_06",
	"CUP_V_OI_TKI_Jacket2_01",
	"CUP_V_OI_TKI_Jacket2_02",
	"CUP_V_OI_TKI_Jacket2_03",
	"CUP_V_OI_TKI_Jacket2_04",
	"CUP_V_OI_TKI_Jacket2_05",
	"CUP_V_OI_TKI_Jacket2_06",
	"CUP_V_OI_TKI_Jacket5_01",
	"CUP_V_OI_TKI_Jacket5_02",
	"CUP_V_OI_TKI_Jacket5_03",
	"CUP_V_OI_TKI_Jacket5_04",
	"CUP_V_OI_TKI_Jacket5_05",
	"CUP_V_OI_TKI_Jacket5_06",
	"CUP_V_OI_TKI_Jacket3_02",
	"CUP_V_OI_TKI_Jacket3_03",
	"CUP_V_OI_TKI_Jacket3_04",
	"CUP_V_OI_TKI_Jacket3_05",
	"CUP_V_OI_TKI_Jacket3_06"
	] call bis_fnc_selectrandom;

	params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_unit forceAddUniform _uniform;
	
	_unit addItemToUniform "ACRE_PRC152";
	[] spawn {sleep 1;_radioID = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
	_channelNumber = missionnamespace getvariable ["twc_enemychannel", 2]; 
	_switchChannel = [_radioID, _channelNumber] call acre_api_fnc_setRadioChannel;};
	
	for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addVest _vest;
	
	for "_i" from 1 to 7 do {_unit addItemToVest (_wep select 1);};
	_backpack = (["RHS_NSV_Gun_Bag", "CUP_B_RUS_Backpack"] call bis_fnc_selectrandom);
	_unit addbackpack _backpack;
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_fim92_mag";};
	
	_unit addWeapon (_wep select 0);
	_unit addItemToVest (_wep select 1);
	if (_backpack == "CUP_B_RUS_Backpack") then {
		_unit addweapon "rhs_weap_fim92";
	};
	
	

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemGPS";
	_unit linkItem "ItemWatch";
	_me = player;
	[_me, (["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]call bis_fnc_selectrandom)] remoteExec ["setFace", 0, _me];
};

twc_loadout_insurgent_RPG = {

	_timer = player getvariable ["twc_lastloadoutswitch", -999];
	if (_timer > (time - 300)) exitwith {
		hint "its been less than 5 minutes since your last loadout switch";
	};
	player setvariable ["twc_lastloadoutswitch", time];
	
	_prev = player getvariable ["twc_enemyrole", "rifleman"];
	[_prev] spawn twc_removeoldenemyrole;
	
	player setvariable ["twc_enemyrole", "rpg"];
	
	_arr = missionnamespace getvariable ["twc_enemyplayerroles", []];
	_arr pushback "rpg";
	missionnamespace setvariable ["twc_enemyplayerroles", _arr, true];
	
	_uniform = ["CUP_O_TKI_Khet_Partug_01","CUP_O_TKI_Khet_Partug_02","CUP_O_TKI_Khet_Partug_03","CUP_O_TKI_Khet_Partug_04","CUP_O_TKI_Khet_Partug_05","CUP_O_TKI_Khet_Partug_06","CUP_O_TKI_Khet_Partug_07","CUP_O_TKI_Khet_Partug_08"] call bis_fnc_selectrandom;
	
	
	_wep = [["CUP_arifle_AK47_Early", "rhs_75Rnd_762x39mm_tracer"], 
	["CUP_arifle_AK47_Early", "rhs_30Rnd_762x39mm"], 
	["CUP_arifle_AK47_Early", "CUP_20Rnd_762x39_AMD63_M"], 
	["CUP_arifle_AKM_Early", "rhs_30Rnd_762x39mm"], 
	["CUP_arifle_AKMS_Early", "rhs_75Rnd_762x39mm_tracer"], 
	["CUP_arifle_AK47_Early", "CUP_30Rnd_762x39_AK47_TK_M"], 
	["CUP_arifle_AKM_Early", "rhs_30Rnd_762x39mm_polymer_tracer"], 
	["CUP_arifle_AK47_Early", "CUP_40Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M"]
	] call bis_fnc_selectrandom;
	
	_vest = ["rhsgref_chestrig", 
	"twc_lightcarrier_oli",
	"CUP_V_B_ALICE",
	"CUP_V_OI_TKI_Jacket1_01",
	"CUP_V_OI_TKI_Jacket1_02",
	"CUP_V_OI_TKI_Jacket1_03",
	"CUP_V_OI_TKI_Jacket1_04",
	"CUP_V_OI_TKI_Jacket1_05",
	"CUP_V_OI_TKI_Jacket1_06",
	"CUP_V_OI_TKI_Jacket2_01",
	"CUP_V_OI_TKI_Jacket2_02",
	"CUP_V_OI_TKI_Jacket2_03",
	"CUP_V_OI_TKI_Jacket2_04",
	"CUP_V_OI_TKI_Jacket2_05",
	"CUP_V_OI_TKI_Jacket2_06",
	"CUP_V_OI_TKI_Jacket5_01",
	"CUP_V_OI_TKI_Jacket5_02",
	"CUP_V_OI_TKI_Jacket5_03",
	"CUP_V_OI_TKI_Jacket5_04",
	"CUP_V_OI_TKI_Jacket5_05",
	"CUP_V_OI_TKI_Jacket5_06",
	"CUP_V_OI_TKI_Jacket3_02",
	"CUP_V_OI_TKI_Jacket3_03",
	"CUP_V_OI_TKI_Jacket3_04",
	"CUP_V_OI_TKI_Jacket3_05",
	"CUP_V_OI_TKI_Jacket3_06"
	] call bis_fnc_selectrandom;

	params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_unit forceAddUniform _uniform;
	
	_unit addItemToUniform "ACRE_PRC152";
	[] spawn {sleep 1;_radioID = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
	_channelNumber = missionnamespace getvariable ["twc_enemychannel", 2]; 
	_switchChannel = [_radioID, _channelNumber] call acre_api_fnc_setRadioChannel;};
	
	for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	_unit addVest _vest;
	
	for "_i" from 1 to 7 do {_unit addItemToVest (_wep select 1);};
	_unit addbackpack "rhs_rpg_empty";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_PG7VL_mag";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_OG7V_mag";};
	_unit addWeapon (_wep select 0);
	_unit addItemToVest (_wep select 1);
	
	
	_unit addWeapon "rhs_weap_rpg7";
	

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemGPS";
	_unit linkItem "ItemWatch";
	_me = player;
	[_me, (["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]call bis_fnc_selectrandom)] remoteExec ["setFace", 0, _me];
};


twc_loadout_insurgent_medic = {

	_timer = player getvariable ["twc_lastloadoutswitch", -999];
	if (_timer > (time - 300)) exitwith {
		hint "its been less than 5 minutes since your last loadout switch";
	};
	player setvariable ["twc_lastloadoutswitch", time];
	
	
	_prev = player getvariable ["twc_enemyrole", "rifleman"];
	[_prev] spawn twc_removeoldenemyrole;
	player setvariable ["twc_enemyrole", "medic"];
	
	_arr = missionnamespace getvariable ["twc_enemyplayerroles", []];
	_arr pushback "medic";
	missionnamespace setvariable ["twc_enemyplayerroles", _arr, true];
	
	_uniform = ["CUP_O_TKI_Khet_Partug_01","CUP_O_TKI_Khet_Partug_02","CUP_O_TKI_Khet_Partug_03","CUP_O_TKI_Khet_Partug_04","CUP_O_TKI_Khet_Partug_05","CUP_O_TKI_Khet_Partug_06","CUP_O_TKI_Khet_Partug_07","CUP_O_TKI_Khet_Partug_08"] call bis_fnc_selectrandom;
	
	
	_wep = [["CUP_arifle_AK47_Early", "rhs_75Rnd_762x39mm_tracer"], 
	["CUP_arifle_AK47_Early", "rhs_30Rnd_762x39mm"], 
	["CUP_arifle_AK47_Early", "CUP_20Rnd_762x39_AMD63_M"], 
	["CUP_arifle_AKM_Early", "rhs_30Rnd_762x39mm"], 
	["CUP_arifle_AKMS_Early", "rhs_75Rnd_762x39mm_tracer"], 
	["CUP_arifle_AK47_Early", "CUP_30Rnd_762x39_AK47_TK_M"], 
	["CUP_arifle_AKM_Early", "rhs_30Rnd_762x39mm_polymer_tracer"], 
	["CUP_arifle_AK47_Early", "CUP_40Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M"]
	] call bis_fnc_selectrandom;
	
	_vest = ["rhsgref_chestrig", 
	"twc_lightcarrier_oli",
	"CUP_V_B_ALICE",
	"CUP_V_OI_TKI_Jacket1_01",
	"CUP_V_OI_TKI_Jacket1_02",
	"CUP_V_OI_TKI_Jacket1_03",
	"CUP_V_OI_TKI_Jacket1_04",
	"CUP_V_OI_TKI_Jacket1_05",
	"CUP_V_OI_TKI_Jacket1_06",
	"CUP_V_OI_TKI_Jacket2_01",
	"CUP_V_OI_TKI_Jacket2_02",
	"CUP_V_OI_TKI_Jacket2_03",
	"CUP_V_OI_TKI_Jacket2_04",
	"CUP_V_OI_TKI_Jacket2_05",
	"CUP_V_OI_TKI_Jacket2_06",
	"CUP_V_OI_TKI_Jacket5_01",
	"CUP_V_OI_TKI_Jacket5_02",
	"CUP_V_OI_TKI_Jacket5_03",
	"CUP_V_OI_TKI_Jacket5_04",
	"CUP_V_OI_TKI_Jacket5_05",
	"CUP_V_OI_TKI_Jacket5_06",
	"CUP_V_OI_TKI_Jacket3_02",
	"CUP_V_OI_TKI_Jacket3_03",
	"CUP_V_OI_TKI_Jacket3_04",
	"CUP_V_OI_TKI_Jacket3_05",
	"CUP_V_OI_TKI_Jacket3_06"
	] call bis_fnc_selectrandom;

	params ["_unit"];

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_unit forceAddUniform _uniform;
	
	_unit addItemToUniform "ACRE_PRC152";
	[] spawn {sleep 1;_radioID = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;
	_channelNumber = missionnamespace getvariable ["twc_enemychannel", 2]; 
	_switchChannel = [_radioID, _channelNumber] call acre_api_fnc_setRadioChannel;};
	
	for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
	_unit addItemToUniform "ACE_EarPlugs";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_morphine";
	_unit addItemToUniform "ACE_epinephrine";
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_morphine";};
	for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_epinephrine";};
	for "_i" from 1 to 20 do {
		_unit addItemToUniform "ACE_packingBandage";
		_unit addItemToUniform "ACE_fieldDressing";
		_unit addItemToUniform "ACE_fieldDressing";
	};
	_unit addVest _vest;
	
	for "_i" from 1 to 10 do {_unit addItemToVest (_wep select 1);};
	for "_i" from 1 to 20 do {
		_unit addItemToVest "ACE_packingBandage";
		_unit addItemToVest "ACE_fieldDressing";
		_unit addItemToVest "ACE_fieldDressing";
	};
	_unit addWeapon (_wep select 0);
	_unit addItemToVest (_wep select 1);
	
	

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemGPS";
	_unit linkItem "ItemWatch";
	_me = player;
	[_me, (["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]call bis_fnc_selectrandom)] remoteExec ["setFace", 0, _me];
};
