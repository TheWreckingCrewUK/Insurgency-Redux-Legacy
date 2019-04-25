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

_array = [];

missionnamespace setvariable ["twc_cqbtargets", _array, true];


_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>CQB Course</t>"; 

 _text1 = "<br /><br />Existing units have been removed and the course is now clear.";
 
 _result = parsetext (_title + _text1);
 
 hint _result;