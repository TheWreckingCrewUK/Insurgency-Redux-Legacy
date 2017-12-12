/*_shell = _this select 1;
//currently commented out while in wip status. Current issue is that it doesn't always look at the target.
_d20= random 20;
if (idfreported == 1) then {
sleep 5;
cram lookat _shell;
sleep 3;

while {alarm ==1} do{
[cram, "M61_Vulcan_CIWS"] call BIS_fnc_fire;
sleep 0.1;
cram lookat _shell;
};
sleep 0.5;
_shellpos = getposatl _shell;

sleep 0.2;
if (_D20 > 2) then {
deletevehicle _shell;
};
cram setvehicleammo 1;
sleep 1;

cram lookat objnull;

};
*/