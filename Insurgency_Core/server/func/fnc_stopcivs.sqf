/*
by [TWC] Hobbs
Stops civilians in a nearby area from running for a small period
*/

params["_pos", "_player"];


{
	if (((str side _x) == "CIV") && ((_pos distance _x) < 20)) then {
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
		_x reveal [_player, 4]
		}
} foreach (_pos nearentities ["man",60]);