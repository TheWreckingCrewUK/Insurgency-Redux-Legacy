/*
by [TWC] Hobbs
renders unit blind if there's not enough units in his group, like if a sniper team needs both players or an armour crew needs all 3.

Once they have enough, then it runs itself again to wait until the situation changes, so if someone drops out it renders the player blind again

*/

if(isserver)exitWith{};
waitUntil {!isNull player};


waituntil {(count (units group player)) < 4};

//if it's been more than half an hour since they last respawned, and they're more than 1km from base then they can have it
if (((twc_lastspawned < (time - 1800)) && ((player distance twc_basepos) > 1000))||((twc_lastspawned < (time - 60)) && ((player distance twc_basepos) > 4000))) exitwith {};

cutText ["", "Black", 0.001];
player forceWalk true;


(group player) setvariable ["twc_teamrestrictedgrp", 1, true];

while {(count (units group player)) < 4}do{
	
cutText ["", "Black", 0.001];

    [
        "<t size='1.2'>SAS Section</t><br/><t size='0.6'>You need at least 4 people in the SAS Section before you can proceed</t>", 0, 0.22, 5, 0, 0, 2
    ] spawn bis_fnc_dynamictext;
	sleep 5;
};
cutText ["","Black IN",5];
player forceWalk false;

//legit group system
(group player) setvariable ["twc_teamrestrictedgrp", 0, true];

if (((group player) getVariable ["twc_attachrestrictedgrp",1]) == 0) then {
	(group player) setvariable ["twc_legitgrp", time, true];
};

//last man, to de-legit the group when leaving
[] spawn {
	waituntil {(count (units group player)) == 1};
	(group player) setvariable ["twc_legitgrp", -99999, true];
};	


execvm "Insurgency_Core\client\sys_restrict\fullsfteam.sqf";