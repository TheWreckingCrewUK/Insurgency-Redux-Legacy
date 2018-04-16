_check = call twc_terp_msgcheck;

//systemchat format ["check returns %1 for enemy message", _check];

if (_check == 1) then {

"You hear general insurgent chatter coming from nearby" remoteExec ["hint",twc_terp];

};