params["_removeQuestioning"];
_randNumber = floor(random 2);
if (random 1>0.95) exitwith {
[5, [_randNumber, _removeQuestioning], {}, {}, "Questioning civilian..."] call ace_common_fnc_progressBar
;[_this select 0] execvm "Insurgency_Core\server\sys_civ\evilCiv.sqf";};
[5, [_randNumber, _removeQuestioning], {[_this select 0] spawn InsP_fnc_possibleIntel;}, {}, "Questioning civilian..."] call ace_common_fnc_progressBar;

