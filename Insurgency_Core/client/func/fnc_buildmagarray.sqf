/*
by Hobbs
looks at the magazines in each player's inventory on spawn (before the persistent loadout system kicks in) and builds an array of magazines and their commonality. Used for ammoboxes and vehicles
*/

params ["_player"];

_array = group _player getvariable ["twc_magazinearray", []];
_array = [];

_mags = magazines _player;

if ((count (handgunMagazine player)) > 0) then {
	_mags pushback ((handgunMagazine player) select 0);
};
_checkedarray = [];

{
	if (!( _x in _checkedarray)) then {
		_checkedarray pushback _x;
		
		_v1 = _x;
		
		_prev = 0;
		{
			if ((_x select 0) == _v1) then {
				_prev = _x select 1;
				_array deleteat (_array find _x);
			};
		} foreach _array;
		
		
		_num = ({_x == _v1} count _mags) max _prev;
		_val = [_v1, (_num min 10)];
		_array pushback _val;
	};
} foreach _mags;

group _player setvariable ["twc_magazinearray", _array, true];


_array = group _player getvariable ["twc_itemarray", []];
_array = [];

_mags = items _player;

_mags pushback (["ACE_MRE_SteakVegetables", "ACE_MRE_MeatballsPasta", "ACE_MRE_LambCurry", "ACE_MRE_CreamTomatoSoup", "ACE_MRE_CreamChickenSoup", "ACE_MRE_ChickenHerbDumplings", "ACE_MRE_ChickenTikkaMasala", "ACE_MRE_BeefStew"] call bis_fnc_selectrandom);

_mags pushback "ACE_WaterBottle";
_mags pushback "ACE_WaterBottle";
_mags pushback "ACE_Cabletie";

_checkedarray = [];

{
	if (!( _x in _checkedarray)) then {
		_checkedarray pushback _x;
		
		_v1 = _x;
		
		_prev = 0;
		{
			if ((_x select 0) == _v1) then {
				_prev = _x select 1;
				_array deleteat (_array find _x);
			};
		} foreach _array;
		
		
		_num = ({_x == _v1} count _mags) max _prev;
		_val = [_v1, (_num min 10)];
		_array pushback _val;
	};
} foreach _mags;

group _player setvariable ["twc_itemarray", _array, true];
