_time = random 4;
_base = idfradar;
_shooter = _this select 0;
_shell = _this select 1;
_direction = _shell getreldir _base;
_distance = (_shooter) distance _base;

//defines how close shells have to be aimed before tripping the alarm. FOB kunduz is 40 as a baseline.
_accuracy = if(isNil "idfbasesize") then {40
} else {idfbasesize * 0.5};

_distancescale = _accuracy * ((_distance * (_distance*0.2)) / 3500000);
//systemchat format ["%1, %2", _distancescale, _distance];


	if (idfreported == 0) then {
		if ((_shooter) distance _base < 5000) then
{
			if ((_shooter) distance _base > (idfbasesize *3)) then
{

				if (((((direction _shell) - (_shooter getreldir _base)) < 20) && (((direction _shell) - (_shooter getreldir _base)) > -1)) || ((((direction _shell) - (_shooter getreldir _base)) > -20) && (((direction _shell) - (_shooter getreldir _base)) < 1))) then
{
basesafe = 0;
publicvariable "idfsafe";

idfreported = 1;
publicvariable "idfreported";


//[_shell] execVM "Insurgency_Core\server\sys_basedefence\IDF_cram.sqf";


[_shooter,_distance] execvm "Insurgency_Core\server\sys_basedefence\IDF_marker.sqf";
if (alarm == 0) then {
alarm = 1;
publicvariable "alarm";
sleep _time;
//systemchat "middle man sees the shell";

sleep 2;
if (idfon == 0) then {
execVM "Insurgency_Core\server\sys_basedefence\IDF_Alarm.sqf";

};
if (clearing == 0) then {
execVM "Insurgency_Core\server\sys_basedefence\IDF_Clear.sqf";
};


};
};
};
};
};

