
params ["_shell", "_override"];

if (isnil "crampresent") exitwith {
//systemchat "no cram"
};

cram disableai "autotarget";

if (isnil "cramactive") then {cramactive = 0};

if (isnil "_override") then {_override = 0};


//systemchat format ["cram sees %1", vehicle _shell];
//currently commented out while in wip status. Current issue is that it doesn't always look at the target.
_d20= random 20;
_complete = 0;

	if ( cramactive == 0) then {
		waituntil {(idfon == 1)}};


//systemchat "cram has permission";
_dir = cram getreldir _shell;

_pos = getpos _shell;
cram lookat [(_pos select 0),(_pos select 1),(_pos select 2)+300];


while {((cram animationPhase "sightscorrectionv_vertical") < 0.1) && (!(
(((((direction cram) - _dir) < 20) && (((direction cram) - _dir) > -1)) || ((((direction cram) - _dir) > -20) && (((direction cram) - _dir) < 1))))


)} do{
_pos2 = getpos _shell;
if (!(str _pos2 == "[0,0,0]")) then {_pos = _pos2};
cram lookat [(_pos select 0),(_pos select 1),(_pos select 2)+100];
sleep 0.2;
//systemchat "cram is targetting";
};
sleep 1;
cramactive = 1;

_time = time;

Waituntil {((getposatl _shell select 2) > 60)|| (((vectorMagnitude (velocity _shell)) > 160) && ((getposatl _shell select 2) > 20))};

_chance = 18;
if ((vectorMagnitude (velocity _shell)) > 160) then {_chance = 15};

while {(((getposatl _shell select 2) > 60) || (((vectorMagnitude (velocity _shell)) > 160) && ((getposatl _shell select 2) > 20))) && (_complete == 0)} do{

if ((cram animationPhase "sightscorrectionv_vertical") > 0.12) then {

_d20= random 20;
cramactive = 1;


for "_i" from 1 to 10 do {
_pos2 = getpos _shell;
if (!(str _pos2 == "[0,0,0]")) then {_pos = _pos2};
((crew cram) select 0) lookat _pos;


[cram, currentweapon cram] call BIS_fnc_fire;

sleep 0.001;
};


if (_D20 > _chance) then {
[_shell] spawn {
params ["_shell"];
sleep 1;
_pos = getpos _shell;


//systemchat format ["%1", _pos];


deletevehicle _shell;
'rhs_ammo_ptb1500' createvehicle _pos;
_complete = 1;

		if (1 == 1) exitwith {
cram setvehicleammo 1;
sleep 15;
if ((cram ammo (currentWeapon cram)) == 1550) then {
//cram lookat objnull;cram doWatch objnull;
cramactive = 0};

sleep 600;
if (cramactive == 0) then {cram lookat objnull;cram doWatch objnull;};
		};
};
};



};
};
sleep 0.5;

cram setvehicleammo 1;

//systemchat "fire complete";

sleep 15;
if ((cram ammo (currentWeapon cram)) == 1550) then {
//cram lookat objnull;cram doWatch objnull;
cramactive = 0};
