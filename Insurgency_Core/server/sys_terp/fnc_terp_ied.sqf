_check = call twc_terp_msgcheck;

//systemchat format ["check returns %1 for IED message", _check];

_ied = (twc_terp nearobjects ['pipebombbase', 500]) select 0;

_dis = ((ceil(((twc_terp distance _ied) + random 100) / 50)) / 2) * 100;


if (_check == 1) then {

format ["You hear chatter indicating an IED nearby, within approximately %1 meters of your current position",_dis] remoteExec ["hint",owner twc_terp];
};