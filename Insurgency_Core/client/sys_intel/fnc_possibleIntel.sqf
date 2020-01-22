_givenNumber = (_this select 0) select 0;
_civilianQuestioned = (_this select 0) select 1;
//adding in 100% certainty for the interpreter to weasle info out of someone, unless they've been questioned already
_isterp = player getvariable ["twc_isterp",0];
_hasmoney = (_civilianQuestioned getVariable ["twc_hasmoney",0]);
if ((_isterp == 1) || ((_hasmoney == 1) && ((random 1) > 0.5)) || (((headgear player) == "UK3CB_BAF_H_Beret_Mer") && ((random 1) > 0.5))) then {
_givenNumber = 0};
//systemChat str _givenNumber;
//[_civilianQuestioned] execvm "Insurgency_Core\server\sys_civ\evilCiv.sqf";

_textarray = [];
_text = "";

if (_civilianQuestioned in nonQuestionableList) then {
		switch (True) do {
			case (floor TWC_civMorale <= 15):{_textarray pushback "Stop harassing me, you bully with a gun!"};
			case (floor TWC_civMorale <= 20):{_textarray pushback "I've answered your questions already, leave me alone! You should actually do some good around here before accosting people like this."};
			case (floor TWC_civMorale <= 30):{_textarray pushback "Look, I tried to help you. I don't have anything more to say."};
			case (floor TWC_civMorale <= 40):{_textarray pushback "I've answered your questions already."};
			case (floor TWC_civMorale <= 50):{_textarray pushback "Hello again, I've actually told you what I know before."};
			case (floor TWC_civMorale <= 60):{_textarray pushback "I appreciate what you've done around here, but I'm afraid I have nothing more to give you."};
			case (floor TWC_civMorale <= 70):{_textarray pushback "I'm glad you're here but I've told you what I know already."};
			case (floor TWC_civMorale <= 90):{_textarray pushback "I'm really happy that you guys are helping us, but I don't have any more information than last time you asked."};
			case (floor TWC_civMorale > 90):{_textarray pushback "I really wish I could tell you more, but I'm afraid I've said everything I know already."};
		};
}else{
	nonQuestionableList pushBack _civilianQuestioned;
	publicVariable "nonQuestionableList";

	if ((_givenNumber == 0) || (isserver)) then {
		switch (True) do {
			case (floor TWC_civMorale <= 15):{_textarray pushback "I've marked a location on your map, I hope you die trying to get there."};
			case (floor TWC_civMorale <= 20):{_textarray pushback "I'll mark a spot. Now LEAVE."};
			case (floor TWC_civMorale <= 30):{_textarray pushback "I saw something around this spot. I don't really know how to feel about you people at the moment but I hope you can do some good for us."};
			case (floor TWC_civMorale <= 45):{_textarray pushback "I'll mark the position on your map. I've begun to hear good things about your presence here, keep it up."};
			case (floor TWC_civMorale <= 60):{_textarray pushback "Hello, yes I heard about something. Let me mark the position on your map. I trust that you will help, I've heard good things about your presence here."};
			case (floor TWC_civMorale <= 75):{_textarray pushback "I hear stories of what you guys do, I'm happy you're here. I'll mark the position on your map of something I saw earlier."};
			case (floor TWC_civMorale <= 90):{_textarray pushback "I'm really glad you guys are here, I've heard very good things. I heard about something, I'll mark your map. Be careful."};
			case (floor TWC_civMorale > 90):{_textarray pushback "You people have done so much good for this region, I couldn't be more grateful. I've marked a spot on your map where I saw something earlier, I wish you the best of luck on your travels."};
			default {_textarray pushback "For some reason this Civilian doesn't know the morale status. Please inform management of this bug."};
		};
		_rand = (floor (random 5));
		
		
		if ((count twc_activemissions) > 0) then {_rand = (floor (random 7));};

		if (_rand <= 1)then{
		
		_rand = 3;
			/*	
		if ((count twc_activestrongholds) == 0) then {_rand = 3} else {
		
			_color = "ColorGreen";
			_objectpos = (twc_activestrongholds call BIS_fnc_selectRandom) select 0;
			_distance = 500 + ((floor (1 * (random 10))) * 500);
			_intelPos = [_objectpos, _distance] call CBA_fnc_randPos;
			_marker = createMarker [format["%1%2", _objectpos, (str _intelPos)], _intelPos];
			_marker setMarkerType "hd_join";
			_marker setMarkerColor _color;
			_marker setMarkerText (str(_distance) + "m: STRONGHOLD");
			_marker setMarkerSize [0.5,0.5];
			};
			*/
		};		
		
		//non-situation stuff like caches
		if (_rand == 2)then{
			_color = "ColorOrange";
			_cachearray = [];
			{
				_isdead = _x getvariable ["twccachehasbeenhit", 0];
				if (_isdead == 0) then {
					_cachearray pushback _x;
				};
			} foreach InsP_cacheGroup;
			_object = _cachearray call BIS_fnc_selectRandom;
			_distance = [250,500,500,750,750,1000,1000,1500,2000] call BIS_fnc_selectRandom;
			_precision = count (nearestObjects [_object, ["house"], 300]);
			_distance = ((round ((_distance / (1 + (_precision / 50))) / 50)) * 50) max 25;
			
			
			_intelPos = [_object, _distance] call CBA_fnc_randPos;
			_marker = createMarker [format["%1%2", _object, (str _intelPos)], _intelPos];
			_marker setMarkerType "hd_join";
			_marker setMarkerColor _color;
			_marker setMarkerText (str(_distance) + "m");
			_marker setMarkerSize [0.5,0.5];

			switch (_object) do {
				case (cacheBoxA): {cacheAMarkers pushBack _marker; publicVariable "cacheAMarkers"};
				case (cacheBoxB): {cacheBMarkers pushBack _marker; publicVariable "cacheBMarkers"};
				case (cacheBoxC): {cacheCMarkers pushBack _marker; publicVariable "cacheCMarkers"};
				default {hint "Something went wrong";};
			};
			switch (True) do {
				case (floor TWC_insMorale <= 15):{_textarray pushback " They should have a large amount of bombs and guns there, it may be all they have left."};
				case (floor TWC_insMorale <= 20):{_textarray pushback " I saw it with my own eyes, they have rockets and guns and all kinds of stuff sitting in a box."};
				case (floor TWC_insMorale <= 30):{_textarray pushback " My Brother says they have a box full of bombs in there, he says he's seen it."};
				case (floor TWC_insMorale <= 45):{_textarray pushback " Last I heard they were storing weapons and ammunition around this place."};
				case (floor TWC_insMorale <= 60):{_textarray pushback " I think there's a weapons cache there."};
				case (floor TWC_insMorale <= 75):{_textarray pushback " I heard they've got a room full of guns around here."};
				case (floor TWC_insMorale <= 90):{_textarray pushback " They've got bombs and rockets in a box here, sort that out and maybe the enemy can actually be pushed back."};
				case (floor TWC_insMorale > 90):{_textarray pushback " They are storing guns here, please just deal with it."};
				default {_textarray pushback "For some reason this Civilian doesn't know the morale status. Please inform management of this bug."};
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
		if (_rand == 3)then{
			_color = "ColorYellow";
			_object = InsP_iedGroup call BIS_fnc_selectRandom;
			_distance = [100,200] call BIS_fnc_selectRandom;
			_intelPos = [_object, _distance] call CBA_fnc_randPos;
			_marker = createMarker [format["%1%2", _object, (str _intelPos)], _intelPos];
			_marker setMarkerType "hd_join";
			_marker setMarkerColor _color;
			_marker setMarkerText (str(_distance) + "m");
			_marker setMarkerSize [0.5,0.5];
			_textarray pushback ([" They planted a bomb in the ground there.", " They've got a bomb set up with some very bad people ready to hurt you if you set it off", " I heard there was a bomb set there.", "I think someone made a bomb there", "Someone put a bomb in the road there and it’s messing with the public transport schedule, please deal with it", "There’s an IED there with fighters waiting somewhere around this area. You’ll live if God wills it."] call bis_fnc_selectrandom);
		};
		
		if (_rand >= 4)then{
			_color = "ColorBlue";
			_object = twc_activemissions call BIS_fnc_selectRandom;
			_objectname = _object select 1;
			_objectpos = _object select 0;
			_distance = 50 + ((floor (1 * (random 10))) * 50);
			_precision = count (nearestObjects [_object select 0, ["house"], 300]);
			_distance = ((round ((_distance / (1 + (_precision / 50))) / 50)) * 50) max 25;
			_intelPos = [_objectpos, _distance] call CBA_fnc_randPos;
			_marker = createMarker [format["%1%2", _objectpos, (str _intelPos)], _intelPos];
			_marker setMarkerType "hd_join";
			_marker setMarkerColor _color;
			_marker setMarkerText (str(_distance) + "m: " + _objectname);
			_marker setMarkerSize [0.5,0.5];
			if (_objectname == "hostage") then {
				_textarray pushback ([" They're holding someone hostage there", " They're holding someone there, I dont know who.", " They've got a reporter held hostage in there.", " They have a press man held prisoner last I heard.", " There’s a photographer being held hostage there, I heard he got an ankle picture of Warlord Abessha’s third wife and now he’s being tortured until he gives it up", " There’s a Daily Mail writer being held hostage there. Probably no big loss if he dies, but you should probably at least have a go at rescuing him", "I heard a journalist is being held hostage there, my brother says he saw a man looking like a frog so I’m pretty sure it’s Ross Kemp", " My brother was kidnapped and he’s being held there. He’s wearing a press outfit but he’s not actually a journalist. Anyway, if you could rescue him and bring him back to your cutting edge medical facilities that would be great, he has some dental issues that we’re too poor to fix right now and that seems a suitable compensation for the trauma he’s being put through"] call bis_fnc_selectrandom);
			};
			if (_objectname == "hvt") then {
				_textarray pushback ([" I heard that the bastard son of Hitler and Jimmy Saville is living there", " A really bad man lives there, I heard he eats babies to consume their youth", " There's a man there, he takes people's heads if they don't obey him", " A reliable source told me Jeffrey Epstein’s caretaker is living there", " Some idiot got hold of a golden AK and now he thinks he’s hot shit", " A monster in human clothing lives there, he feasts on the souls of the unbelieving and tears flesh from infidels to clothe his family of devils", " There’s an old farmer there, he pledged to destroy any coalition forces that cross his path after an airstrike killed his wife a few years back, he’s been fighting ever since."] call bis_fnc_selectrandom);
			};
			if (_objectname == "minefield") then {
				_textarray pushback ([" My cousin stepped on a landmine somewhere around there, left over from the Russians.", " The rumour is there's dozens of old mines around there.", " The russians laid a load of mines there and never cleaned up after themselves.", " The russians didn't clean up after themselves at all, they left a load of landmines there. All these years and they still torment us."] call bis_fnc_selectrandom);
			};
			if (_objectname == "recovery") then {
				_textarray pushback ([" There's an army vehicle there, I think it needs recovering", " A vehicle was abandoned there by the good guys", " Some soldiers got hit by a bomb there and had to leave their vehicle behind"] call bis_fnc_selectrandom);
			};
		};
		
		
	}else{
	
		if (_hasmoney == 0) then {
			switch (True) do {
				case (((random 1) < 0.01) && ((count allplayers) > 2)):{_name = (name (selectrandom allplayers)); while {_name == name player} do {_name = (name (selectrandom allplayers))};_textarray pushback ("Hey, if you shoot " + _name + " I promise to give you every piece of information I have. Until then though, I have nothing for you.")};
				case (floor TWC_civMorale <= 15):{_textarray pushback "I wish nothing but death upon scum like you. The moment you invaded our country you showed your true selves as inbred worthless cowards. Nothing would give me more pleasure than seeing your bleeding corpse on the side of the road."};
				case (floor TWC_civMorale <= 20):{_textarray pushback "You've done bad things here, I've heard tales. Even if I did happen to know something I wouldn't tell you."};
				case (floor TWC_civMorale <= 30):{_textarray pushback "I can't help you, I don't know what to think about you people coming here but please leave our village."};
				case (floor TWC_civMorale <= 40):{_textarray pushback "I know you people have done well but I don't know anything."};
				case (floor TWC_civMorale <= 50):{_textarray pushback "I'd help you if I could but I'm afraid I don't know anything, sorry. I've heard stories of the good you've done here, but unfortunately nothing of use about our enemies."};
				case (floor TWC_civMorale <= 70):{_textarray pushback "I've heard a lot of good things about you people but I'm afraid I don't have any information for you"};
				case (floor TWC_civMorale <= 90):{_textarray pushback "I've heard many stories of all the good things that have been achieved since you came. However, I'm afraid I have nothing of use to you personally."};
				case (floor TWC_civMorale > 90):{_textarray pushback "I really wish I could help you, but I don't know anything."};
				default {_textarray pushback "For some reason this Civilian doesn't know the morale status. Please inform management of this bug."};
			};
		} else {
			switch (True) do {
				case (floor TWC_civMorale <= 20):{_textarray pushback "Did you think giving me money would suddenly make me know more? You're as bad as the insurgents, go away."};
				case (floor TWC_civMorale <= 30):{_textarray pushback "I appreciate the cash and everything but I don't actually know anything."};
				case (floor TWC_civMorale <= 40):{_textarray pushback "I know you people have done well and the money is great but I don't know anything."};
				case (floor TWC_civMorale <= 50):{_textarray pushback "I'd help you if I could but I'm afraid I don't know anything, sorry. Still appreciate the money though."};
				case (floor TWC_civMorale <= 70):{_textarray pushback "You guys are great and I'm so thankful for the money, but I'm afraid I don't know anything."};
				case (floor TWC_civMorale > 90):{_textarray pushback "Oh I'm so sorry, I don't actually know anything. Thanks again for the cash though!"};
				default {_textarray pushback "For some reason this Civilian doesn't know the morale status. Please inform management of this bug."};
			};
		
		};
	
	};
};


{_text = _text + _x} foreach _textarray;
hintsilent _text;