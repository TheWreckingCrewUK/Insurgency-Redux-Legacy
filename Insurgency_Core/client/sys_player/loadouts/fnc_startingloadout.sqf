_role = typeof vehicle player;

_skip = (group player) getvariable ["twc_nopersistentloadout", false];

if (_skip) exitwith {};

_profile = profilenamespace getvariable ["twcpubloadout" + _role, []];

if ((count _profile) == 0) exitwith {
	//systemchat "no loadout found, writing . . .";
	player additemtouniform "ACE_Canteen";
	profilenamespace setvariable ["twcpubloadout" + _role, [uniformitems player, vestitems player, backpackitems player]];
	saveprofilenamespace;
};

_uniformradios = [];
_vestradios = [];
_backpackradios = [];

{
	if ("ACRE" in _x) then {
		_uniformradios pushback _x;
		//systemchat _x;
	};
} foreach uniformitems player;

{
	if ("ACRE" in _x) then {
		_vestradios pushback _x;
		//systemchat _x;
	};
} foreach vestitems player;

{
	if ("ACRE" in _x) then {
		_backpackradios pushback _x;
		//systemchat _x;
	};
} foreach backpackitems player;


{player removeitemfromuniform _x} foreach (uniformitems player);

if (!("ACE_EarPlugs" in (_profile select 0))) then {
	player additemtouniform "ACE_EarPlugs";
};

if (!("ACE_Canteen" in (_profile select 0))) then {
	player additemtouniform "ACE_Canteen";
};
player removeitem "ACE_Canteen_Empty";
player removeitem "ACE_Canteen_Half";

	
{
		player additemtouniform _x;

} foreach _uniformradios;

{
	
	if (!("ACRE" in _x)) then {
		player additemtouniform _x;
	};
} foreach (_profile select 0);

{player removeitemfromvest _x} foreach (vestitems player);

	
{
		player additemtovest _x;

} foreach _vestradios;
{
	if (!("ACRE" in _x)) then {
		player additemtovest _x;
	};
} foreach (_profile select 1);

{
	player removeitemfrombackpack _x;
} foreach (backpackitems player);

	
{
		player additemtobackpack _x;

} foreach _backpackradios;	
{
	
	if (!("ACRE" in _x)) then {
		player additemtobackpack _x;
	};
} foreach (_profile select 2);

//systemchat "loaded loadout";

_list = ["pilot", "_fac", "crew", "vehicle"];

_needsradio = true;
{
	if ([_x, typeof player] call BIS_fnc_inString) then {
		_needsradio = false;
	};
} foreach _list;

if (!_needsradio) exitwith {};

if (isText (configFile >> "cfgVehicles" >> (typeOf player) >> "twc_radioType")) then {

	//Set Radios Correctly
	_radioID = [getText (configFile >> "cfgVehicles" >> (typeOf player) >> "twc_radioType")] call acre_api_fnc_getRadioByType; 
	if (!isNil "_radioID") then {
		player setvariable ["twc_radio", getText (configFile >> "cfgVehicles" >> (typeOf player) >> "twc_radioType")];
		//_channelNumber = getNumber (configFile >> "cfgVehicles" >> (typeOf player) >> "twc_radioChannel"); 
		_channelNumber = (group player) getvariable ["twc_groupradchannel", -1];
		if (_channelnumber == -1) then {
			_channelNumber = (ceil (random 20)) + 1;
			(group player) setvariable ["twc_groupradchannel", _channelNumber, true];
		};
		_switchChannel = [_radioID, _channelNumber] call acre_api_fnc_setRadioChannel; 
		Hint parseText format ["<t color='#d0dd00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Radio Set</t><br/><t color='#d0dd00' size='0.8' shadow='1' shadowColor='#565656' align='left'>Radio:</t><t color='##013bb6' size='0.8' shadow='1' shadowColor='#565656' align='right'>%1</t><br/><t color='#d0dd00' size='0.8' shadow='1' shadowColor='#565656' align='left'>Channel:</t><t color='##013bb6' size='0.8' shadow='1' shadowColor='#565656' align='right'>%2</t>",getText (configFile >> "cfgVehicles" >> (typeOf player) >> "twc_radioType"),_channelNumber]; 
	};
} else {
	_radios = _uniformradios + _vestradios;
	_channelNumber = (group player) getvariable ["twc_groupradchannel", -1];
	if (_channelnumber == -1) then {
		_channelNumber = (ceil (random 20)) + 1;
		(group player) setvariable ["twc_groupradchannel", _channelNumber, true];
	};
	player setvariable ["twc_radio", (_radios select 0)];
	//_radioID = [(_radios select 0)] call acre_api_fnc_getRadioByType; 
	_radioID = (_radios select 0); 
	_switchChannel = [_radioID, _channelNumber] call acre_api_fnc_setRadioChannel; 
	Hint parseText format ["<t color='#d0dd00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Radio Set</t><br/><t color='#d0dd00' size='0.8' shadow='1' shadowColor='#565656' align='left'>Radio:</t><t color='##013bb6' size='0.8' shadow='1' shadowColor='#565656' align='right'>%1</t><br/><t color='#d0dd00' size='0.8' shadow='1' shadowColor='#565656' align='left'>Channel:</t><t color='##013bb6' size='0.8' shadow='1' shadowColor='#565656' align='right'>%2</t>",(_radios select 0),_channelNumber];
	 
};