/*
by Hobbs
looks at the magazines in each player's inventory on spawn (before the persistent loadout system kicks in) and builds an array of magazines and their commonality. Used for ammoboxes and vehicles
*/

params ["_player"];

_blacklist = ["ACE_ATragMX", "ACE_Kestrel4500", "TWC_Item_Medical_SutureKit_20", "ACE_microDAGR", "ACE_DAGR", "rhsusf_spc_corpsman", "rhsusf_spc_rifleman", "rhsusf_spc_teamleader", "bipod_01_F_blk", "rhsusf_acc_anpeq15_bk_light", "rhsusf_acc_anpeq15A", "UK3CB_BAF_Kite", "CUP_optic_AN_PAS_13c1", "UK3CB_BAF_MaxiKite", "rhsusf_acc_premier_anpvs27", "UK3CB_BAF_TA648_308", "CUP_optic_GOSHAWK_RIS", "cup_optic_an_pvs_10", "uk3cb_baf_llm_ir_tan", "itemCTAB", "CUP_optic_CWS"];

_array = group _player getvariable ["twc_magazinearray", []];

_box = missionnamespace getvariable ["cratebox", objnull];
_playermags = missionnamespace getvariable ["twc_spawnmags", []];
_mags = (_playermags + (magazinecargo _box));

if ((count (handgunMagazine player)) > 0) then {
	_mags pushback ((handgunMagazine player) select 0);
};
_checkedarray = [];

{
	if ((!( _x in _checkedarray)) && (!( _x in _blacklist))) then {
		_checkedarray pushback _x;
		
		_v1 = _x;
		
		_prev = 0;
		{
			if ((_x select 0) == _v1) then {
				_prev = _x select 1;
				_array deleteat (_array find _x);
			};
		} foreach _array;
		
		
		_num = (({_x == _v1} count _mags) / 3) max _prev;
		_val = [_v1, (_num min 15)];
		_array pushback _val;
	};
} foreach _mags;

group _player setvariable ["twc_magazinearray", _array, true];


_array = group _player getvariable ["twc_itemarray", []];


_playeritems = missionnamespace getvariable ["twc_spawnitems", []];
_mags = (_playeritems + (itemcargo _box));

_mags pushback (["ACE_MRE_SteakVegetables", "ACE_MRE_MeatballsPasta", "ACE_MRE_LambCurry", "ACE_MRE_CreamTomatoSoup", "ACE_MRE_CreamChickenSoup", "ACE_MRE_ChickenHerbDumplings", "ACE_MRE_ChickenTikkaMasala", "ACE_MRE_BeefStew"] call bis_fnc_selectrandom);

_mags pushback "ACE_WaterBottle";
_mags pushback "ACE_WaterBottle";
_mags pushback "ACE_Cabletie";
_mags pushback "toolkit";

_checkedarray = [];

{
	if ((!( _x in _checkedarray)) && (!( _x in _blacklist))) then {
		_checkedarray pushback _x;
		
		_v1 = _x;
		
		_prev = 0;
		{
			if ((_x select 0) == _v1) then {
				_prev = _x select 1;
				_array deleteat (_array find _x);
			};
		} foreach _array;
		
		
		_num = (({_x == _v1} count _mags) / 3) max _prev;
		_val = [_v1, (_num min 15)];
		_array pushback _val;
	};
} foreach _mags;

group _player setvariable ["twc_itemarray", _array, true];
