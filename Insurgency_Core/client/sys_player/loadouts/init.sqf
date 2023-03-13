#include "bluforloadouts.sqf";

twc_fnc_getradiotype = compile preprocessfilelinenumbers "Insurgency_Core\client\sys_player\loadouts\fn_getradiotype.sqf";


if((typeOf player) in ["Modern_British_Sniper_coin", "Modern_British_Spotter_coin"])then{

	_ammoaction = ["teamswitch","Switch Team","",{},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_ammoaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_snaction1 = ["Spawnsnipbox","SAS","",{call twc_loadout_snipergroup_uksf},{((((group player) getvariable ["twc_groupcountry", "baf"])) != "uksf")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "teamswitch"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_snaction1 = ["Spawnsnipbox","USMC FORECON","",{call twc_loadout_snipergroup_usmc},{((((group player) getvariable ["twc_groupcountry", "baf"])) != "usmc")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "teamswitch"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_snaction1 = ["Spawnsnipbox","US Army","",{call twc_loadout_snipergroup_us},{((((group player) getvariable ["twc_groupcountry", "baf"])) != "usarmysniper")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "teamswitch"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_snaction1 = ["Spawnsnipbox","Rangers","",{call twc_loadout_snipergroup_cag},{((((group player) getvariable ["twc_groupcountry", "baf"])) != "rangersniper")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "teamswitch"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_snaction1 = ["Spawnsnipbox","BAF","",{call twc_loadout_snipergroup_baf},{((((group player) getvariable ["twc_groupcountry", "baf"])) != "baf")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "teamswitch"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	_snaction1 = ["Spawnsnipbox","What's this?","",{["sniper"] execvm "Insurgency_Core\client\sys_player\loadouts\teaminfo.sqf";},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "teamswitch"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
};

if((typeOf player) in ["Modern_British_FSTCommander"])then{

	_ammoaction = ["teamswitch","Switch Team","",{},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_ammoaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_snaction1 = ["Spawnsnipbox","US","",{call twc_loadout_fstgroup_us},{((((group player) getvariable ["twc_groupcountry", "baf"])) != "us")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "teamswitch"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_snaction1 = ["Spawnsnipbox","BAF","",{call twc_loadout_fstgroup_baf},{((((group player) getvariable ["twc_groupcountry", "baf"])) != "baf")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "teamswitch"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
};

if((typeOf player) in ["Modern_British_FAC", "Modern_British_JetPilot"])then{

	_ammoaction = ["teamswitch","Switch Team","",{},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_ammoaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_snaction1 = ["Spawnsnipbox","USAF","",{call twc_loadout_facgroup_us},{((((group player) getvariable ["twc_groupcountry", "baf"])) != "usaf")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "teamswitch"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_snaction1 = ["Spawnsnipbox","USASOC","",{call twc_loadout_facgroup_usasoc},{(((((group player) getvariable ["twc_groupcountry", "baf"])) != "usasoc") && ((missionnamespace getvariable ["twc_iscagactive", 0]) > 0))}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "teamswitch"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_snaction1 = ["Spawnsnipbox","BAF","",{call twc_loadout_facgroup_baf},{((((group player) getvariable ["twc_groupcountry", "baf"])) != "baf")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "teamswitch"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_snaction1 = ["Spawnsnipbox","ANAF","",{call twc_loadout_facgroup_ana},{((((group player) getvariable ["twc_groupcountry", "baf"])) != "ana")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "teamswitch"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
};

if((typeOf player) in ["Modern_British_HeliPilot","Modern_British_crewchief"])then{

	_ammoaction = ["teamswitch","Switch Team","",{},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_ammoaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_snaction1 = ["Spawnsnipbox","US","",{call twc_loadout_pilotgroup_us},{((((group player) getvariable ["twc_groupcountry", "baf"])) != "us")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "teamswitch"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_snaction1 = ["Spawnsnipbox","160th SOAR","",{call twc_loadout_pilotgroup_cag},{(((((group player) getvariable ["twc_groupcountry", "baf"])) != "soar") && ((missionnamespace getvariable ["twc_iscagactive", 0]) > 0))}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "teamswitch"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_snaction1 = ["Spawnsnipbox","BAF","",{call twc_loadout_pilotgroup_baf},{((((group player) getvariable ["twc_groupcountry", "baf"])) != "baf")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "teamswitch"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
};

if((typeOf player) in ["Modern_UKSF_Squadleader"])then{

	_ammoaction = ["teamswitch","Switch Team","",{},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_ammoaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_snaction1 = ["Spawnsnipbox","Rangers","",{call twc_loadout_sfgroup_cag;},{((((group player) getvariable ["twc_groupcountry", "baf"])) != "ussf")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "teamswitch"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_snaction1 = ["Spawnsnipbox","SEALS","",{call twc_loadout_sfgroup_st6},{((((group player) getvariable ["twc_groupcountry", "baf"])) != "st6")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "teamswitch"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_snaction1 = ["Spawnsnipbox","ACE","",{call twc_loadout_sfgroup_ace},{((((group player) getvariable ["twc_groupcountry", "baf"])) != "ace")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "teamswitch"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_snaction1 = ["Spawnsnipbox","ANA","",{call twc_loadout_sfgroup_ana},{(((((group player) getvariable ["twc_groupcountry", "baf"])) != "ana") && ((missionnamespace getvariable ["twc_wdveh",0]) == 0))}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "teamswitch"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_snaction1 = ["Spawnsnipbox","SAS","",{call twc_loadout_sfgroup_baf},{((((group player) getvariable ["twc_groupcountry", "baf"])) != "baf")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "teamswitch"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_snaction1 = ["Spawnsnipbox","2 REI","",{call twc_loadout_sfgroup_1erre},{((((group player) getvariable ["twc_groupcountry", "baf"])) != "1erre")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "teamswitch"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_snaction1 = ["Spawnsnipbox","What's this?","",{execvm "Insurgency_Core\client\sys_player\loadouts\teaminfo.sqf";},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "teamswitch"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
};

twc_loadout_isgroupnearby = {
	_check = true;
	{
		if ((_x distance player) > 40) then {_check = false};
	} foreach (units group player);
	if (!_check) then {
	
		_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Team Switch</t>"; 

		 _text1 = "<br />All members of the group need to be nearby to switch team";
		hint parsetext (_title + _text1);
	};
	_check;
};

twc_loadout_canswitch = {
	
	_check = true;
	
	if (isserver) exitwith {_check};
	
	{
		if ((alive _x) && ((_x distance player) > 20)) then {_check = false};
	} foreach (units group player);
	
	if (!_check) then {
	
		_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Team Switch</t>"; 

		 _text1 = "<br />All members of the group need to be nearby to switch team";
		hint parsetext (_title + _text1);
	};
	
	
	_check2 = true;
	
	_timer = group player getvariable ["twc_canswitchloadout", -9999];
	
	if (_timer > (time - 600)) then {_check2 = false};
	
	if (!_check2) then {
		_check = false;
		_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Team Switch</t>"; 

		 _text1 = "<br />You can only switch teams once every 10 minutes.";
		hint parsetext (_title + _text1);
	} else {
		group player setvariable ["twc_magazinearray", [], true];
	};
	if (_check) then {
		group player setvariable ["twc_canswitchloadout", time];
	};
	_check;
};
twc_snowflakeunits = ["ussf", "st6", "ace", "rangersniper"];


	twc_loadout_generic_switch = {
		params ["_team"];
		_role = player getvariable ["twc_loadoutrole", "rifleman"];
		_var = missionnamespace getvariable [("twc_loadout_" + _team + "_" + _role), []];
		
		_var call twc_loadout_switchloadout;
		[player] call twc_fnc_buildmagarray_set;
		[player] call twc_fnc_buildmagarray;
	};


twc_loadout_sfgroup_cag = {

	_teamstring = "ussf";

	_check = call twc_loadout_canswitch;
	if (!_check) exitwith {};
	
	
	_last = (group player) getvariable ["twc_groupcountry", "baf"];
	if (!(_last in twc_snowflakeunits)) then {
		_iscag = missionnamespace getvariable ["twc_iscagactive", 0];
		missionnamespace setvariable ["twc_iscagactive", _iscag + 1,true];
	};
	
	if ((_last == "ana")) then {
		{
			_unit = _x;
			_face = face _unit;
			
			_lastface = _unit getvariable ["twc_origface", _face];
			
			[_unit, _lastface] remoteExec ["setFace", 0, _unit];
		} foreach (units group player);
	};
	
	(group player) setvariable ["twc_groupcountry", "ussf", true];
	
	{[_teamstring] remoteexec ["twc_loadout_generic_switch", _x]} foreach (units group player);
};

twc_loadout_sfgroup_st6 = {

	_teamstring = "st6";
	_check = call twc_loadout_canswitch;
	if (!_check) exitwith {};
	
	
	_last = (group player) getvariable ["twc_groupcountry", "baf"];
	if (!(_last in twc_snowflakeunits)) then {
		_iscag = missionnamespace getvariable ["twc_iscagactive", 0];
		missionnamespace setvariable ["twc_iscagactive", _iscag + 1, true];
	};
	
	if ((_last == "ana")) then {
		{
			_unit = _x;
			_face = face _unit;
			
			_lastface = _unit getvariable ["twc_origface", _face];
			
			[_unit, _lastface] remoteExec ["setFace", 0, _unit];
		} foreach (units group player);
	};
	
	(group player) setvariable ["twc_groupcountry", _teamstring, true];
	{[_teamstring] remoteexec ["twc_loadout_generic_switch", _x]} foreach (units group player);
};

twc_loadout_sfgroup_ace = {

	_teamstring = "ace";
	_check = call twc_loadout_canswitch;
	if (!_check) exitwith {};
	
	
	_last = (group player) getvariable ["twc_groupcountry", "baf"];
	if (!(_last in twc_snowflakeunits)) then {
		_iscag = missionnamespace getvariable ["twc_iscagactive", 0];
		missionnamespace setvariable ["twc_iscagactive", _iscag + 1, true];
	};
	
	if ((_last == "ana")) then {
		{
			_unit = _x;
			_face = face _unit;
			
			_lastface = _unit getvariable ["twc_origface", _face];
			
			[_unit, _lastface] remoteExec ["setFace", 0, _unit];
		} foreach (units group player);
	};
	
	(group player) setvariable ["twc_groupcountry", "ace", true];
	{[_teamstring] remoteexec ["twc_loadout_generic_switch", _x]} foreach (units group player);
};

twc_loadout_sfgroup_baf = {

	_teamstring = "baf";
	_check = call twc_loadout_canswitch;
	if (!_check) exitwith {};
	_last = (group player) getvariable ["twc_groupcountry", _teamstring];
	if ((_last in twc_snowflakeunits)) then {
		_iscag = missionnamespace getvariable ["twc_iscagactive", 0];
		missionnamespace setvariable ["twc_iscagactive", _iscag - 1, true];
	};
	
	if ((_last == "ana")) then {
		{
			_unit = _x;
			_face = face _unit;
			
			_lastface = _unit getvariable ["twc_origface", _face];
			
			[_unit, _lastface] remoteExec ["setFace", 0, _unit];
		} foreach (units group player);
	};
	
	(group player) setvariable ["twc_groupcountry", _teamstring, true];
	
	
	{[_teamstring] remoteexec ["twc_loadout_generic_switch", _x]} foreach (units group player);
};

twc_loadout_sfgroup_1erre = {

	_teamstring = "1erre";
	_check = call twc_loadout_canswitch;
	if (!_check) exitwith {};
	_last = (group player) getvariable ["twc_groupcountry", "baf"];
	if ((_last in twc_snowflakeunits)) then {
		_iscag = missionnamespace getvariable ["twc_iscagactive", 0];
		missionnamespace setvariable ["twc_iscagactive", _iscag - 1, true];
	};
	
	if ((_last == "ana")) then {
		{
			_unit = _x;
			_face = face _unit;
			
			_lastface = _unit getvariable ["twc_origface", _face];
			
			[_unit, _lastface] remoteExec ["setFace", 0, _unit];
		} foreach (units group player);
	};
	
	(group player) setvariable ["twc_groupcountry", "1erre", true];
	
	
	{[_teamstring] remoteexec ["twc_loadout_generic_switch", _x]} foreach (units group player);
};

twc_loadout_sfgroup_ana = {

	_teamstring = "ana";
	
	_check = call twc_loadout_canswitch;
	if (!_check) exitwith {};
	_last = (group player) getvariable ["twc_groupcountry", "ana"];
	if ((_last in twc_snowflakeunits)) then {
		_iscag = missionnamespace getvariable ["twc_iscagactive", 0];
		missionnamespace setvariable ["twc_iscagactive", _iscag - 1, true];
	};
	
	_unit = player;
	_face = face _unit;
	
	_unit setvariable ["twc_origface", _face];
	
	[_unit, ["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]call bis_fnc_selectrandom] remoteExec ["setFace", 0, _unit];
	
	(group player) setvariable ["twc_groupcountry", "ana", true];
	
	
	{[_teamstring] remoteexec ["twc_loadout_generic_switch", _x]} foreach (units group player);
};

	twc_loadout_pilotgroup_us = {

	_teamstring = "usaf";
	_check = call twc_loadout_canswitch;
	if (!_check) exitwith {};
	
	(group player) setvariable ["twc_groupcountry", "us", true];
	
	{[_teamstring] remoteexec ["twc_loadout_generic_switch", _x]} foreach (units group player);
};

	twc_loadout_pilotgroup_baf = {

	_teamstring = "baf";
	_check = call twc_loadout_canswitch;
	if (!_check) exitwith {};
	
	(group player) setvariable ["twc_groupcountry", "baf", true];
	
	{[_teamstring] remoteexec ["twc_loadout_generic_switch", _x]} foreach (units group player);
};
	twc_loadout_pilotgroup_cag = {

	_teamstring = "soar";
	_check = call twc_loadout_canswitch;
	if (!_check) exitwith {};
	
	(group player) setvariable ["twc_groupcountry", "soar", true];
	
	{[_teamstring] remoteexec ["twc_loadout_generic_switch", _x]} foreach (units group player);
};
twc_loadout_fstgroup_us = {

	_teamstring = "us";
	_check = call twc_loadout_canswitch;
	if (!_check) exitwith {};
	
	(group player) setvariable ["twc_groupcountry", _teamstring, true];
	
	{[_teamstring] remoteexec ["twc_loadout_generic_switch", _x]} foreach (units group player);
};

twc_loadout_fstgroup_baf = {

	_teamstring = "baf";
	_check = call twc_loadout_canswitch;
	if (!_check) exitwith {};
	
	(group player) setvariable ["twc_groupcountry", _teamstring, true];
	
	{[_teamstring] remoteexec ["twc_loadout_generic_switch", _x]} foreach (units group player);
};

twc_loadout_facgroup_us = {

	_teamstring = "usaf";
	_check = call twc_loadout_canswitch;
	if (!_check) exitwith {};
	
	
	_last = (group player) getvariable ["twc_groupcountry", _teamstring];
	if ((_last == "ana")) then {
		{
			_unit = _x;
			_face = face _unit;
			
			_lastface = _unit getvariable ["twc_origface", _face];
			
			[_unit, _lastface] remoteExec ["setFace", 0, _unit];
		} foreach (units group player);
	};
	
	
	
	
	(group player) setvariable ["twc_groupcountry", _teamstring, true];
	
	{[_teamstring] remoteexec ["twc_loadout_generic_switch", _x]} foreach (units group player);
};

twc_loadout_facgroup_usasoc = {

	_teamstring = "usasoc";
	_check = call twc_loadout_canswitch;
	if (!_check) exitwith {};
	
	
	_last = (group player) getvariable ["twc_groupcountry", _teamstring];
	if ((_last == "ana")) then {
		{
			_unit = _x;
			_face = face _unit;
			
			_lastface = _unit getvariable ["twc_origface", _face];
			
			[_unit, _lastface] remoteExec ["setFace", 0, _unit];
		} foreach (units group player);
	};
	
	
	
	
	(group player) setvariable ["twc_groupcountry", _teamstring, true];
	
	{[_teamstring] remoteexec ["twc_loadout_generic_switch", _x]} foreach (units group player);
};

twc_loadout_facgroup_baf = {

	_teamstring = "baf";
	
	_check = call twc_loadout_canswitch;
	if (!_check) exitwith {};
	
	
	
	_last = (group player) getvariable ["twc_groupcountry", _teamstring];
	if ((_last == "ana")) then {
		{
			_unit = _x;
			_face = face _unit;
			
			_lastface = _unit getvariable ["twc_origface", _face];
			
			[_unit, _lastface] remoteExec ["setFace", 0, _unit];
		} foreach (units group player);
	};
	
	
	(group player) setvariable ["twc_groupcountry", _teamstring, true];
	
	{[_teamstring] remoteexec ["twc_loadout_generic_switch", _x]} foreach (units group player);
};

twc_loadout_facgroup_ana = {

	_teamstring = "ana";
	
	_check = call twc_loadout_canswitch;
	if (!_check) exitwith {};
	
	_unit = player;
	_face = face _unit;
	
	_unit setvariable ["twc_origface", _face];
	
	[_unit, ["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]call bis_fnc_selectrandom] remoteExec ["setFace", 0, _unit];
	
	(group player) setvariable ["twc_groupcountry", _teamstring, true];
	
	{
		[_teamstring] remoteexec ["twc_loadout_generic_switch", _x];
		"Notice: The Super Tucano can be crewed by both players or just the pilot" remoteexec ["hint", _x];
		
	} foreach (units group player);
};

twc_loadout_snipergroup_us = {

	_teamstring = "usarmysniper";

	_check = call twc_loadout_canswitch;
	if (!_check) exitwith {};
	
	_last = (group player) getvariable ["twc_groupcountry", "baf"];
	(group player) setvariable ["twc_groupcountry", "usarmysniper", true];
	
	if (!(_last in twc_snowflakeunits)) then {
		_iscag = missionnamespace getvariable ["twc_iscagactive", 0];
		missionnamespace setvariable ["twc_iscagactive", _iscag - 1, true];
	};
	{[_teamstring] remoteexec ["twc_loadout_generic_switch", _x]} foreach (units group player);
};



twc_loadout_snipergroup_usmc = {

	_teamstring = "usmcsniper";
	
	_check = call twc_loadout_canswitch;
	if (!_check) exitwith {};
	
	_last = (group player) getvariable ["twc_groupcountry", "baf"];
	(group player) setvariable ["twc_groupcountry", "usmcsniper", true];
	
	if (!(_last in twc_snowflakeunits)) then {
		_iscag = missionnamespace getvariable ["twc_iscagactive", 0];
		missionnamespace setvariable ["twc_iscagactive", _iscag - 1, true];
	};

	{[_teamstring] remoteexec ["twc_loadout_generic_switch", _x]} foreach (units group player);
};


twc_loadout_snipergroup_baf = {

	_teamstring = "baf";
	
	_check = call twc_loadout_canswitch;
	if (!_check) exitwith {};
	
	_last = (group player) getvariable ["twc_groupcountry", "baf"];
	(group player) setvariable ["twc_groupcountry", _teamstring, true];
	
	if (!(_last in twc_snowflakeunits)) then {
		_iscag = missionnamespace getvariable ["twc_iscagactive", 0];
		missionnamespace setvariable ["twc_iscagactive", _iscag - 1, true];
	};

	{[_teamstring] remoteexec ["twc_loadout_generic_switch", _x]} foreach (units group player);
};


twc_loadout_snipergroup_uksf = {

	_teamstring = "uksfsniper";
	
	_check = call twc_loadout_canswitch;
	if (!_check) exitwith {};
	
	_last = (group player) getvariable ["twc_groupcountry", "baf"];
	(group player) setvariable ["twc_groupcountry", "uksf", true];
	
	if (!(_last in twc_snowflakeunits)) then {
		_iscag = missionnamespace getvariable ["twc_iscagactive", 0];
		missionnamespace setvariable ["twc_iscagactive", _iscag - 1, true];
	};

	{[_teamstring] remoteexec ["twc_loadout_generic_switch", _x]} foreach (units group player);
};


twc_loadout_snipergroup_cag = {

	_teamstring = "rangersniper";
	
	_check = call twc_loadout_canswitch;
	if (!_check) exitwith {};
	
	_last = (group player) getvariable ["twc_groupcountry", "baf"];
	(group player) setvariable ["twc_groupcountry", "rangersniper", true];
	
	_iscag = missionnamespace getvariable ["twc_iscagactive", 0];
	missionnamespace setvariable ["twc_iscagactive", _iscag + 1, true];
	

	{[_teamstring] remoteexec ["twc_loadout_generic_switch", _x]} foreach (units group player);
};

#include "fst.sqf";
