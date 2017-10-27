{
// disreguards the towns in the badTown array in initServer
	if(!((text _x) in badTownArray))then{
	
//Calculates how many civilians based on number of houses.
		_houseList = (getPos _x) nearObjects ["House",300]; 
		_count = count _houseList;
		_count = round (_count / 20);
		
// Creates trigger to spawn the civilians.
		_trg = createTrigger ["EmptyDetector", getPos _x];
		_trg setTriggerArea [500, 500, 0, false];
		_trg setTriggerActivation ["West", "PRESENT", False];
		_trg setTriggerTimeout[2, 2, 2, true];
		_trg setTriggerStatements ["(((objectParent (thisList call bis_fnc_selectRandom)) isKindOf 'air') && (getPosATL (thisList call bis_fnc_selectRandom)) select 2 < 25) || !((objectParent (thisList call bis_fnc_selectRandom)) isKindOf 'air')",format["[(getPos thisTrigger),%1,100,[100,200],thisList] spawn twc_townSetup",_count],""];

// Creates a marker that marks the town
/*
		_markerstr = createMarker [str (random 1000),getPos _x];
		_markerstr setMarkerShape "ICON";
		_markerstr setMarkerType "mil_flag";
		_markerstr setMarkerText (text _x);
*/
	};
}forEach townLocationArray;