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

if (isnil "_position") exitwith {};

if ((_position distance (getmarkerpos "base")) < 2000) exitwith {};

if (count(_position nearobjects ['pipebombbase', 500]) > 0) exitwith {};
//Created the object. We define _ied in since it is created in an if then
_ied = "Arma is Retarded";
_ied = createVehicle [_iedType,_position,[],0,"NONE"];

_ied setDir (random 360);
_ied setPos (getPos _ied vectorAdd [0,0,-0.0]); // Still no idea why Mike did this

/*
_marker = createMarker [str getpos _ied,getpos _ied];
_marker setMarkerShape "ICON";
_marker setMarkerType "MIL_dot";
_marker setMarkerColor "colorBlufor";
*/

_randsize = random 20;
_randtime = random 2;
_trg = createTrigger ["EmptyDetector", getpos _ied];
_trg setTriggerArea [_randsize, _randsize, 30, false];
_trg setTriggerActivation ["west", "PRESENT", False];
_trg setTriggerTimeout [_randtime,_randtime,_randtime, false];
_trg setTriggerStatements ["{((getposatl _x) select 2) < 15} foreach thislist && {speed _x > 10} foreach thislist && {side _x == west} foreach thislist && (count (thistrigger nearobjects ['pipebombbase', 1])>0)","if (count (thistrigger nearobjects ['CUP_Wolfhound_Base', (100 + (random 100))]) > 0) exitwith {};'ammo_Bomb_SDB' createvehicle getpos thistrigger;[getpos thistrigger] call INS_fnc_daisychain; [getpos thistrigger, thislist] call INS_fnc_iedcounterattack; deleteVehicle thisTrigger;",""];

_randsize = 150 + (random 200);
_randtime = random 2;
_trg2 = createTrigger ["EmptyDetector", getpos _ied];
_trg2 setTriggerArea [_randsize, _randsize, 30, false];
_trg2 setTriggerActivation ["west", "PRESENT", True];
_trg2 setTriggerTimeout [_randtime,_randtime,_randtime, false];
_trg2 setTriggerStatements ["VEHICLE twc_terp in thislist && (count (thistrigger nearobjects ['pipebombbase', 1])>0)","[getpos thistrigger] execvm 'Insurgency_Core\server\sys_terp\fnc_terp_ied.sqf'",""];




_ied addEventHandler ["Killed", {
	params ["_exp", "_killer", "_instigator", "_useEffects"];
	
	
	["TWC_Insurgency_adjustPoints", -1] call CBA_fnc_serverEvent;
	_marker = createMarker [format ["%1", _exp], getpos _exp];
	_marker setMarkerType "mil_triangle";
	_marker setMarkerColor "ColorYellow";
	_marker setMarkerText ("IED Detonated");
	_marker setMarkerSize [0.75, 0.75];
}];

InsP_iedGroup pushback _ied;
publicVariable "InsP_iedGroup";