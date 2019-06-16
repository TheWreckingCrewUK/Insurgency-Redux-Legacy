/* written by [TWC] Hobbs
this will count the current number of groups, disregarding any groups that have infantry in their title, and assess whether the player can join an attachment instead of regular infantry.
*/

//first up, let's just go open season if there's more slots than our standard layout of infantry can manage

if (( count(allPlayers - entities "HeadlessClient_F")) > 28) exitwith {};

if (["HQ", str (group player)] call BIS_fnc_inString) exitwith {
execvm "Insurgency_Core\client\sys_restrict\platoonhq.sqf";
};
/*
if((["spotter", str (typeof player)] call BIS_fnc_inString) || (["sniper", str (typeof player)] call BIS_fnc_inString))then{
waituntil {(( count(allPlayers - entities "HeadlessClient_F")) >= 5)};
};
*/

_arr = missionnamespace getvariable ["twc_goodeggs", []];
_freepass = 0;

{
	if ((getPlayerUID _x) in _arr) then {
		_freepass = 1;
	};
} foreach (units group player);

if (_freepass == 1) exitwith {(group player) setvariable ["twc_attachrestrictedgrp", 0, true];};

if ((["Quartermaster", (typeof player)] call BIS_fnc_inString) && ([player] call TWC_Core_fnc_ismanagement)) exitwith {};

_pilots = ["Modern_British_HeliPilot","Modern_British_MERT_HeliPilot","2000_British_HeliPilot_Desert","2000_British_HeliPilot","1990_British_HeliPilot","1990_British_HeliPilot_Desert","Modern_British_MERT_HeliPilot"];

_groups = [];
_snowflakes=0;

{
	if (_x == leader _x) then {
		if (typeof player in _pilots) then {
			_snowflakes = _snowflakes + 1;
		};
		if (!(["infantry", str (group _x)] call BIS_fnc_inString)) then {
			if (!(["HQ", str (group _x)] call BIS_fnc_inString)) then {
				if (!(["heli", str (group _x)] call BIS_fnc_inString)) then {
					if (!(["blank", typeof _x] call BIS_fnc_inString)) then {
						if (!(["quartermaster", str (typeof _x)] call BIS_fnc_inString)) then {
							_groups pushback [group _x];
						};
					};
				};
			};
		};
	};
} foreach allplayers;


//testing a potential method of filling servers, if they're the first into the server then they get first pick of attachments
if ((( count(allPlayers - entities "HeadlessClient_F")) - _snowflakes) <= (count (units group player))) exitwith {
	(group player) setvariable ["twc_attachrestrictedgrp", 0, true];
};

//skip the system in the opening stages of the mission
if (time < 1800) exitwith {
	(group player) setvariable ["twc_attachrestrictedgrp", 0, true];
};

//quick sleep because instring is a bit slow
sleep 3;


//legit group system. If it's been less than 10 hours since the group was legitimately formed (with both the attachment slot system and the full team system recognising it) then skip the attachment slot system for new players. Does not interrupt the full team system so no lone wolves, instead allows players to join existing FST/SF/Armour teams when the payerbase is mixed between attachment/regular roles
if (((group player) getVariable ["twc_legitgrp",-999999]) > (time - 36000)) exitwith {
	(group player) setvariable ["twc_attachrestrictedgrp", 0, true];

};

_attachmentcount = count _groups;

//look at the playercount and do some maths to see if an attachment is viable. The standard gap is defined in server init and publicvariable, so that if something goes weird with the maths then it can be adjusted on the fly by admin

//intention is to have a sliding scale that puts people into regular infantry roles in the beginning and then lowers the gap to new attachments as the playercount increases to avoid a perpetually reserved slot scenario. simple approach for now

if (((_attachmentcount * twc_attachmentgap)+ 5) < ( count(allPlayers - entities "HeadlessClient_F")))

exitwith {
	(group player) setvariable ["twc_attachrestrictedgrp", 0, true];

	(group player) setvariable ["twc_legitgrp", time, true];

//systemchat format ["you good %1", ((_attachmentcount * twc_attachmentgap)+ 3)]
};

//now use the standard spawn restriction system to let the player know what's up
if(isserver)exitWith{
	systemchat "attachment restrict tripped but skipped for server";
};
cutText ["", "Black", 0.001];
player forceWalk true;

(group player) setvariable ["twc_attachrestrictedgrp", 1, true];


_freepass = 0;



while {((((_attachmentcount * twc_attachmentgap)+ 5) > ( count(allPlayers - entities "HeadlessClient_F"))) && (_Freepass == 0))} do {
cutText ["", "Black", 0.001];
    [ 
        format ["<t size='1.2'>Attachment Role</t><br/><t size='0.6'>There are currently no attachment roles available, join one of the regular infantry roles. %1 players need to be online for the next attachment to become available</t>", 
		
		ceil ((_attachmentcount * twc_attachmentgap)+ 5),
		( count(allPlayers - entities "HeadlessClient_F"))
		], 0, 0.22, 5, 0, 0, 2 
    ] spawn bis_fnc_dynamictext;
	
	_groups = [];
	_snowflakes=0;

	{
		if (_x == leader _x) then {
			if (typeof player in _pilots) then {
				_snowflakes = _snowflakes + 1;
			};
			if (!(["infantry", str (group _x)] call BIS_fnc_inString)) then {
				if (!(["HQ", str (group _x)] call BIS_fnc_inString)) then {
					if (!(["heli", str (group _x)] call BIS_fnc_inString)) then {
						if (!(["blank", typeof _x] call BIS_fnc_inString)) then {
							if (!(["quartermaster", str (typeof _x)] call BIS_fnc_inString)) then {
								_groups pushback [group _x];
							};
						};
					};
				};
			};
		};
	} foreach allplayers;
	
	sleep 5;

	_attachmentcount = count _groups;
	
	
	_arr = missionnamespace getvariable ["twc_goodeggs", []];
	{
		if ((getPlayerUID _x) in _arr) then {
			_freepass = 1;
		};
	} foreach (units group player);

};

(group player) setvariable ["twc_attachrestrictedgrp", 0, true];

if (((group player) getVariable ["twc_teamrestrictedgrp",1]) == 0) then {
	(group player) setvariable ["twc_legitgrp", time, true];
};
	
cutText ["","Black IN",5];
player forceWalk false;