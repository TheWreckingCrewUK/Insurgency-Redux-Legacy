_givenNumber = (_this select 0) select 0;
_civilianQuestioned = (_this select 0) select 1;
//systemChat str _givenNumber;
//[_civilianQuestioned] execvm "Insurgency_Core\server\sys_civ\evilCiv.sqf";
if (_civilianQuestioned in nonQuestionableList) then {
		switch (True) do {
			case (floor TWC_civMorale <= 15):{hintSilent "Stop harassing me, you bully with a gun!"};
			case (floor TWC_civMorale <= 20):{hintSilent "I've answered your questions already, leave me alone! You should actually do some good around here before accosting people like this."};
			case (floor TWC_civMorale <= 30):{hintSilent "Look, I tried to help you. I don't have anything more to say."};
			case (floor TWC_civMorale <= 40):{hintSilent "I've answered your questions already."};
			case (floor TWC_civMorale <= 50):{hintSilent "Hello again, I've actually told you what I know before."};
			case (floor TWC_civMorale <= 60):{hintSilent "I appreciate what you've done around here, but I'm afraid I have nothing more to give you."};
			case (floor TWC_civMorale <= 70):{hintSilent "I'm glad you're here but I''ve told you what I know already."};
			case (floor TWC_civMorale <= 90):{hintSilent "I'm really happy that you guys are helping us, but I don't have any more information than last time you asked."};
			case (floor TWC_civMorale > 90):{hintSilent "I really wish I could tell you more, but I'm afraid I've said everything I know already."};
		};
}else{
	nonQuestionableList pushBack _civilianQuestioned;
	publicVariable "nonQuestionableList";

	if (_givenNumber == 0) then {
		switch (True) do {
			case (floor TWC_civMorale <= 15):{hintSilent "I've marked a location on your map, I hope you die trying to get there."};
			case (floor TWC_civMorale <= 20):{hintSilent "I'll mark a spot. Now LEAVE."};
			case (floor TWC_civMorale <= 30):{hintSilent "I saw something around this spot. I don't really know how to feel about you people at the moment but I hope you can do some good for us."};
			case (floor TWC_civMorale <= 45):{hintSilent "I'll mark the position on your map. I've begun to hear good things about your presence here, keep it up."};
			case (floor TWC_civMorale <= 60):{hintSilent "Hello, yes I heard about something. Let me mark the position on your map. I trust that you will help, I've heard good things about your presence here."};
			case (floor TWC_civMorale <= 75):{hintSilent "I hear stories of what you guys do, I'm happy you're here. I'll mark the position on your map of something I saw earlier."};
			case (floor TWC_civMorale <= 90):{hintSilent "I'm really glad you guys are here, I've heard very good things. I heard about something, I'll mark your map. Be careful."};
			case (floor TWC_civMorale > 90):{hintSilent "You people have done so much good for this region, I couldn't be more grateful. I've marked a spot on your map where I saw something earlier, I wish you the best of luck on your travels."};
			default {hintSilent "For some reason this Civilian doesn't know the morale status. Please inform management of this bug."};
		};
		_rand = (floor (random 4));
		if (_rand <= 2)then{
			_color = "ColorOrange";
			_object = InsP_cacheGroup call BIS_fnc_selectRandom;
			_distance = [250,500,500,750,750,1000,1000,1500,2000] call BIS_fnc_selectRandom;
			_intelPos = [_object, _distance] call CBA_fnc_randPos;
			_marker = createMarker [format["%1%2", _object, (str _intelPos)], _intelPos];
			_marker setMarkerType "hd_join";
			_marker setMarkerColor _color;
			_marker setMarkerText (str(_distance) + "m");
			_marker setMarkerSize [0.5,0.5];

			switch (str _object) do {
				case (str (InsP_cacheGroup select 0)): {cacheAMarkers pushBack _marker; publicVariable "cacheAMarkers"};
				case (str (InsP_cacheGroup select 1)): {cacheBMarkers pushBack _marker; publicVariable "cacheBMarkers"};
				case (str (InsP_cacheGroup select 2)): {cacheCMarkers pushBack _marker; publicVariable "cacheCMarkers"};
				default {hint "Something went wrong";};
			};
		};
/*
		if (_rand == 2)then{
			_color = "ColorBlue";
			_object = InsP_aaGroup call BIS_fnc_selectRandom;
			_distance = [250,500,500,750,750,1000,1000,1500] call BIS_fnc_selectRandom;
			_intelPos = [_object, _distance] call CBA_fnc_randPos;
			_marker = createMarker [format["%1%2", _object, (str _intelPos)], _intelPos];
			_marker setMarkerType "hd_join";
			_marker setMarkerColor _color;
			_marker setMarkerText (str(_distance) + "m");
			_marker setMarkerSize [0.5,0.5];

			switch (str _object) do {
				case (str (InsP_aaGroup select 0)): {aaGunAMarkers pushBack _marker; publicVariable "aaGunAMarkers"};
				case (str (InsP_aaGroup select 1)): {aaGunBMarkers pushBack _marker; publicVariable "aaGunBMarkers"};
				default {hint "Something went wrong";};
			};
		};
*/
		if (_rand >= 3)then{
			_color = "ColorYellow";
			_object = InsP_iedGroup call BIS_fnc_selectRandom;
			_distance = [100,200] call BIS_fnc_selectRandom;
			_intelPos = [_object, _distance] call CBA_fnc_randPos;
			_marker = createMarker [format["%1%2", _object, (str _intelPos)], _intelPos];
			_marker setMarkerType "hd_join";
			_marker setMarkerColor _color;
			_marker setMarkerText (str(_distance) + "m");
			_marker setMarkerSize [0.5,0.5];
		};
	}else{
		switch (True) do {
			case (floor TWC_civMorale <= 15):{hintSilent "I wish nothing but death upon scum like you. The moment you invaded our country you showed your true selves as inbred worthless cowards. Nothing would give me more pleasure than seeing your bleeding corpse on the side of the road."};
			case (floor TWC_civMorale <= 20):{hintSilent "You've done bad things here, I've heard tales. Even if I did happen to know something I wouldn't tell you."};
			case (floor TWC_civMorale <= 30):{hintSilent "I can't help you, I don't know what to think about you people coming here but please leave our village."};
			case (floor TWC_civMorale <= 40):{hintSilent "I know you people have done well but I don't know anything."};
			case (floor TWC_civMorale <= 50):{hintSilent "I'd help you if I could but I'm afraid I don't know anything, sorry. I've heard stories of the good you've done here, but unfortunately nothing of use about our enemies."};
			case (floor TWC_civMorale <= 70):{hintSilent "I've heard a lot of good things about you people but I'm afraid I don't have any information for you"};
			case (floor TWC_civMorale <= 90):{hintSilent "I've heard many stories of all the good things that have been achieved since you came. However, I'm afraid I have nothing of use to you personally."};
			case (floor TWC_civMorale > 90):{hintSilent "I really wish I could help you, but I don't know anything."};
			default {hintSilent "For some reson this Civilian doesn't know the morale status. Please inform management of this bug."};
		};
	};
};