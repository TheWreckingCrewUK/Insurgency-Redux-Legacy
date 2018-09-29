

if (["interpreter", typeof player] call BIS_fnc_inString) then {
	twc_terp = player;
	publicvariable "twc_terp";
	};
	
	//make the player middle eastern if they spawn as ANA. Sounds racist, but otherwise it looks dumb
_me = player;
if (faction player == "ana_units") then {
[_me, ["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]call bis_fnc_selectrandom] remoteExec ["setFace", 0, _me] 
};

_nobackpack = getNumber (configFile >> "cfgVehicles" >> (typeOf player) >> "twc_nobackpack");

if (!isnil "_nobackpack") then {

	if (_nobackpack == 1) then {
		player addEventHandler ["Take", {
			params ["_unit", "_container", "_item"];
			removebackpack player;
		}];
	};
};

//Set Radios Correctly
_radioID = [getText (configFile >> "cfgVehicles" >> (typeOf player) >> "twc_radioType")] call acre_api_fnc_getRadioByType; 
 if (!isNil "_radioID") then { 
_channelNumber = getNumber (configFile >> "cfgVehicles" >> (typeOf player) >> "twc_radioChannel"); 
 _switchChannel = [_radioID, _channelNumber] call acre_api_fnc_setRadioChannel; 
 Hint parseText format ["<t color='#d0dd00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Radio Set</t><br/><t color='#d0dd00' size='0.8' shadow='1' shadowColor='#565656' align='left'>Radio:</t><t color='##013bb6' size='0.8' shadow='1' shadowColor='#565656' align='right'>%1</t><br/><t color='#d0dd00' size='0.8' shadow='1' shadowColor='#565656' align='left'>Channel:</t><t color='##013bb6' size='0.8' shadow='1' shadowColor='#565656' align='right'>%2</t>",getText (configFile >> "cfgVehicles" >> (typeOf player) >> "twc_radioType"),_channelNumber]; 
 };

sleep 10;

if ((random 1)< twc_mortarchance) then {

["twc_event_remoteFireMortar", [getpos player], twc_mortar] call CBA_fnc_targetEvent;
};
	