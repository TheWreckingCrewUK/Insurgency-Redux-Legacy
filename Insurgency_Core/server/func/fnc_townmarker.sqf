params["_pos", "_count"];

_side = profilenamespace getvariable ['twcenemytown' + (str _pos), 4];

if ((_side == 4) && (!((_pos distance twc_basepos) < 1500))) exitwith {
	systemchat "no side found, exiting";
};

_marker = missionnamespace getvariable ["twc_village_marker" + (str _pos), "null"];

if (_marker != "null") then {
	deletemarker _marker;
};


_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [500, 500, 0, true];
_trg setTriggerActivation ["ANY", "PRESENT", False];
_trg setTriggerTimeout [0,0,0, true];

_trg setTriggerStatements ["this","thistrigger setvariable ['twcenemieseast', {((str (side _x)) == 'east')} count thisList];thistrigger setvariable ['twcenemiesguer', {((str (side _x)) == 'GUER')} count thisList] ",""];

[_trg, _pos] spawn {
	params ["_trg", "_pos"];
	sleep 1;
	_vare = _trg getvariable ["twcenemieseast", 0];
	_varg = _trg getvariable ["twcenemiesguer", 0];
	//systemchat (str ([_varg, _vare]));
	deletevehicle _trg;
	_colour = "colorOpfor";

	if ((_varg > 0) && (_vare == 0)) then {
		_colour = "colorBlufor";
		
	};
	if ((_varg == 0) && (_vare == 0)) then {
		_colour = "colorGreen";
	};

	if ((_pos distance twc_basepos) < 1500) then {
		_colour = "colorBlufor";
	};
	_time = 100; if (hasinterface) then {_time = 0;};
	sleep _time;
	_marker = createMarker [str _pos,_pos];
	//_marker setMarkerShape "rectangle";
	_marker setMarkerShape "ellipse";
	_marker setMarkerSize [500,500];
	_marker setMarkerColor _colour;
	_marker setMarkerAlpha 0.2;

	missionnamespace setvariable ["twc_village_marker" + (str _pos), _marker];
};