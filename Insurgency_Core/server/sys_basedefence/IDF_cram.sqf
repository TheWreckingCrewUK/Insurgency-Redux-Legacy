/*systemchat "cram notified";
params ["_shell"];

if (cramactive == 1) exitwith {};
cramactive = 1;

if (crampresent == 1) then{
systemchat format ["cram sees %1", vehicle _shell];
//currently commented out while in wip status. Current issue is that it doesn't always look at the target.
_d20= random 20;
systemchat "cram has data";
if (idfreported == 1) then {
//systemchat "cram has permission";
sleep 5;
cram lookat _shell;
systemchat "cram is targetting";
sleep 3;

while {alarm ==1} do{
[cram, "M61_Vulcan_CIWS"] call BIS_fnc_fire;
sleep 0.1;
((crew cram) select 0) lookat _shell;
};
sleep 0.5;
_shellpos = getposatl _shell;

sleep 0.2;
if (_D20 > -2) then {
deletevehicle _shell;
};
cram setvehicleammo 1;
sleep 1;
waituntil {alarm == 0};
//cram lookat objnull;

};
};
cram doArtilleryFire [position player, "M61_Vulcan_CIWS",4]