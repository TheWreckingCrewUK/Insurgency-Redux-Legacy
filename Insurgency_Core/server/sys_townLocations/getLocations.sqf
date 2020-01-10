{
// disreguards the towns in the badTown array in initServer
	if(!((str _x) in badTownArray))then{
	if(! ((str ( _x)) in twc_strongholdArray))then{
	
//Calculates how many civilians based on number of houses.
		_houseList = ( _x) nearObjects ["House",300]; 
		_count = count _houseList;
		_count = round (_count / 20);
		
	_dis = 800;
	_expomode = missionnamespace getvariable ["twc_gridspawnmode", 0];
	if (_expomode == 1) then {
		_dis = 1800;
	};
// Creates trigger to spawn the civilians.
		_trg = createTrigger ["EmptyDetector",  _x];
		_trg setTriggerArea [_dis, _dis, 0, true];
		_trg setTriggerActivation ["West", "PRESENT", False];
		_trg setTriggerTimeout[2, 2, 2, true];
		_trg setTriggerStatements ["(({(((getPosATL _x) select 2) < 20)} count thislist > 0) && (({isplayer _x} count thislist) > 0))",format["[(thisTrigger getvariable ['unitsHome', (getpos thistrigger)]),%1,100,[100,200],thisList] spawn twc_townSetup;",_count],""];
		_trg setVariable ["unitsHome", _x];
		//this line will make each town's allegiance apparent at the beginning of the mission, provided it has been explored at some point in the past. currently commented out to facilitate exploration
		//[_x, 1] call twc_fnc_townmarker;
		
		twc_locationarray_trgs pushback (getPos _trg);
		
// Creates a marker that marks the town
/*
		_marker = createMarker [str (random 1000), _x];
		_marker setMarkerShape "RECTANGLE";
		_marker setMarkerSize [500,500];
		_marker setMarkerColor "colorred";
		_marker setMarkerAlpha 0.2;
*/
	};
	};
}forEach townLocationArray;

publicvariable "twc_locationarray_trgs";