//this needs to be run on the server as well because remoteexec only passes the string, so if it's a vehicle owned by the server then it will try to run the function on the server as well

if (hasinterface) then {
	_twc_repveh = ["repveh","Recover Vehicle","",{_isflipping = _target getvariable ["twc_vehisflipping", false];

	if (_isflipping) exitwith {hint "this vehicle is being recovered already";};[_target, player] remoteexec ["twc_fnc_flipvehicle", _target];},{(alive _target) && (1 < (vectorUp _target) vectorDistance (surfaceNormal getPosATL _target))}] call ace_interact_menu_fnc_createAction;
	["landvehicle",0,["ACE_MainActions"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
};

twc_fnc_flipvehicle = {
	params ["_vehicle", "_caller"];

	_mass = getmass _vehicle;

	("Recovery initiated. Stand back.") remoteExec ["hint", _caller];
	//just sticking with the non-physx method for now, because it looks bad on non-local clients
	if ((_mass > 7500) || true) exitwith {

		_helpers = {isplayer _x} count (_vehicle nearEntities ["Man", 50]);
		
		_neededhelpers = (round ((_mass / 1200) min ((((side player) countside allplayers)) * 0.8)));
		
		if (_helpers >= _neededhelpers) then {
			_vehicle allowdamage false;
			sleep 10;
			_vehicle setpos ((getpos _vehicle) vectoradd [0,0,2]);_vehicle setvectordirandup [vectordir _vehicle, [0,0,1]];
			sleep 5;
			_vehicle allowdamage true;
			("Recovery complete.") remoteExec ["hint", _caller];
		} else {
			(format ["You need %1 players nearby to recover this vehicle", _neededhelpers]) remoteExec ["hint", _caller];
		};
	};


	_vehicle setvariable ["twc_vehisflipping", true];


	_lockstate = ["UNLOCKED", "DEFAULT", "LOCKED", "LOCKEDPLAYER"] select (locked _vehicle);


	_vehicle setvehiclelock "locked";
	_vehicle allowdamage false;
	_orig = getCenterOfMass _vehicle;
	_vehicle setmass (_mass / 2);
	_var = 0;

	if (((vectorUp _vehicle) vectorDistance (surfaceNormal getPosATL _vehicle)) > 1.8) then {

		while {((vectorUp _vehicle) vectorDistance (surfaceNormal getPosATL _vehicle)) > 1.8} do {
			_vehicle setCenterOfMass [[_var,_orig select 1,-1.5], 0.3]; sleep 0.5;_var = _var + 0.2;
		};
		sleep 3;
	};
	_var = -3;
	_vehicle setmass (_mass * 3);
	while {((vectorUp _vehicle) vectorDistance (surfaceNormal getPosATL _vehicle)) > 0.6} do {
		_vehicle setCenterOfMass [[_orig select 0,_orig select 1,_var], 1]; sleep 1.2;_var = _var -0.1;
	};

	sleep 3;
	_vehicle setCenterOfMass [_orig, 1];

	sleep 1;
	_vehicle setmass _mass;

	_vehicle setVehicleLock _lockstate;

	_vehicle allowdamage true;

	_vehicle setvariable ["twc_vehisflipping", false];

	("Recovery complete.") remoteExec ["hint", _caller];
};