/*
 * Author: MikeMatrix
 * Create an IED of given type at given position in specified spawn radius.
 *
 * Arguments:
 * 0: IED Type <STRING>
 * 1: Position <ARRAY>
 * 2: Spawn Radius <NUMBER>
 * 3: Trigger Radius <NUMBER>
 *
 * Return Value:
 * IED <OBJECT>
 *
 * Example:
 * ["IEDLandBig_F", getPos player, 3] call TWC_fnc_spawnIed
 */
params ["_iedType", "_road", "_position", ["_spawnRadius", 0], ["_triggerRadius", 12]];

// Create visible explosive object
_dir = getDir _road;
_angle = [90, 270] call BIS_fnc_selectRandom;
_dir = _dir + _angle;
_pos = _road getRelPos [_spawnRadius, _dir];
_ied = createVehicle [_iedType, _pos, [], 0, "NONE"];
_ied setPos (getPos _ied vectorAdd [0,0,0]);

_ied addEventHandler ["Killed",{
	["TWC_Insurgency_adjustPoints", -1] call CBA_fnc_serverEvent;
}];

InsP_iedGroup pushback _ied;
publicVariable "InsP_iedGroup";