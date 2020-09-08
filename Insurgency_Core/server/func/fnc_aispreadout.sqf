params ["_unit", ["_radius", 100], "_origin"];

//hobbs to hobbs: this is too intensive, the sleep 40 is done too much
if (true) exitwith {};


if (isnil "_origin") then {
	_origin = getpos _unit;
};

[_unit, _radius, _origin] spawn {
params ["_unit", "_radius", "_origin"];
if ((vehicle _unit) != _unit) exitwith {};
if (!alive _unit) exitwith {};

while {(behaviour _unit) == "COMBAT"} do {
	(group _unit) setspeedmode "full";
	sleep 60;
};

(group _unit) setbehaviour "safe";
_unit setbehaviour "safe";

(group _unit) setspeedmode "limited";

_buildingarray = nearestObjects [_origin, ["House", "Building"], _radius];
_unit setvariable ["twcspr", 1];

[_unit, _radius, _origin] spawn {
	params ["_unit", "_radius", "_origin"];
	sleep 40;
	if (((leader (group _unit)) == _unit) || (!([(getpos _unit),100] call twc_fnc_posNearPlayers))) then {
		sleep 300;
		[_unit, _radius, _origin] call twc_fnc_aispreadout;
	} else {
		waituntil {(side _unit) != civilian};
		_group = creategroup (side _unit);
		[_unit] joinsilent _group;
		_check = _group getvariable ["twc_isscrambling", 0];
		while {_check == 1} do {
			sleep 30;
			_check = _group getvariable ["twc_isscrambling", 0];
		};
		[_group] spawn twc_fnc_aiscramble;
		[_unit, _radius, _origin] call twc_fnc_aispreadout;
	};
};

if ((count _buildingarray) == 0) exitwith {

	_buildingarray = nearestObjects [_origin, ["House", "Building"], 2000];
	if ((count _buildingarray) > 0) then {
		_building = (_buildingarray select (floor ((count _buildingarray) * 0.2)));
		_pos = [getPos _building, 10, 50, 10, 0, 0.7, 0] call BIS_fnc_findSafePos;
		dostop _unit;
		_unit domove _pos;
	} else {
		_pos = [getPos _unit, 10, 50, 3, 0, 0.7, 0] call BIS_fnc_findSafePos;
		dostop _unit;
		_unit domove _pos;
	};
};

_building = (_buildingarray call bis_fnc_selectrandom);

_buildinglimits = boundingBoxReal _building;

_buildingpos = [(((getpos _building) select 0) - (random ((_buildinglimits select 0) select 0)) + ((random ((_buildinglimits select 1) select 0)) / 2)) - 1, (((getpos _building) select 1) - (random ((_buildinglimits select 0) select 1)) + ((random ((_buildinglimits select 1) select 1)) / 2)) - 1, (((getpos _building) select 2) - (random ((_buildinglimits select 0) select 2)) + (random ((_buildinglimits select 1) select 2)))];

_mancheck = 0;

if (count ((nearestobjects [_buildingpos, ["man"], 2])) > 0) then {
	_mancheck = 1;
};

_checkcount = 0;

while {(_mancheck == 1) && (_checkcount < 50)} do {
	
	_buildingpos = [(((getpos _building) select 0) - (random ((_buildinglimits select 0) select 0)) + (random ((_buildinglimits select 1) select 0))) - 1, (((getpos _building) select 1) - (random ((_buildinglimits select 0) select 1)) + (random ((_buildinglimits select 1) select 1))) - 1, (((getpos _building) select 2) - (random ((_buildinglimits select 0) select 2)) + (random ((_buildinglimits select 1) select 2)))];

	_mancheck = 0;

	if ((count ((nearestobjects [_buildingpos, ["man"], 2]))) > 0) then {
		_mancheck = 1;
	};
};


dostop _unit;
_unit domove _buildingpos;
};