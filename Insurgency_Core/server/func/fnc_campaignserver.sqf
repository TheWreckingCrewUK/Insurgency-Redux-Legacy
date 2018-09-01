
_objlist = [];

waituntil {!(isnil "twc_activemissions")};
_time = time;
waituntil {(count twc_activemissions > 0) || (_time < (time - 300))};
sleep 10;

if (count twc_activemissions > 0) then {
	{if ((_x select 1 == "HVT")|| (_x select 1 == "VIP")) then {_objlist pushback _x}} foreach twc_activemissions;
};

_objlist = _objlist call BIS_fnc_arrayShuffle;

_campaignlist = [];

if (count twc_activestrongholds > 0) then {_campaignlist pushback (twc_activestrongholds select 0)};

if (count InsP_cacheGroup > 0) then {_campaignlist pushback (InsP_cacheGroup select 0)};

if (count _objlist > 0) then {_campaignlist pushback (_objlist select 0)} else {_campaignlist pushback (InsP_cacheGroup select 1)};

if (isnil "twc_pltcmd") then {twc_pltcmd = allplayers call bis_fnc_selectrandom};

twc_campaignmode = 1;
publicVariable "twc_campaignmode";




_tasklist = [];

{
[_x, _campaignlist, _tasklist] spawn {
params ["_obj", "_campaignlist", "_tasklist"];
_taskid = str random 1000;
	if (_obj in InsP_cacheGroup) then {
		_cachepos = ([getpos _obj, 100] call CBA_fnc_randPos);
		[twc_pltcmd,[_taskid],["Intel reports suggest an enemy weapons cache nearby. We need to destroy it to hamper their abilities in the region.","Weapons Cache"],_cachepos,0,2,true] call BIS_fnc_taskCreate; _tasklist pushback _taskid;
		waituntil {!(_obj in InsP_cacheGroup)};
		[_taskID,"Succeeded"] call BIS_fnc_taskSetState;
	};
	if (_obj in twc_activemissions) then {
	
	if ((_obj select 1) == "HVT") then {
	_cachepos = ([_obj select 0, 100] call CBA_fnc_randPos);
		[twc_pltcmd,[_taskid],["We have located a high ranking enemy insurgent. Eliminate him.", _obj select 1],_cachepos,0,2,true] call BIS_fnc_taskCreate;};
	
	if ((_obj select 1) == "VIP") then {
		[twc_pltcmd,[_taskid],["A Journalist is being held by enemy forces. Bring him safely back to base and select the option to Rescue VIP when he's near the spawn building.", _obj select 1],_obj select 0,0,2,true] call BIS_fnc_taskCreate;}; _tasklist pushback _taskid;
		waituntil {!(_obj in twc_activemissions)};
		[_taskid] call BIS_fnc_deleteTask;
	};
	if (_obj in twc_activestrongholds) then {
	
		[twc_pltcmd,[_taskid],["A large concentration of enemy forces has been identified in this area. Clear it of enemy presence.","Stronghold"],_obj select 0,0,2,true] call BIS_fnc_taskCreate; _tasklist pushback _taskid;
		waituntil {!(_obj in twc_activestrongholds)};
		[_taskid] call BIS_fnc_deleteTask;
	};
	
	_campaignlist deleteat (_campaignlist find _obj);
	};
} foreach _campaignlist;

_taskid2 = str random 1000;
[west,[_taskid2],["A Platoon Commander has spawned and received valuable intelligence. Complete the tasks he assigns to complete the mission","Deployment"],objnull,0,2,true] call BIS_fnc_taskCreate;


waituntil {count _campaignlist > 0};
waituntil {(count _campaignlist == 0) || (twc_campaignmode == 0)};

if (twc_campaignmode == 0) exitwith {[_taskid2] call BIS_fnc_deleteTask;{[_x] call BIS_fnc_deleteTask;} foreach  _tasklist;};


[_taskID2,"Succeeded"] call BIS_fnc_taskSetState;

sleep 5;

"pointVictory" call BIS_fnc_endMissionServer;