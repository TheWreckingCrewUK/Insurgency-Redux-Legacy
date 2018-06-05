//initial defines
_roadPos = 0;
_newVehicle = 0;
_selectVehicle = 0;
_newVehicle = 0;

_spawnRadius = _this select 0;
_amountToSpawn = _this select 1;

_roadList = [worldSize / 2, worldSize / 2] nearRoads _spawnRadius;
_vehicle = 0;
_vehicleList = ["CUP_C_Datsun_Plain", "CUP_C_Skoda_Blue_CIV", "CUP_C_UAZ_Open_TK_CIV"];

while {_vehicle < _amountToSpawn} do {
	_roadPos = _roadList call BIS_fnc_selectRandom;
	if(_roadPos distance2D (getMarkerPos "base") > 800)then{
		_selectVehicle = _vehicleList select (floor(random(count _vehicleList)));
		_newVehicle = _selectVehicle createVehicle (getPos _roadPos);
		_newVehicle addMPEventHandler ["MPKilled",{
			if (side (_this select 1) == WEST) then{
				InsP_civTrust = InsP_civTrust - 0.05; publicVariable "InsP_civTrust";
			};
		}];
	
		while {isOnRoad _newVehicle} do {
			_xAxis = 3;
			_yAxis = 3;
		
			if ((random 100) > 50) then {
				_xAxis = -3;
			};
		
			if ((random 100) > 50) then {
				_yAxis = -3;
			};
		
			_newVehicle setPosATL [(getPosATL _newVehicle select 0) + _xAxis,
				(getPosATL _newVehicle select 1) + _yAxis, 0];
			_newVehicle setDir (random 360);
		};
	
		_vehicle = _vehicle + 1;
	};
};

[[worldSize/2,worldSize/2], 6, worldSize/2 ] execvm "Insurgency_Core\server\func\fnc_spawnAmbientTechnicals.sqf";