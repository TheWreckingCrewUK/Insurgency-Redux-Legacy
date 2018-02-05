/*
 * Author: MikeMatrix | Bosenator
 * Create an IED of given type on the road, in a "logical" position.
 *
 * Arguments:
 * 0: IED Type <STRING>
 * 1: Road Segment <OBJECT>
 * 3: Is Intial Seed <BOOLEAN>
 *
 * Return Value:
 * IED <OBJECT>
 *
 * Example:
 * ["IEDLandBig_F", _road] call TWC_fnc_spawnIEDOnRoad;
 */
params ["_iedType", "_road", ["_isIntialSeed", false]];

// Get the bounding box for the road segment, and adjust accordingly
_bb = (boundingBoxReal _road);
_bbr0 = _bb select 0;
_bbr1 = _bb select 1;
_bbr0Fixed = [_bbr0 select 0, _bbr0 select 1, .1];
_bbr1Fixed = [_bbr1 select 0, _bbr1 select 1, .1];

// Now we know the width, we can quarter it, to add later to the center point
_halfOfWidth = (abs ((_bbr1Fixed select 0) - (_bbr0Fixed select 0))) / 2;

// let's get the direction of the road, and choose either the left or right side
_roadDirection = getDir _road;
_leftOrRight = [90, 270] call BIS_fnc_selectRandom;
_leftOrRight = _roadDirection + _leftOrRight;

// let's find a cosy nice warm home for this brand new IED on the side of the road
_position = _road getRelPos [_halfOfWidth, _leftOrRight];

//Created the object. We define _ied in since it is created in an if then
_ied = "Arma is Retarded";
_ied = createVehicle [_iedType,_position,[],0,"NONE"];

_ied setDir (random 360);
_ied setPos (getPos _ied vectorAdd [0,0,-0.04]); // Still no idea why Mike did this


_ied addEventHandler ["Killed", {
	["TWC_Insurgency_adjustPoints", -1] call CBA_fnc_serverEvent;
	["TWC_Insurgency_iedDestroyed", [_position]] call CBA_fnc_serverEvent;
}];

InsP_iedGroup pushback _ied;
publicVariable "InsP_iedGroup";