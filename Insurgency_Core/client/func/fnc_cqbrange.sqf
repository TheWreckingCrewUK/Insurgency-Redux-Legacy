params [["_iscomplex", false]];

{
	if ((getpos _x) inarea "cqbrange") exitwith {
		hint "There are players already on the course. Unable to reset";
	};
} foreach allplayers;


{
	if (!isnull _x) then {
		deletevehicle _x
	};
} foreach (missionnamespace getvariable ["twc_cqbtargets", []]);

_first = 1;
_t = (missionnamespace getvariable ["twc_cqbtargets", []]);
if (count _t == 0) then {
	_first = 0;
};

[_iscomplex] remoteexec ["twc_fnc_startcqbrangeserver", 2];


_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>CQB Course</t><br /><br />"; 
_text1 = "";

if (_first == 0) then {
	_text1 = "The Course is now live. Enemy units have been placed in random locations within the warehouse.";
} else {
	_text1 = "The Course has been restarted. Preexisting units have been removed and fresh enemy units placed.";
};
if (_iscomplex) then {
	if (_first == 0) then {
		_text1 = "The Course is now live. Enemy units and civilians have been placed in random locations within the warehouse.";
	} else {
		_text1 = "The Course has been restarted. Preexisting units have been removed and fresh enemy units and civilians placed.";
	};
};

 
 _result = parsetext (_title + _text1);
 
 hint _result;