

{
	_x addEventHandler ["CuratorObjectPlaced", {
		if ((_this select 1) iskindof "StaticMortar") then {
			if ((_this select 1) distance idfradar < 3000) then {
				(_this select 1) addeventhandler ["fired", {
					if (alarm == 3) then {execVM "server\sys_basedefence\IDF_Alarmfire.sqf"};
				}];
			};
		};
	}];
} forEach allCurators;