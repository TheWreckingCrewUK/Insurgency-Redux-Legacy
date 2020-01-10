//Selects a random town then makes sure it is far enough from base and friendlies
_town = townLocationArray call bis_fnc_selectRandom;
//_pos = getPos _town;
_pos = _town;
//systemchat format ["%1", _this];
_minepos =  _this select 0;



_attemptcount = 0;
while{
/*
([_pos,500] call twc_fnc_posNearPlayers) ||
  _pos distance ((getMarkerPos "base") < 2000) ||
 _town in badTownArray 
 // || getpos _pos distance2D getpos _minepos < 500
 */
 
 ([_pos,800] call twc_fnc_posNearPlayers) || _pos distance2D (getMarkerPos "base") < 500 || _town in badTownArray
 || (_pos distance (_minepos)) > 3000 
  || (_pos distance (_minepos)) < 700 
 }do{
	_town = townLocationArray call bis_fnc_selectRandom;
	_pos = getPos _town;
	_attemptcount = _attemptcount + 1;
	
	if ( [_pos,800] call twc_fnc_posNearPlayers) then {systemchat "players near the patrol spawn. waiting.";
	sleep 60;};
	
if (_attemptcount > 50) exitwith {
};
};
_spawnpos = [getPos _town, 5, 20, 1, 0, 0.7, 0, [], [getPos _town, getPos _town]] call BIS_fnc_findSafePos;

_group = createGroup East;
_count = 5 + random 10;
while {_count > 0} do {

	_unit = _group createUnit [(townSpawn select (floor random (count townspawn))), _spawnPos,[], 0.3,"NONE"];
	_count=_count-1;
	publicVariable "twc_currentenemy";
	_unit addEventHandler ["Killed",{
		[(_this select 0)] call twc_fnc_deleteDead;		
	}];
	//_num = _num + 1;
	sleep 2;


};
_wp1 = [_minepos, 100, 400, 3, 0, 20, 0] call BIS_fnc_findSafePos;
_wp2 = [_minepos, 100, 400, 3, 0, 20, 0] call BIS_fnc_findSafePos;
_wp3 = [_minepos, 100, 400, 3, 0, 20, 0] call BIS_fnc_findSafePos;
_wp4 = [_minepos, 100, 400, 3, 0, 20, 0] call BIS_fnc_findSafePos;

_hp1 = [_spawnpos, 100, 200, 3, 0, 20, 0] call BIS_fnc_findSafePos;
_hp2 = [_spawnpos, 100, 200, 3, 0, 20, 0] call BIS_fnc_findSafePos;
_hp3 = [_spawnpos, 100, 200, 3, 0, 20, 0] call BIS_fnc_findSafePos;
_hp4 = [_spawnpos, 100, 200, 3, 0, 20, 0] call BIS_fnc_findSafePos;

_group setFormation "COLUMN";
_group setSpeedMode "LIMITED";
_group setBehaviour "SAFE";
_group addwaypoint [_wp1,0];
_group addwaypoint [_wp2,0];
_group addwaypoint [_hp1,0];
_group addwaypoint [_wp3,0];
_group addwaypoint [_wp4,0];
_group addwaypoint [_hp2,0];
_group addwaypoint [_wp2,0];
_group addwaypoint [_wp1,0];
 [_group, 7] setWaypointType "CYCLE";
 