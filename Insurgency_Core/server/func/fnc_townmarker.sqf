params["_pos", "_count"];

_side = profilenamespace getvariable ['twcenemytown' + (str _pos), 4];

if (_side == 4) exitwith {
	//if (time > 100) then {systemchat "no side found, exiting";};
};

_marker = missionnamespace getvariable ["twc_village_marker" + (str _pos), "null"];

if (_marker != "null") then {
	deletemarker _marker;
};

_colour = "colorOpfor";
systemchat "go";

if (_side == 1) then {
	_colour = "colorBlufor";
	
};
if (_count == 0) then {
	_colour = "colorGreen";
	systemchat "green";
};

_marker = createMarker [str _pos,_pos];
_marker setMarkerShape "Ellipse";
_marker setMarkerSize [250,250];
_marker setMarkerColor _colour;
_marker setMarkerAlpha 0.5;

missionnamespace setvariable ["twc_village_marker" + (str _pos), _marker];