
params ["_shell", "_override"];

if ((isnil "crampresent") && (crampresent == 0)) exitwith {
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


_dir = cram getreldir _shell;

cram setvehicleammo 1;

//systemchat format ["%1", _shell];

_pos = getpos _shell;

cram disableai "autotarget";
cram disableai "autocombat";
cram disableai "fsm";

cram lookat [(_pos select 0),(_pos select 1),(_pos select 2)+300];


while {((cram animationPhase "sightscorrectionv_vertical") < 0.1)

} do{
_pos2 = getpos _shell;
if (!(str _pos2 == "[0,0,0]")) then {_pos = _pos2};
cram lookat [(_pos select 0),(_pos select 1),(_pos select 2)+100];
sleep 0.2;
//systemchat "cram is targetting";
};
sleep 1;


//systemchat "cram is ready";
_time = time;

Waituntil {((((getposatl _shell select 2) > 60)|| (((vectorMagnitude (velocity _shell)) > 160) && ((getposatl _shell select 2) > 20))) && ((_shell distance cram) < 2000)) || !alive _shell};

_size = sizeof typeof _shell;
if (!alive _shell )exitwith {cram lookat objnull};
cramactive = 1;
cram setvehicleammo 1;
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
systemchat "woo";
cram setvehicleammo 1;
sleep 0.001;
};
//systemchat format ["%1", (vectorMagnitude (velocity _shell))];

//harder = higher

_chance = ((8 * (1 + ((_shell distance cram)/1000))) * (0.7 + (((vectorMagnitude (velocity _shell)) + 1) / 250)) / (1 + (_size / 15)));
systemchat format ["%1", sizeof typeof _shell];
if (_D20 > _chance) then {
[_shell] spawn {
params ["_shell"];
sleep 1;
_pos = getpos _shell;

systemchat "shell defeated";
deletevehicle _shell;
_complete = 1;

		if (1 == 1) exitwith {
cram setvehicleammodef 1;
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


//systemchat "fire complete";

sleep 15;
if ((cram ammo (currentWeapon cram)) == 1550) then {
//cram lookat objnull;cram doWatch objnull;
cramactive = 0;

cram setvehicleammo 0;
};
