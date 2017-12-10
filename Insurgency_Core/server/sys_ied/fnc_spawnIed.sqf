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

_ied = "Arma is Retarded";
// Create visible explosive object
if(_iedType in iedSpoofs)then{
	_ied = createVehicle [_iedType,_position,[],_spawnRadius,"NONE"];
}else{
	_ied = createMine [_iedType, _position, [], _spawnRadius];
};
_ied setDir (random 360);
_ied setPos (getPos _ied vectorAdd [0,0,-0.04]); // ????? I'm not sure why Mike did this but I'm scared to remove it 

_ied addEventHandler ["Killed", {
	["TWC_Insurgency_adjustPoints", -1] call CBA_fnc_serverEvent;
	["TWC_Insurgency_iedDestroyed", [_position]] call CBA_fnc_serverEvent;
}];

InsP_iedGroup pushback _ied;
publicVariable "InsP_iedGroup";