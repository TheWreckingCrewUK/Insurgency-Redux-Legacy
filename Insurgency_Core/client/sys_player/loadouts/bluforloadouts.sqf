
//by hobbs
//example: twc_loadout_usaf_jtac call twc_loadout_switchloadout


twc_loadout_basicmedicitems = [["ACE_fieldDressing", 30], ["ACE_elasticBandage", 15], ["ACE_quikclot", 20], ["ACE_tourniquet", 8], ["ACE_morphine", 15], ["ACE_epinephrine", 10], ["ACE_salineIV_500", 15], ["ACE_salineIV_250", 15]];

twc_loadout_basicuniformitems = [["ACE_EarPlugs", 1], ["ACE_CableTie", 3], ["ACE_fieldDressing", 12], ["ACE_elasticBandage", 5], ["ACE_quikclot", 4], ["ACE_tourniquet", 2], ["ACE_morphine", 1], ["ACE_epinephrine", 1], ["ACE_Canteen", 1]];

twc_loadout_basiclinkeditems = ["ItemMap", "ItemCompass", "ItemWatch"];

waituntil {!isnil "twc_crateitems"};

#include "defines.sqf";
#include "pilots.sqf";
#include "sniper.sqf";
#include "sf.sqf";



twc_loadout_switchloadout = {
	params ["_uniform", "_uniformitems", "_helmet", "_vest", "_vestitems", "_backpack", "_backpackitems", "_nightkit", "_weapons", "_linkeditems", ["_crateweapons", []], ["_cratemags", []], ["_crateitems", []], ["_cratebackpacks", []]];
	
	(group player) setvariable ["twc_nopersistentloadout", true, true];
	
	_nightkit params ["_nightuniform", "_nightNVGs", "_nightitems", ["_nightweapons", []]];
	
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	
	
	_uniformradios = [];
	_vestradios = [];
	
	_suntime = date call BIS_fnc_sunriseSunsetTime;
	
	_isnighttime = ((daytime < ((_suntime select 0) - 0.8)) || (daytime > ((_suntime select 1) - 1)));
	
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
		if ("ACRE" in (_x select 0)) then {
			_uniformradios pushback (_x select 0);
		};
	} foreach _uniformitems;
	
	player addheadgear _helmet;
	
	player addvest _vest;
	
	player addbackpack _backpack;
	
	if (_isnighttime) then {
		{
			for "_i" from 1 to (_x select 1) do {
				player additem (_x select 0);
			};
		} foreach _nightitems;
	};
	
	{
		for "_i" from 1 to (_x select 1) do {
			player additemtovest (_x select 0);
		};
		if ("ACRE" in (_x select 0)) then {
			_vestradios pushback (_x select 0);
		};
	} foreach _vestitems;
	
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
	
	if (_isnighttime) then {
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
		} foreach _nightweapons;
	};
	group player setvariable ["twc_magazinearray", []];
	group player setvariable ["twc_itemarray", []];
	
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
	player allowsprint true;
	
	_radios = _uniformradios + _vestradios;
	[_radios] spawn {
		params ["_radios"];
		sleep (random 3);
		[player] call twc_fnc_buildmagarray;
			
			_list = ["pilot", "_fac", "crew", "vehicle", "1970"];
			
			_needsradio = true;
			{
				if ([_x, typeof player] call BIS_fnc_inString) then {
					_needsradio = false;
				};
			} foreach _list;
			
			if ((count _radios) == 0) then {
				_needsradio = false;
			};
			
			if (!_needsradio) exitwith {};
			
			_channelNumber = (group player) getvariable ["twc_groupradchannel", -1];
			if (_channelnumber == -1) then {
				_channelNumber = (floor (random 20));
				(group player) setvariable ["twc_groupradchannel", _channelNumber, true];
			};
			
			//_radioID = [(_radios select 0)] call acre_api_fnc_getRadioByType; 
			_radioID = [(_radios select 0)] call acre_api_fnc_getRadioByType; 
			
			player setvariable ["twc_radio", (_radios select 0)];
			_switchChannel = [_radioID, _channelNumber] call acre_api_fnc_setRadioChannel; 
			Hint parseText format ["<t color='#d0dd00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Radio Set</t><br/><t color='#d0dd00' size='0.8' shadow='1' shadowColor='#565656' align='left'>Radio:</t><t color='##013bb6' size='0.8' shadow='1' shadowColor='#565656' align='right'>%1</t><br/><t color='#d0dd00' size='0.8' shadow='1' shadowColor='#565656' align='left'>Channel:</t><t color='##013bb6' size='0.8' shadow='1' shadowColor='#565656' align='right'>%2</t>",(_radios select 0),_channelNumber];
			 
		
	};
	
};
