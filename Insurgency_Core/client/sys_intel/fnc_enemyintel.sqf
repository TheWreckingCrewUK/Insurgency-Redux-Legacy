hintSilent "Intel Received From Enemy Combatant";
		_rand = (floor (random 2));
		if (_rand <= 1)then{
			_color = "ColorOrange";
			_cachearray = [];
			{
				_isdead = _x getvariable ["twccachehasbeenhit", 0];
				if (_isdead == 0) then {
					_cachearray pushback _x;
				};
			} foreach InsP_cacheGroup;
			_object = _cachearray call BIS_fnc_selectRandom;
			_distance = [25,50,75,100,150,200] call BIS_fnc_selectRandom;
			_precision = count (nearestObjects [_object, ["house"], 300]);
			_distance = ((round ((_distance / (1 + (_precision / 10))) / 50)) * 50) max 25;
			_intelPos = [_object, _distance] call CBA_fnc_randPos;
			_marker = createMarker [format["%1%2", _object, (str _intelPos)], _intelPos];
			_marker setMarkerType "hd_join";
			_marker setMarkerColor _color;
			_marker setMarkerText (str(_distance) + "m");
			_marker setMarkerSize [0.5,0.5];

			switch (_object) do {
				case (cacheBoxA): {cacheAMarkers pushBack _marker; publicVariable "cacheAMarkers"};
				case (cacheBoxB): {cacheBMarkers pushBack _marker; publicVariable "cacheBMarkers"};
				case (cacheBoxC): {cacheCMarkers pushBack _marker; publicVariable "cacheCMarkers"};
				default {hint "Something went wrong";};
			};
		} else

		{
			_color = "ColorYellow";
			_object = InsP_iedGroup call BIS_fnc_selectRandom;
			_distance = [10,20] call BIS_fnc_selectRandom;
			_intelPos = [_object, _distance] call CBA_fnc_randPos;
			_marker = createMarker [format["%1%2", _object, (str _intelPos)], _intelPos];
			_marker setMarkerType "hd_join";
			_marker setMarkerColor _color;
			_marker setMarkerText (str(_distance) + "m");
			_marker setMarkerSize [0.5,0.5];
		};
