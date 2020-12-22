//if (!hasinterface) exitwith {};
{

	_isterp = _x getvariable ["twc_isterp",0];
	if (_isterp == 0) then {
		if (["interpreter", typeof _x] call BIS_fnc_inString) then { 
			_x setvariable ["twc_isterp",1,true];
		}; 
	};
	 
	 
	[{
	params ["_unit"];
	_terpradio = ["ACRE_PRC152"] call acre_api_fnc_getRadioByType;   
	 if (isnil "_terpradio") exitwith {}; 
	_terpChannel = [_terpradio] call acre_api_fnc_getRadioChannel; 

	player setvariable ["twc_terpchannel",_terpChannel,true];

	
	}] remoteExec ["bis_fnc_call", _x];
	 
} forEach allplayers; 


 
