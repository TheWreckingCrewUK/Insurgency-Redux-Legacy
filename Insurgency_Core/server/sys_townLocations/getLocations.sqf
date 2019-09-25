{
// disreguards the towns in the badTown array in initServer
	if(!((text _x) in badTownArray))then{
	if(! ((str (getpos _x)) in twc_strongholdArray))then{
	
//Calculates how many civilians based on number of houses.
		_houseList = (getPos _x) nearObjects ["House",300]; 
		_count = count _houseList;
		_count = round (_count / 20);
		
// Creates trigger to spawn the civilians.
		_trg = createTrigger ["EmptyDetector", getPos _x];
		_trg setTriggerArea [700, 700, 0, false];
		_trg setTriggerActivation ["West", "PRESENT", False];
		_trg setTriggerTimeout[2, 2, 2, true];
		_trg setTriggerStatements ["{(((getPosATL _x) select 2) < 20)} count thislist > 0;",format["[(thisTrigger getvariable ['unitsHome', (getpos thistrigger)]),%1,100,[100,200],thisList] spawn twc_townSetup;",_count],""];
		_trg setVariable ["unitsHome",getPos _x];
		//this line will make each town's allegiance apparent at the beginning of the mission, provided it has been explored at some point in the past. currently commented out to facilitate exploration
		//[getPos _trg, 1] call twc_fnc_townmarker;
		
		twc_locationarray_trgs pushback (getPos _trg);
		
// Creates a marker that marks the town
/*
		_markerstr = createMarker [str (random 1000),getPos _x];
		_markerstr setMarkerShape "ICON";
		_markerstr setMarkerType "mil_flag";
		_markerstr setMarkerText (text _x);
*/
	};
	};
}forEach townLocationArray;

publicvariable "twc_locationarray_trgs";