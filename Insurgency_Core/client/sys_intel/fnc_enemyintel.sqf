hintSilent "Intel Received From Enemy Combatant";
		_rand = (floor (random 2));
		if (_rand <= 1)then{
			_color = "ColorOrange";
			_object = InsP_cacheGroup call BIS_fnc_selectRandom;
			_distance = [25,50,75,100,150,200] call BIS_fnc_selectRandom;
			_intelPos = [_object, _distance] call CBA_fnc_randPos;
			_marker = createMarker [format["%1%2", _object, (str _intelPos)], _intelPos];
			_marker setMarkerType "hd_join";
			_marker setMarkerColor _color;
			_marker setMarkerText (str(_distance) + "m");
			_marker setMarkerSize [0.5,0.5];

			switch (str _object) do {
				case (str (InsP_cacheGroup select 0)): {cacheAMarkers pushBack _marker; publicVariable "cacheAMarkers"};
				case (str (InsP_cacheGroup select 1)): {cacheBMarkers pushBack _marker; publicVariable "cacheBMarkers"};
				case (str (InsP_cacheGroup select 2)): {cacheCMarkers pushBack _marker; publicVariable "cacheCMarkers"};
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
