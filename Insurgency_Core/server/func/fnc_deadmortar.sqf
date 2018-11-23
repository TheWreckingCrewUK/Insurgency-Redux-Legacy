params["_truck"];

_mortar = _truck getvariable ["twc_attachedmortar", _truck];

_mortar setdamage 1;

_intelPos = (getPosATL _truck);

_marker = createMarker [format ["mortar%1", (random 1000)], _intelPos];
_marker setMarkerType "mil_triangle";
_marker setMarkerColor "ColorRed";
_marker setMarkerText ("Mortar Destroyed");
_marker setMarkerSize [0.75, 0.75];

["TWC_Insurgency_adjustPoints",50] call CBA_fnc_serverEvent;