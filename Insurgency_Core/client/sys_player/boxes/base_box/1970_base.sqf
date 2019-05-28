

if((typeOf player) in ["1970_British_MachineGunner", "1970_British_mg_assistant"])then{
	_tmp_magazines = [
		["rhsusf_100Rnd_762x51_m62_tracer",50]
	];
};


if (["1970_British", typeof player] call BIS_fnc_inString) then {
	{_tmp_magazines pushback _x} foreach 
		[["UK3CB_BAF_762_20Rnd",50],
		["UK3CB_BAF_762_20Rnd_T",10]];

	if (!(handgunweapon player == "")) then {
		_tmp_magazines pushback ["UK3CB_BAF_9_13Rnd",10];
	};
};


if((typeOf player) in ["1970_British_SectionCommander", "1970_British_2IC"])then{
    _tmp_items = 
	[
		["DemoCharge_Remote_Mag",5],
		["ACE_M26_Clacker",1]
    ];
};

if((typeOf player) in ["1970_British_Spotter","1970_British_sniper"])then{
	_tmp_magazines = [
		["ukcw_l42_10rnd_mag",50]
	];
};
