//generic hint to tell the player they can't access a particular piece of equipment, and how many people they need to access it along with how many they currently have.

_count = _this select 0;
_currentcount = ( count(allPlayers - entities "HeadlessClient_F"));


	_title  = "<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'>Not Enough Players</t>";



	if (_Currentcount > 1) then {
	_text1 = "<br />There are ";
	_text2 = " players in the server.";
	_text3 = "<br />You need more than ";
	_text4 = " to be able to access this equipment";
	hint parseText (_title + _text1 + str _currentcount + _text2 + _text3 + str _count + _text4);
	} else
	{
	_text1 = "<br />You're the only player on the server.";
	_text3 = "<br />You need more than ";
	_text4 = " to be able to access this equipment";
	
	
	hint parseText (_title + _text1 + _text3 + str _count + _text4);
	};
