params["_deadCache","_killer"];

_intelPos = (getPosATL _deadCache);
_killerPos = (GetPosATL _killer);

_marker = createMarker [format ["%1", _deadCache], _intelPos];
_marker setMarkerType "mil_triangle";
_marker setMarkerColor "ColorOrange";
_marker setMarkerText ("Cache Destroyed");
_marker setMarkerSize [0.75, 0.75];

["TWC_Insurgency_adjustPoints",150] call CBA_fnc_serverEvent;