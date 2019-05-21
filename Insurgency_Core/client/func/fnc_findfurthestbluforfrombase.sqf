/*
_time = player getvariable ["twc_lastbluintel", -999];
if ((_time > (time - 60)) && (!([player] call TWC_Core_fnc_ismanagement))) exitwith {
	_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>COALITION FORCES INTEL</t>"; 

	_text1 = "<br />Its been less than a minute since your last check, there is no new information available";
	
	_finaltext = parsetext (_title + _text1);
	hint _finaltext;
};
player setvariable ["twc_lastbluintel", time];
*/

if ((count allplayers == 1) && (!isserver)) exitwith {
	hint "You are the only player on the server";
};

_val = 0;
_return = player;
_alt = 0;
_speed = 0;
_dir = 0;
_heading = 0;

_base = missionnamespace getvariable ["twc_basepos", [0,0,0]];
_basecount = 0;

{
	if (((_x distance [0,0,0]) > 50) && ((_x distance player) > 30) && ((side _x) == west) && (alive _x) && ((_base distance _x) > _val) && ((_base distance _x) > 300)) then {
		_return = _x;
	};
	
	if (((side _x) == west) && (alive _x) && ((_base distance _x) < 300)) then {
		_basecount = _basecount + 1;
	};
} foreach allplayers;

if ((_return == player) && (count allplayers > 1) && (_basecount > 0)) exitwith {
	hint "There doesnt seem to be any other BLUFOR forces outside base";
};

//_return = t1;


_val = player distance _return;
_speed = speed vehicle _return;
_alt = (getposatl _return) select 2;
_dir = player getdir _return;
_heading = getdir _return;

_textdir = "north";

if ((_dir > 30) && (_dir <60)) then {
	_textdir = "northeast";
};

if ((_dir > 60) && (_dir <120)) then {
	_textdir = "east";
};

if ((_dir > 120) && (_dir <150)) then {
	_textdir = "southeast";
};

if ((_dir > 150) && (_dir <210)) then {
	_textdir = "south";
};

if ((_dir > 210) && (_dir <240)) then {
	_textdir = "southwest";
};

if ((_dir > 240) && (_dir <300)) then {
	_textdir = "west";
};

if ((_dir > 300) && (_dir <330)) then {
	_textdir = "northwest";
};

if ((_dir > 330) && (_dir <370)) then {
	_textdir = "north";
};

_textheading = "north";

if ((_heading > 30) && (_heading <60)) then {
	_textheading = "northeast";
};

if ((_heading > 60) && (_heading <120)) then {
	_textheading = "east";
};

if ((_heading > 120) && (_heading <150)) then {
	_textheading = "southeast";
};

if ((_heading > 150) && (_heading <210)) then {
	_textheading = "south";
};

if ((_heading > 210) && (_heading <240)) then {
	_textheading = "southwest";
};

if ((_heading > 240) && (_heading <300)) then {
	_textheading = "west";
};

if ((_heading > 300) && (_heading <330)) then {
	_textheading = "northwest";
};

if ((_heading > 330) && (_heading <370)) then {
	_textheading = "north";
};

_textdis = ((((round (_val / 100))) * 100) + ((floor random 2) * 100) - 100);

_textdis1 = "about " + str _textdis;
if (_textdis < 100) then {
	_textdis1 = "less than 100";
};

_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>FRIENDLY FORCES INTEL</t>"; 

_text1 = format ["<br />The furthest BLUFOR unit from base is %1M to your bearing %2.<br /><br />", _textdis1, floor _dir];
_text2 = "";
if ((vehicle _return) != _return) then {
	if (_speed > 5) then {
		_text2 = format ["They are heading %1 very slowly in a vehicle<br />", _textheading];
		
		if (_speed > 20) then {
			_text2 = format ["They are heading %1 slowly in a vehicle<br />", _textheading];
		};
		if (_speed > 50) then {
			_text2 = format ["They are heading %1 quickly in a vehicle<br />", _textheading];
		};
		if (_speed > 80) then {
			_text2 = format ["They are heading %1 very quickly in a vehicle<br />", _textheading];
		};
		if ((vehicle _return) isKindOf "air") then {
			_text2 = format ["They are flying %1<br />", _textheading];
			if ((vehicle _return) isKindOf "helicopter") then {
				_text2 = format ["They are flying %1 in a helicopter<br />", _textheading];
			};
			if ((vehicle _return) isKindOf "plane") then {
				_text2 = format ["They are flying %1 in a plane<br />", _textheading];
			};
		};
	};
};
_returninbase = 0;
if ((_return distance _base) < 300) then {
	_text2 = "They are in base<br />";
	_returninbase = 1;
};

_text3 = "";


if (_basecount == 0) then {
	_text3 = "<br />There are no players in base";
};

if (_basecount == 1) then {
	_text3 = "<br />There is 1 player in base";
	if (_returninbase == 1) then {
		_text3 = "<br />They are the only player in base";
	};
};

if (_basecount > 1) then {
	_text3 = format ["<br />There are %1 players in base", _basecount];
	if (_returninbase == 1) then {
		_text3 = format ["<br />There are %1 other players in base", _basecount - 1];
		if ((_basecount - 1) == 0) then {
			_text3 = "<br />There are no other players in base";
		};
	};
};


_finaltext = parsetext (_title + _text1 + _text2 + _text3);
hint _finaltext;