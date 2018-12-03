/*
by [TWC] Hobbs
Stops civilians in a nearby area from running for a small period
*/

params["_pos", "_player"];


{
if (!(_x == _player)) then {
	if (((str side _x) == "CIV") && ((_pos distance _x) < 30)) then {
		_x disableai "path";
		_x disableai "move";
		_x disableai "fsm";
		_x setUnitPos "down";
		
		 
   switch (round(random 2)) do { 
    case 0:{_x playMoveNow "ApanPknlMstpSnonWnonDnon_G01";}; 
    case 1:{_x playMoveNow "ApanPknlMstpSnonWnonDnon_G01";}; 
    case 2:{_x playMoveNow "ApanPpneMstpSnonWnonDnon_G01";}; 
    default{_x playMoveNow "ApanPpneMstpSnonWnonDnon_G01";}; 
   };
		[_x] spawn {
			params["_civ"];
			//_x setdamage 1;
			sleep 10;
			_civ enableai "path";
			_civ enableai "move";
			_civ enableai "fsm";
			_civ setUnitPos "auto"
			};
			} else {
			_x reveal [_player, 4];
			_sup = (getSuppression _x);
			if (((_pos distance _x) < 10)) then {
				//systemchat format ["%1", (_sup - 0.4)];
			};
			if (((random 1) < (_sup - 0.4)) && ((_pos distance _x) < 10)) then {
				["ace_captives_setSurrendered",[_x,true]] call CBA_fnc_globalEvent;
			};
		};
	};
} foreach (_pos nearentities ["man",70]);