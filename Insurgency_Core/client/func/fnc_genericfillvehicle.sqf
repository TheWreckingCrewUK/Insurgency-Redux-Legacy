/*
by Hobbs
fills vehicle with mags, frags and supplies that are relevant to the units choosing to fill it
[_veh, player, 2] call twc_fnc_genericfillvehicle;
_veh = the vehicle (object)
player = the unit to check for its groups' twc_magazinearray
2 = multiplier for how much to fill
*/

params ["_veh", ["_player", player], ["_mult", 1], ["_domags", true], ["_doitems", true]];

if (_domags) then {
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


	_mags = (magazinecargo _veh);

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
				
				
				
				
				
				if (_count < (((_v1 select 1) * _mult) min ((30 * (1 + (_mult * 0.3))) min 60))) then {
					if ((_veh canadd [(_x select 0), 2]) && (_veh canadd ["UK3CB_BAF_127_100Rnd", 2])) then {
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


};

///////////////////////////

if (_doitems) then {
	_magarrayorig = (group _player) getvariable ["twc_itemarray", []];
	_magarray = [];
	
	_origweps = weaponcargo _veh;

	//arma is stupid
	{
		_magarray pushback _x;
	} foreach _magarrayorig;



	_newmags = [];

	{
		_newmags pushback (_x select 0);
	} foreach _magarray;


	_mags = (itemcargo _veh);

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
				_count = ({_x == (_v1 select 0)} count ((itemcargo _veh) + (weaponcargo _veh)));
				
				if ((_count < (((_v1 select 1) * (_mult / 1)) min ((30 * (1 + (_mult * 0.2))) min 40))) && (!( "ACRE" in (_v1 select 0)))) then {
					if (_veh canadd [(_x select 0), 3]) then {
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
	clearweaponcargoglobal _veh;
	{
		_veh addweaponcargoglobal [_x, 1];
	} foreach _origweps;

	(group _player) setvariable ["twc_itemarray", _magarrayorig];
};


/////////////////////////////////
//now take everything out and readd everything, because otherwise the inventory swims about whenever someone takes something

_mags = magazinecargo _veh;
_newmags = [];
_checkedarray = [];

{
	
		_v1 = _x;
		
		_prev = 0;
		{
			if ((_x select 0) == _v1) then {
				_prev = _x select 1;
				_newmags deleteat (_newmags find _x);
			};
		} foreach _newmags;
		if (_prev == 0) then {
			_newmags pushback [_x, 1];
		} else {
			_val = [_v1, _prev + 1];
			_newmags pushback _val;
		};
	
} foreach _mags;



clearmagazinecargoglobal _veh;
{
	_veh addmagazinecargoglobal [(_x select 0), (_x select 1)];
} foreach _newmags;


_mags = itemcargo _veh;
_newmags = [];
_checkedarray = [];

{
	
		_v1 = _x;
		
		_prev = 0;
		{
			if ((_x select 0) == _v1) then {
				_prev = _x select 1;
				_newmags deleteat (_newmags find _x);
			};
		} foreach _newmags;
		if (_prev == 0) then {
			_newmags pushback [_x, 1];
		} else {
			_val = [_v1, _prev + 1];
			_newmags pushback _val;
		};
	
} foreach _mags;



clearitemcargoglobal _veh;
{
	_veh additemcargoglobal [(_x select 0), (_x select 1)];
} foreach _newmags;


