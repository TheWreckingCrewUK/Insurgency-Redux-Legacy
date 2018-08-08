_time = random 4;
_base = idfradar;
_shooter = _this select 0;
_shell = _this select 1;
_direction = _shell getreldir _base;
_distance = (_shooter) distance _base;

//defines how close shells have to be aimed before tripping the alarm. FOB kunduz is 40 as a baseline.

if(isNil "idfbasesize") then {idfbasesize = 40};

if(isNil "lastidftime") then {lastidftime = -200};

_accuracy = idfbasesize * 0.5;

_distancescale = _accuracy * ((_distance * (_distance*0.2)) / 3500000);



//systemchat format ["%1, %2", _distancescale, _distance];

if (isnil "idfreported") then { idfreported = 0};

if (!alive idfradar) exitwith {};
	
	
		//systemchat "1";
		if ((_shooter) distance _base < 25000) then
{			//systemchat "2";
			if ((_shooter) distance _base > (idfbasesize *3)) then
{			

				
			[_base, _shell, _distance, _shooter] spawn {
			
			
			params ["_base", "_shell", "_distance", "_shooter"];
			
			[_shooter,_distance] execvm "insurgency_core\server\sys_basedefence\IDF_marker.sqf";
		
			
			[_shell] execVM "insurgency_core\server\sys_basedefence\IDF_cram.sqf";
			
			//delay variable for automated siren vs human shouting. human shouting (90's) takes a little longer to register the call
			_delay = 1.5;
			if (twc_is90 == 1) then {_delay = 2;};
			
			waituntil {((_shell distance _base) < (((_shooter) distance _base) / _delay)) || !alive _shell};
			
			if (!alive _shell )exitwith {
			//systemchat "base not the target"
			};
			
			//systemchat "4";
			basesafe = 0;
			publicvariable "basesafe";

			idfreported = 1;
			publicvariable "idfreported";



			if (alarm == 0) then {
				alarm = 1;
				publicvariable "alarm";

				//systemchat "middle man sees the shell";


				if (idfon == 0) then {
				execVM "insurgency_core\server\sys_basedefence\IDF_Alarm.sqf";

				};

				};
			
			};
		
		};
	};


