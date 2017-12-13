
//systemchat "marker attempt";


//if (idfguns find (str (_object)) <0) then {
if (clearingmarker == 0) then {
markertime = 0;
publicvariable "markertime";
_object = _this select 0;
_distanceshooter = _this select 1;
_distance = 50+((floor random 10)*10)+((floor (_distanceshooter/80))*10);

_hour = floor daytime;
_minute = floor ((daytime - _hour) * 60);
_second = floor (((((daytime) - (_hour))*60) - _minute)*60);
_time24 = text format ["%1:%2:%3",_hour,_minute,_second];
_wait = (random 60)+60;
//systemchat "marker approved";
sleep _wait;
//systemchat "marker on";
			_color = "ColorRed";
//			_object = InsP_aaGroup call BIS_fnc_selectRandom;
//			_distance = [50,100,150] call BIS_fnc_selectRandom;
			_intelPos = [_object, _distance] call CBA_fnc_randPos;
			_marker = createMarker [format["%1%2", _object, (str _intelPos)], _intelPos];
			_marker setMarkerType "hd_join";
			_marker setMarkerColor _color;
			_marker setMarkerText (str(_distance) + "m @ " + str (_time24));
			_marker setMarkerSize [0.5,0.5];
			[_marker, true] call CBA_fnc_setMarkerPersistent;


if (clearingmarker == 0) then {
execVM "Insurgency_Core\server\sys_basedefence\IDF_clearmarker.sqf";};
		
			sleep 3600;
			deletemarker _marker;
			};
		
	//		};