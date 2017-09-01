/*
* Gets all Locations including the added ones (Since they are just stored normally)
*
* Takes out all bad locations from the server variable "badTownArray".
*
* Creates a trigger to start the insurgent spawning
*/

townLocationArray = nearestLocations [[worldSize/2,worldSize/2], ["NameVillage","NameCity","NameCityCapital","nameLocal"], (sqrt 2 *(worldSize / 2))];
townLocationArray = townLocationArray;
{
	if(text _x in badTownArray)then{}else{
	_marker = createMarker [str (random 10000),getPos _x];
	_marker setMarkerShape "ICON";
	_marker setMarkerType "mil_flag";
	_marker setMarkerColor "ColorUNKNOWN";
	_marker setMarkerText (text _x);
	};
	
	_trg = createTrigger ["EmptyDetector", getPos _x];
	_trg setTriggerArea [800, 800, 0, false];
	_trg setTriggerActivation ["West", "PRESENT", False];
	_trg setTriggerStatements ["(((objectParent (thisList call bis_fnc_selectRandom)) isKindOf 'air') || (getPosATL (thisList call 	bis_fnc_selectRandom)) select 2 < 25)","[(getPos thisTrigger)] call twc_fnc_townInit",""];
}forEach townLocationArray;