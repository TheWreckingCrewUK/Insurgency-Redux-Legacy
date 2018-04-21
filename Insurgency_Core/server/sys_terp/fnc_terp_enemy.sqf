//_check = call twc_terp_msgcheck;

{ 
 if (_x isKindOf "twc_ana_interpreter") then { 
 
twc_terp = _x;
publicVariable "twc_terp"}; 
} forEach allUnits; 

if (isnull twc_terp) then {_check=0} else {

If (terptimer >0) exitwith {_check=0};

If (terpChannel != twc_enemychannel) exitwith {_check=0};

[40] call twc_terp_timer;
_check = 1;
};

//systemchat format ["check returns %1 for enemy message", _check];

if (_check == 1) then {

"You hear general insurgent chatter coming from nearby" remoteExec ["hint",twc_terp];

};