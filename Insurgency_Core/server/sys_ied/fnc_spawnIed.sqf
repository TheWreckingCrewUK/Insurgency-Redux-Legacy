/*
 * Author: MikeMatrix | Bosenator
 * Create an IED of given type at given position in a specified spawn radius.
 *
 * Arguments:
 * 0: IED Type <STRING>
 * 1: Position <ARRAY>
 * 2: Spawn Radius <NUMBER> (Optional)
 * 2: Is Intial Seed <BOOLEAN> (Optional)
 *
 * Return Value:
 * IED <OBJECT>
 *
 * Example:
 * ["IEDLandBig_F", getPos player, 3] call TWC_fnc_spawnIED;
 */
params ["_iedType", "_position", ["_spawnRadius", 0], ["_isIntialSeed", false]];


if (count(_position nearobjects ['pipebombbase', 500]) > 0) exitwith {};

_ied = "Arma is Retarded";
// Create visible explosive object
_ied = createVehicle [_iedType, _position, [], _spawnRadius, "NONE"];
_ied setDir (random 360);
_ied setPos (getPos _ied vectorAdd [0,0,-0.03]); // ????? I'm not sure why Mike did this but I'm scared to remove it

/*
_marker = createMarker [str getpos _ied,getpos _ied];
_marker setMarkerShape "ICON";
_marker setMarkerType "MIL_dot";
_marker setMarkerColor "colorOpfor";
*/

_randsize = random 40;
_randtime = random 5;
_trg = createTrigger ["EmptyDetector", getpos _ied];
_trg setTriggerArea [_randsize, _randsize, 30, false];
_trg setTriggerActivation ["west", "PRESENT", True];
_trg setTriggerTimeout [_randtime,_randtime,_randtime, false];
_trg setTriggerStatements ["{((getposatl _x) select 2) < 15} foreach thislist && {speed _x > 10} foreach thislist && {side _x == west} foreach thislist && (count (thistrigger nearobjects ['pipebombbase', 1])>0)","if (count (thistrigger nearobjects ['CUP_Wolfhound_Base', (100 + (random 100))]) > 0) exitwith {};'Bo_GBU12_LGB' createvehicle getpos thistrigger; 
deleteVehicle thisTrigger;",""];

_randsize = 150 + (random 200);
_randtime = random 2;
_trg2 = createTrigger ["EmptyDetector", getpos _ied];
_trg2 setTriggerArea [_randsize, _randsize, 30, false];
_trg2 setTriggerActivation ["west", "PRESENT", True];
_trg2 setTriggerTimeout [_randtime,_randtime,_randtime, false];
_trg2 setTriggerStatements ["twc_terp in thislist && (count (thistrigger nearobjects ['pipebombbase', 1])>0)","execvm 'Insurgency_Core\server\sys_terp\fnc_terp_ied.sqf'",""];



_ied addEventHandler ["Killed", {
	["TWC_Insurgency_adjustPoints", -1] call CBA_fnc_serverEvent;
	["TWC_Insurgency_iedDestroyed", [_position]] call CBA_fnc_serverEvent;
}];

InsP_iedGroup pushback _ied;
publicVariable "InsP_iedGroup";

