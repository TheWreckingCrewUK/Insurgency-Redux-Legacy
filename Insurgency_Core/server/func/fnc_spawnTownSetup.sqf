/*
* Created by [TWC] jayman
*
* Is pre-compiled as twc_townSetup
* Called from server\townSetup\%townName\init
*
* Example:
*  _Bastamstart setTriggerStatements ["this","['Bastam',7,100,3,[600,700]] call twc_townSetup"
*
* This example gives the town of Bastam 7 civs with a radius of 100.
* It has 3 Waves morale not withstanding, which spawn between 600 and 700 meters away.
*
* Creates a trigger to spawn the town capture and cleanup
*/ 
						  
params["_pos","_civnum","_civradius","_groupradius","_thisList",["_spawnCivs",true],["_forceSpawn",false], "_posid"];

[_pos] call twc_fnc_civfluff;

if ((_pos distance twc_basepos) < 1500) exitwith {[_pos, 0] call twc_fnc_townmarker;};

_civnum = (_civnum min 10) max 5;

if(_spawnCivs)then{
	[_pos, _civnum, _civradius] call twc_spawnCiv;
};


_isfriend = profilenamespace getvariable ['twcenemytown' + (str _pos), 5];

if (((_pos distance twc_basepos) < 1000) || (((getmarkerpos "respawn_west_forwardbase") distance _pos) < 1500)) then {
	_isfriend = 1;
};

_enemies = 0;

if ((_isfriend == 5) || (_isfriend == 0) || ((missionnamespace getvariable ["twcresetmode",0]) == 1)) then {

	[_pos] remoteExec ["twc_fnc_bluforreport"];

	_random = random 100;
	if(_random < ((2.5 * TWC_insMorale) min 50) || _forceSpawn)then{
		_enemies = 1;
		[_pos] spawn twc_spawnDefend;
	};

	_random = random 100;
	if(_random < ((2.5 * TWC_insMorale) min 50) || _forceSpawn)then{
		_enemies = 1;
		[_pos, _groupradius,_thisList] spawn twc_spawnAIUnits;
	};
	
	//random chance of , if we're winning already, turn an enemy town to friendly. if it gets through this check then it goes to the friend system
	if(_enemies == 0) then {
		if ((TWC_insMorale > 15) && (TWC_civMorale < 70)) then {
			_enemies = 1;
			[_pos, _groupradius,_thisList] spawn twc_spawnAIUnits;
		};
	};

} else {
	//systemchat "friendly profile spotted";
};

if(_enemies == 0) then {
	//systemchat "attempting friends";
	profilenamespace setvariable ['twcenemytown' + (str _pos), 1];
	[_pos, _groupradius,_thisList, 0.5] spawn twc_spawnAIUnits;
} else {
	profilenamespace setvariable ['twcenemytown' + (str _pos), 0];
};
saveprofilenamespace;


_dis = 1100;
_expomode = missionnamespace getvariable ["twc_gridspawnmode", 0];
if (_expomode == 1) then {
	_dis = 2100;
};

_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerArea [_dis, _dis, 0, true];
_trg setTriggerActivation ["ANY", "PRESENT", False];
_trg setTriggerTimeout [10,10,10, true];

_trg setTriggerStatements ["({((side (_x)) == WEST) && (isplayer _x)} count thisList == 0) || ({((alive (_x))) && ((str (_x getvariable ['unitshome', [1,1,1]])) == (str (thisTrigger getVariable 'unitsHome')))} count thisList == 0) ","[thistrigger, thislist] spawn {params ['_trg', '_lst'];sleep 5;[(_trg getVariable 'unitsHome'), _lst] spawn twc_fnc_townDeciding;}; _lst = (({((count (weapons _x)) > 0) && ((vehicle _x) == _x) && (alive _x) && ((str (_x getvariable ['unitshome', [1,1,1]])) == (str (thisTrigger getVariable 'unitsHome')))} count thisList)); [(thistrigger getVariable 'unitsHome'), _lst] call twc_fnc_townmarker;",""];



// && {(side (group _x)) == guer} count thisList < 2

//marker is being done after deleting the units

_trg setVariable ["unitsHome",_pos];