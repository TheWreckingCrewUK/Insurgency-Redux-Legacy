
//_list = ["pilot", "_fac", "crew", "vehicle", "vehc", "1970"];
_list = ["pilot", "_fac", "1970"];

_needsradio = true;
{
	if ([_x, typeof player] call BIS_fnc_inString) then {
		_needsradio = false;
	};
} foreach _list;

/*
_list = ["crew", "vehicle", "vehc"];

{
	if (([_x, typeof player] call BIS_fnc_inString) && (["infantry", (str (group player))] call BIS_fnc_inString)) then {
		_needsradio = true;
		if (isserver) then {
			systemchat "setradio mechception";
		};
	};
} foreach _list;
*/
if (!_needsradio) exitwith {};


	_radiolist = [];
	{
		if (["acre", _x] call BIS_fnc_inString) then {_radiolist pushback _x};
	} foreach ((uniformitems player) + (vestitems player));
	
	if ((count _radiolist) == 0) exitwith {};
	_radio = "";
	
	{
		if (["152", _x] call BIS_fnc_inString) then {_radio = _x;};
	} foreach _radiolist;
	
	{
		if (["148", _x] call BIS_fnc_inString) then {_radio = _x;};
	} foreach _radiolist;
	
	{
		if (["343", _x] call BIS_fnc_inString) then {_radio = _x;};
	} foreach _radiolist;
	
	if (_radio == "") exitwith {};
	
	_channelNumber = (group player) getvariable ["twc_groupradchannel", -1];
	if (_channelnumber == -1) then {
		_channelNumber = (ceil (random 15)) + 1;
		(group player) setvariable ["twc_groupradchannel", _channelNumber, true];
	};
	//_radioID = [_radio] call acre_api_fnc_getRadioByType; 
	_radioID = _radio;
	_switchChannel = [_radioID, _channelNumber] call acre_api_fnc_setRadioChannel; 
	Hint parseText format ["<t color='#d0dd00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Radio Set</t><br/><t color='#d0dd00' size='0.8' shadow='1' shadowColor='#565656' align='left'>Radio:</t><t color='##013bb6' size='0.8' shadow='1' shadowColor='#565656' align='right'>%1</t><br/><t color='#d0dd00' size='0.8' shadow='1' shadowColor='#565656' align='left'>Channel:</t><t color='##013bb6' size='0.8' shadow='1' shadowColor='#565656' align='right'>%2</t>",_radioID,_channelNumber];
	