params["_deadCache"];

_intelPos = (getPosATL _deadCache);

_marker = createMarker [format ["%1", _deadCache], _intelPos];
_marker setMarkerType "mil_triangle";
_marker setMarkerColor "ColorRed";
_marker setMarkerText ("Mortar Destroyed");
_marker setMarkerSize [0.75, 0.75];

["TWC_Insurgency_adjustPoints",50] call CBA_fnc_serverEvent;