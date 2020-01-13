params["_deadCache", "_pos"];

_var = _deadCache getvariable ["twccachehasbeenhit", 0];
			
if (_var == 1) exitwith {};

_deadCache setvariable ["twccachehasbeenhit", 1, true];

_intelPos = (getPosATL _deadCache);

_marker = createMarker [format ["%1", _deadCache], _intelPos];
_marker setMarkerType "mil_triangle";
_marker setMarkerColor "ColorOrange";
_marker setMarkerText ("Cache Destroyed");
_marker setMarkerSize [0.75, 0.75];

[_pos] call twc_fnc_counterattack;

InsP_cacheGroup deleteat (InsP_cacheGroup find _deadcache);

["TWC_Insurgency_adjustPoints",100] call CBA_fnc_serverEvent;