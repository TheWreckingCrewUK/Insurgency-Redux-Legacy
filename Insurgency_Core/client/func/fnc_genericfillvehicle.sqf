params ["_veh", ["_player", player], ["_mult", 1]];

_magarrayorig = (group _player) getvariable ["twc_magazinearray", []];
_magarray = [];

//arma is stupid
{
	_magarray pushback _x;
} foreach _magarrayorig;



_newmags = [];

{
	_newmags pushback (_x select 0);
} foreach _magarray;


_mags = magazinecargo _veh;

_checkedarray = [];
_addedmags = [];

{
	if (!( _x in _checkedarray)) then {
		_checkedarray pushback _x;
		
		_v1 = _x;
		
		_prev = 0;
		{
			if ((_x select 0) == _v1) then {
				_prev = _x select 1;
				_addedmags deleteat (_addedmags find _x);
			};
		} foreach _addedmags;
		
		
		_num = ({_x == _v1} count _mags) max _prev;
		_val = [_v1, _num, 1];
		_addedmags pushback _val;
	};
} foreach _mags;



clearmagazinecargoglobal _veh;

{
	_veh addmagazinecargoglobal [_x, 1];
	
} foreach _mags;

_vehfull = 0;

while {_vehfull == 0} do {
	if ((count _magarray) > 0) then {
		{
			_v1 = _x;
			_count = ({_x == (_v1 select 0)} count (magazinecargo _veh));
			
			
			
			
			
			if (_count < (((_v1 select 1) * _mult) min 30)) then {
				if (_veh canadd [(_x select 0), 1]) then {
					_veh addmagazinecargoglobal [(_x select 0), 1];
				} else {
					_vehfull = 1;
				};
			} else {
				_magarray deleteat (_magarray find _x);
			};
		} foreach _magarray;
	} else {
		_vehfull = 1;
	};
};

(group _player) setvariable ["twc_magazinearray", _magarrayorig];

///////////////////////////

_magarrayorig = (group _player) getvariable ["twc_itemarray", []];
_magarray = [];

//arma is stupid
{
	_magarray pushback _x;
} foreach _magarrayorig;



_newmags = [];

{
	_newmags pushback (_x select 0);
} foreach _magarray;


_mags = itemcargo _veh;

_checkedarray = [];
_addedmags = [];

{
	if (!( _x in _checkedarray)) then {
		_checkedarray pushback _x;
		
		_v1 = _x;
		
		_prev = 0;
		{
			if ((_x select 0) == _v1) then {
				_prev = _x select 1;
				_addedmags deleteat (_addedmags find _x);
			};
		} foreach _addedmags;
		
		
		_num = ({_x == _v1} count _mags) max _prev;
		_val = [_v1, _num, 1];
		_addedmags pushback _val;
	};
} foreach _mags;



clearitemcargoglobal _veh;

{
	_veh additemcargoglobal [_x, 1];
	
} foreach _mags;

_vehfull = 0;

while {_vehfull == 0} do {
	if ((count _magarray) > 0) then {
		{
			_v1 = _x;
			_count = ({_x == (_v1 select 0)} count (itemcargo _veh));
			
			
			
			
			
			if ((_count < (((_v1 select 1) * (_mult / 1)) min 30)) && (!( "ACRE" in (_v1 select 0)))) then {
				if (_veh canadd [(_x select 0), 1]) then {
					_veh additemcargoglobal [(_x select 0), 1];
				} else {
					_vehfull = 1;
				};
			} else {
				_magarray deleteat (_magarray find _x);
			};
		} foreach _magarray;
	} else {
		_vehfull = 1;
	};
};

(group _player) setvariable ["twc_itemarray", _magarrayorig];

