
#include "enemyWeapons.sqf";
#include "noFireInBase.sqf";
#include "noStealFromCrates.sqf";
#include "placedExplosives.sqf";
#include "vehicleSlots.sqf";



if (isNil "twc_sniperteam") then {
	twc_sniperteam = [];
	publicVariable "twc_sniperteam";
};



execvm "Insurgency_Core\client\sys_restrict\rolerestrictions.sqf";

execvm "Insurgency_Core\client\sys_restrict\sectioncount.sqf";


twc_fnc_legitgroup = {
	
	//legit group system
	(group player) setvariable ["twc_teamrestrictedgrp", 0, true];

	if (((group player) getVariable ["twc_attachrestrictedgrp",1]) == 0) then {
		(group player) setvariable ["twc_legitgrp", (time), true];
	};
	//last man, to de-legit the group when leaving
	[{(count units group (_this select 0)) == 1}, {(group (_this select 0)) setvariable ["twc_legitgrp", time - 36000 + 900, true]}, [player]] call CBA_fnc_waitUntilAndExecute;
};
