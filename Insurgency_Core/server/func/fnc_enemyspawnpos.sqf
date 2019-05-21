

_loc = [];
_name = "";
_amount = 2500;


while {(count _loc == 0) && (_amount < worldsize)} do {

	{
		if ((!([getpos _x, 2000, 1] call twc_fnc_isnearblufor)) && ([getpos _x, _amount, 1] call twc_fnc_isnearblufor) && (((getpos _x) distance twc_basepos) > 2000) && (((getpos _x) distance getmarkerpos "respawn_west_forwardBase") > 2000)) then {
			_loc = getpos _x;
			_name = text _x;
		};
	} foreach townLocationArray;
	_amount = _amount + 500;
};

if (_amount >= worldsize) exitwith {};
if (!(count _loc == 0)) then {
	if ((getmarkertype "respawn_east") != "") then {
		deletemarker "respawn_east";
	};
	createmarker ["respawn_east", _loc];
	"respawn_east" setMarkerType "empty";
	missionnamespace setvariable ["twc_enemyplayerspawnpos", _loc, true];
	missionnamespace setvariable ["twc_enemyplayerspawnname", _name, true];
};
