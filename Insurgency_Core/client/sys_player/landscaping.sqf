
//Gathers bushes or shrubs into a variable to be placed later. Player can only walk while carrying foliage to discourage carrying it everywhere. Most useful for bananabank when hiding vehicles

_landscapeaction = ["MissionStatus","Gather Foliage","",{

_timer = 30;
if (isserver) then {
	_timer = _timer / 10;
};

if (("shrub" in ((getmodelinfo cursorObject) select 1)) || ("bush" in ((getmodelinfo cursorObject) select 1))) then {

player playmovenow "UnconsciousMedicFromRifle";

};
[_timer, [], {

if (("shrub" in ((getmodelinfo cursorObject) select 1)) || ("bush" in ((getmodelinfo cursorObject) select 1))) then {


_obj = ((getmodelinfo cursorObject) select 1); _objheight = ((((boundingboxreal cursorObject) select 1) select 2) * 0.7);player setvariable ["twc_placebush", [_obj, _objheight]];player forcewalk true; hint "You are carrying foliage";
[cursorobject] remoteExec ["hideobjectglobal", 0, true];
player playmovenow "UnconsciousMedicOutRifle";
};

}, {player playmovenow "UnconsciousMedicOutRifle";}, "Gathering Foliage..."] call ace_common_fnc_progressBar;

},{((cursorObject distance2d player) < 5) && (("bush" in ((getmodelinfo cursorObject) select 1)) || ("shrub" in ((getmodelinfo cursorObject) select 1))) && ((damage cursorObject) < 1) && (("ACE_wirecutter" in (items player)) || ("ACE_EntrenchingTool" in (items player)))}] call ace_interact_menu_fnc_createAction;   
[player, 1, ["ACE_SelfActions"], _landscapeaction] call ace_interact_menu_fnc_addActionToObject;  

 
//this places bushes
_landscapeaction = ["MissionStatus","Place Foliage","",{

_timer = 30;
if (isserver) then {
	_timer = _timer / 10;
};

player playmovenow "UnconsciousMedicFromRifle";


[_timer, [], {_obj = (player getvariable ["twc_placebush", []]);
_objtype = _obj select 0;
_objheight = _obj select 1;

createsimpleobject [_objtype, ((agltoasl (player getrelpos [2, 0])) vectoradd [0,0,_objheight])];
Player forcewalk false;hint "";
player setvariable ["twc_placebush", []];
player playmovenow "UnconsciousMedicOutRifle";
}, {
player playmovenow "UnconsciousMedicOutRifle";
}, "Placing Foliage..."] call ace_common_fnc_progressBar;

},{(!((player getvariable ["twc_placebush", []]) isequalto [])) && (((getposatl player) select 2) < 0.01)}] call ace_interact_menu_fnc_createAction;  
[player, 1, ["ACE_SelfActions"], _landscapeaction] call ace_interact_menu_fnc_addActionToObject; 



 
//this drops bushes
_landscapeaction = ["MissionStatus","Drop Foliage","",{

_timer = 2;
if (isserver) then {
	_timer = _timer / 2;
};
player playmovenow "UnconsciousMedicFromRifle";

[_timer, [], {_obj = (player getvariable ["twc_placebush", []]);
_objtype = _obj select 0;
_objheight = (_obj select 1) / (4 + (random 4));

createsimpleobject [_objtype, ((agltoasl (player getrelpos [(2 + (random 2)), (80 - (random 160))])) vectoradd [0,0,_objheight])];
Player forcewalk false;hint "";
player setvariable ["twc_placebush", []];
player playmovenow "UnconsciousMedicOutRifle";
}, {player playmovenow "UnconsciousMedicOutRifle";}, "Dropping Foliage..."] call ace_common_fnc_progressBar;

},{(!((player getvariable ["twc_placebush", []]) isequalto [])) && (((getposatl player) select 2) < 0.01)}] call ace_interact_menu_fnc_createAction;  
[player, 1, ["ACE_SelfActions"], _landscapeaction] call ace_interact_menu_fnc_addActionToObject; 





// This chops trees down. Useful for clearing sightlines but takes a while so best suited to positions you're particularly invested in

_landscapeaction = ["MissionStatus","Chop Down Tree","",{


_timer = 120;
if (isserver) then {
	_timer = _timer / 10;
};



if (("tree" in ((getmodelinfo cursorObject) select 1)) || ("bush" in ((getmodelinfo cursorObject) select 1))) then {

player playmovenow "UnconsciousMedicFromRifle";

};

[_timer, [], {if ("tree" in ((getmodelinfo cursorObject) select 1)) then {

cursorObject setdamage 1};
player playmovenow "UnconsciousMedicOutRifle";
}, {player playmovenow "UnconsciousMedicOutRifle";}, "Cutting Down Tree..."] call ace_common_fnc_progressBar;

},{((cursorObject distance2d player) < 10) && ("tree" in ((getmodelinfo cursorObject) select 1)) && ((damage cursorObject) < 1)&& ( "ACE_wirecutter" in (items player))}] call ace_interact_menu_fnc_createAction; 
[player, 1, ["ACE_SelfActions"], _landscapeaction] call ace_interact_menu_fnc_addActionToObject;



//This cuts trees up after they've been chopped down. Useful for forrested maps where you want a heli site
_landscapeaction = ["MissionStatus","Cut Up Tree","",{

_timer = 60;
if (isserver) then {
	_timer = _timer / 10;
};


[_timer, [], {if ("tree" in ((getmodelinfo cursorObject) select 1)) then {
player playmovenow "UnconsciousMedicFromRifle";
[cursorobject] remoteExec ["hideobjectglobal", 0, true];
player playmovenow "UnconsciousMedicOutRifle";
};}, {player playmovenow "UnconsciousMedicOutRifle";}, "Cutting Up Tree..."] call ace_common_fnc_progressBar;

},{((cursorObject distance player) < 15) && ("tree" in ((getmodelinfo cursorObject) select 1)) && ((damage cursorObject) == 1)&& ( "ACE_wirecutter" in (items player))}] call ace_interact_menu_fnc_createAction; 
[player, 1, ["ACE_SelfActions"], _landscapeaction] call ace_interact_menu_fnc_addActionToObject;



///////




//non-functional one to kill bushes without deleting them. Doesn't work on placed foliage so keeping it out with an extra false

/*
_landscapeaction = ["MissionStatus","Cut Down Foliage","",{

[40, [], {

if (("shrub" in ((getmodelinfo cursorObject) select 1)) || ("bush" in ((getmodelinfo cursorObject) select 1))) then {_obj = ((getmodelinfo cursorObject) select 1); cursorobject setdamage 1};

}, {}, "Cutting Bush Down..."] call ace_common_fnc_progressBar;

},{false &&((cursorObject distance2d player) < 15) && ("bush" in ((getmodelinfo cursorObject) select 1)) && ((damage cursorObject) < 1)&& ( "ACE_wirecutter" in (items player))}] call ace_interact_menu_fnc_createAction;   
[player, 1, ["ACE_SelfActions"], _landscapeaction] call ace_interact_menu_fnc_addActionToObject;  
*/




//[5, [], {systemchat (str cursorObject)}, {}, "Questioning civilian..."] call ace_common_fnc_progressBar;