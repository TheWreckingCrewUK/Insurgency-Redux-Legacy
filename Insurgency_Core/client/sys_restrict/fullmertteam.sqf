/*
by [TWC] Hobbs
renders unit blind if there's not enough units in his group, like if a sniper team needs both players or an armour crew needs all 3.

Once they have enough, then it runs itself again to wait until the situation changes, so if someone drops out it renders the player blind again

*/




waitUntil {!isNull player};

waituntil {(count (units group player)) < 2};

if(!isMultiplayer)exitWith{};


if ((player distance (getmarkerpos "base")) > 300) then {
		_time = time + 500;
		
	hint "Your team is under strength, return to base within the next 10 minutes or get back up to strength";
		waituntil {((player distance (getmarkerpos "base")) > 300) || (_time < time)};
		sleep 100;
		
	};



cutText ["", "Black", 0.001];
player forceWalk true;

while {(count (units group player)) < 2}do{

cutText ["", "Black", 0.001];
    [
        "<t size='1.2'>MERT Team</t><br/><t size='0.6'>You need at least 2 members of the MERT team online to proceed</t>", 0, 0.22, 5, 0, 0, 2
    ] spawn bis_fnc_dynamictext;
	sleep 5;
	if ((player distance twc_basepos) > 10) then {
		player setpos twc_basepos;
	};
};
cutText ["","Black IN",5];
player forceWalk false;


execvm "Insurgency_Core\client\sys_restrict\fullmertteam.sqf";