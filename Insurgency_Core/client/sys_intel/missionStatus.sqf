_base = missionnamespace getvariable ["twc_basepos", [0,0,0]];

_pilotactive = 0;

_playersinbase = 0;

_opforamount = 0;


{
	if ((side _x) == west) then {
		if ((["helipilot", typeof _x] call BIS_fnc_inString) || (["crewchief", typeof _x] call BIS_fnc_inString)) then {
			_pilotactive = _pilotactive + 1;
		};
		if (((_x distance _base) < 300) && (_x != player)) then {
			_playersinbase = _playersinbase + 1;
		};
		
	} else {
		_opforamount = _opforamount +1;
	};
} foreach allplayers;


_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>MISSION STATUS</t><br /><br />"; 

_text1 = format["Completion %1 / %2<br /><br />",totalPoints, pointLimit];

_text2 = "";
_text3 = "";

if ((count allplayers) == 1) then {
	_text2 = "You are currently the only player on the server<br />";
} else {
	_text2 = format ["There are %1 other players on the server<br />", (count allplayers) - 1];
	
	if (_playersinbase > 1) then {
		_text3 = format ["%1 of them are in base<br />", _playersinbase];
	};
	if (_playersinbase == 1) then {
		_text3 = "One of them is in base<br />";
	};
	if (_playersinbase == 0) then {
		_text3 = "None of them are in base<br />";
	};
};

_text4 = "";
if ((_opforamount) == 0) then {
	_text4 = "There are no player insurgents active<br /><br />";
} else {
	_text4 = format ["There are %1 player insurgents active<br /><br />", (count allplayers) - 1];
};


_text5 = "";

if ((_pilotactive) == 0) then {
	_text5 = "There are no heli pilots active";
};

if ((_pilotactive) == 1) then {
	_text5 = "A heli pilot is active";
};

if ((_pilotactive) > 1) then {
	_text5 = "A heli crew is active";
};


_finaltext = parsetext (_title + _text1 + _text2 + _text3 + _text4 + _text5);
hint _finaltext;
