params["_pos", "_count"];

[_pos, _count] spawn {
	params["_pos", "_count"];

	_side = profilenamespace getvariable ['twcenemytown' + (str _pos), 4];

	if ((_side == 4) && (!((_pos distance twc_basepos) < 1500))) exitwith {
		systemchat "no side found, exiting";
	};

	_marker = missionnamespace getvariable ["twc_village_marker" + (str _pos), "null"];


	_colour = "colorOpfor";

	
	if (_side == 1) then {
		_colour = "colorBlufor";
	};
	if (_count == 0) then {
		_colour = "colorGreen";
	};

	_time = 100;
	if (hasinterface) then {
		_time = 20;
	};
	sleep _time;
		

	if (markershape "_marker" != "") then {
		deletemarker _marker;
	};
	
	_type = "ellipse";
	_expomode = missionnamespace getvariable ["twc_gridspawnmode", 0];
	if (_expomode == 1) then {
		_type = "rectangle";
	};
	
	_marker = createMarker [str _pos,_pos];
	//_marker setMarkerShape "rectangle";
	_marker setMarkerShape _type;
	_marker setMarkerSize [500,500];
	_marker setMarkerColor _colour;
	_marker setMarkerAlpha 0.2;

	missionnamespace setvariable ["twc_village_marker" + (str _pos), _marker];
};