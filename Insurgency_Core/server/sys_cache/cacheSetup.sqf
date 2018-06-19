/*Written by WiredTiger for use on the TWC Public server.
Not to be used without consent from TWC or WiredTiger
Thanks for the consent -[TWC] jayman
*/

if (isNil "InsP_cacheGroup") then {

	cacheBoxA = "Box_FIA_Ammo_F" createVehicle (getMarkerPos "cacheSpawn" vectorAdd[5,0,0]);
	_cacheADeath = cacheBoxA addEventHandler ["Killed", {[_this select 0, _this select 1] call InsP_fnc_deadCache; ["cacheBoxA"] call InsP_fnc_deleteMarkers}];
	publicVariable "cacheBoxA";

	cacheBoxB = "Box_FIA_Ammo_F" createVehicle (getMarkerPos "cacheSpawn" vectorAdd[10,0,0]);;
	_cacheADeath = cacheBoxB addEventHandler ["Killed", {[_this select 0, _this select 1] call InsP_fnc_deadCache; ["cacheBoxB"] call InsP_fnc_deleteMarkers}];
	publicVariable "cacheBoxB";

	cacheBoxC = "Box_FIA_Ammo_F" createVehicle (getMarkerPos "cacheSpawn" vectorAdd[15,0,0]);;
	_cacheADeath = cacheBoxC addEventHandler ["Killed", {[_this select 0, _this select 1] call InsP_fnc_deadCache; ["cacheBoxC"] call InsP_fnc_deleteMarkers}];
	publicVariable "cacheBoxC";

	InsP_cacheGroup = [cacheBoxA, cacheBoxB, cacheBoxC];
	publicVariable "InsP_cacheGroup";
	
	waitUntil {!(isNil "cacheBoxA") && !(isNil "cacheBoxB") &&!(isNil "cacheBoxC") && !(isNil "InsP_cacheGroup")};

	{
		//Cache cannot cause near to Blufor respawn
 		while {(_x distance (getMarkerPos "cacheSpawn")) <500 || (_x distance (getmarkerpos "base")) < 500 } do {			
			_cacheMarker = "";
	
			_houseList = [(worldSize / 2),(worldSize / 2)] nearObjects ["House",(sqrt 2 *(worldSize / 2))];
			sleep .25;
			_c = 0;
			_house = _houseList call BIS_fnc_selectRandom;
			while { format ["%1", _house buildingPos _c] != "[0,0,0]" } do {_c = _c + 1};
			if (_c > 0) then {
				_ranNum = floor(random _c);
				_x setPos (_house buildingPos _ranNum);
				sleep 1;
			};
			sleep 0.25;
		};
		clearItemCargoGlobal _x;
		clearWeaponcargoGlobal _x;
		clearMagazineCargoGlobal _x;
		clearBackpackCargoGlobal _x;
		
		_randsize = 250 + (random 500);
_randtime = 2;
_trg2 = createTrigger ["EmptyDetector", getpos _x];
_trg2 setTriggerArea [_randsize, _randsize, 30, false];
_trg2 setTriggerActivation ["west", "PRESENT", True];
_trg2 setTriggerTimeout [_randtime,_randtime,_randtime, false];
_trg2 setTriggerStatements ["vehicle twc_terp in thislist","[getpos thistrigger] execvm 'Insurgency_Core\server\sys_terp\fnc_terp_cache.sqf'",""];
		
		
		_num = 0;
		_total = 21;
		_group = createGroup East;
		_pos = getPos _x;
		for "_i" from 1 to _total do{
			_unit = _group createUnit [(townSpawn select (floor random (count townspawn))), _pos,[], 5,"NONE"];
			_unit addEventHandler ["Killed",{
				[(_this select 0)] call twc_fnc_deleteDead;
				if (side (_this select 1) == WEST) then{
					["TWC_Insurgency_adjustInsurgentMorale", -0.25] call CBA_fnc_serverEvent;
					["TWC_Insurgency_adjustCivilianMorale", 0.25] call CBA_fnc_serverEvent;
				};
			}];
			_unit addMagazines ["handGrenade",2];
			_unit setVariable ["unitsHome",_pos,false];
			//_num = _num + 1;
			sleep 0.2;
		};
		for "_i" from 1 to 2 do{
if ((random 1) < 0.15) then {
_group createUnit ["CUP_O_TK_INS_Soldier_AA", _pos,[], 25,"NONE"];
};
};

	[_pos, nil, units _group, 10, 2, true, true] call ace_ai_fnc_garrison;
		_null = [leader _group, leader _group,150] spawn TWC_fnc_Defend;
	} forEach InsP_cacheGroup;
};