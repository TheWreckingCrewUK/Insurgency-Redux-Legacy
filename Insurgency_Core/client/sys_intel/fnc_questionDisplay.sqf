params["_removeQuestioning"];
_randNumber = floor(random 2);

[_removeQuestioning, player] remoteexec ["twc_ailookat", _removeQuestioning];

if (captive (_this select 0)) exitwith {hint "Civilians will not speak while handcuffed"};
//evilciv removed until I get remoteexec on the evilciv code, because addweapon isn't global
if ((random 1>0.9) && (!(_this select 0 in nonQuestionableList)) && (!(_this select 0 in goodcivlist))) exitwith {
[5, [_randNumber, _removeQuestioning], {}, {}, "Questioning civilian..."] call ace_common_fnc_progressBar
;[_this select 0] execvm "Insurgency_Core\server\sys_civ\evilCiv.sqf";};
	goodcivlist pushBack (_this select 0);
	publicVariable "goodcivlist";
[5, [_randNumber, _removeQuestioning], {[_this select 0] spawn InsP_fnc_possibleIntel;}, {}, "Questioning civilian..."] call ace_common_fnc_progressBar;

