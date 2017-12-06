_time = random 4;
_base = idfradar;
_shooter = _this select 0;
_shell = _this select 1;
_direction = _shell getreldir _base;
_distance = (_shooter) distance _base;
_distancescale = 100;

//defines how close shells have to be before tripping the alarm. FOB kunduz is 40 as a baseline.
_accuracy = if(isNil "idfbasesize") then {40
} else {idfbasesize};

if (side group _shooter isEqualTo East) then {

if ((_shooter) distance _base < 2000) then
{
//systemchat format ["%1, %2", _direction, _direction + (_distance / _distancescale)];
if ((_direction > ((360 - _accuracy) + (_distance / _distancescale))) or {_direction < ((0 + _accuracy) - (_distance / _distancescale))}) then
{
idfsafe = 0;
publicvariable "idfsafe";
if (alarm == 0) then {
alarm = 1;
publicvariable "alarm";
sleep _time;


//systemchat "middle man sees the shell";
sleep 2;

execVM "Insurgency_Core\client\idfalarm\IDF_Alarm.sqf";
};
};
};
};