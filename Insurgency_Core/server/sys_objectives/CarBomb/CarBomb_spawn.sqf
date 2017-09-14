_town = townLocationArray call bis_fnc_selectRandom;
_veh = "CUP_C_Datsun_Plain" createVehicle (getPos _town);
while{[_veh,500] call CBA_fnc_nearPlayer}do{
	_town = townLocationArray call bis_fnc_selectRandom;
	_veh setPos (getPos _town);
};
_pos = [getPos _town,[0,300],[0,360],0] call SHK_pos;
_markerstr = createMarker [str (random 1000),_pos];
_markerstr setMarkerShape "ICON";
_markerstr setMarkerType "MIL_Warning";
_markerstr setMarkerColor "colorEAST";
_markerstr setMarkerText "Exploded Car Bomb";

"Bo_GBU12_LGB" createVehicle _pos;

//Add Wounded Civilians

//Add Enemies

//wait for player

//Complete or fail


["TWC_Insurgency_objCompleted", ["CarBomb"]] call CBA_fnc_serverEvent;