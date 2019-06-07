_speaks = ["advance", "ATEASE", "attacke", "attackinge", "atthatposition", "cannotfire", "cantgetthereE", "cantshoot", "changeformation", "checkyourfireE", "clear", "contactE", "copy", "copymystance", "dangerE", "defense", "Disembark", "disengage", "doitnow", "donotfireE", "doyoureadQ", "drop that", "enemies", "enemyfireE", "engageatwill", "engagingE", "fallbackE", "fast", "fire", "fireatwill", "flankleft", "flankright", "follow", "forward", "fromme", "getbackE", "getdownE", "getinthat", "getsupportat", "gothimE", "guerilla", "heal", "healthat", "healyourself", "hesdownE", "holdfire", "icant", "inatthisposition", "imhit", "in", "ivegothimE", "left", "move", "moveto", "movetothat", "movetothatposition", "needhelpE", "negative", "NoTarget", "objects", "ofyou", "openupE", "outofammoE", "outoffuelE", "over", "ready", "readyfororders", "readytofire", "repeatlast", "requestingsupportto", "reverse", "right", "roger", "runningoutofammo", "runningoutoffuel", "scanhorizon", "slow", "standup", "stayalert", "stayback", "staycrouched", "stealth", "stopE", "supporting", "takecoverE", "takeit", "takingcommand", "targetinsight", "targetthat", "theygothim", "underfire", "understood", "waiting", "watch", "watchthatposition", "weapon", "weapons", "weaponshot", "whereareyouq", "woundedE", "you", "youthere"];

waituntil {((side player) != west)};

_voice = player getvariable ["twc_enemyvoice", "none"];

while {((side player) != west)} do {

	sleep (5 + (random 20));
	
	if ((side player) == west) exitwith {};
	{
		
		if (((side _x) == west) || (isserver)) then {
			if (((_x distance player) < 70) || (isserver)) then {
				_timeout = player getvariable ["twcenemy_lastshout", -999];
				if ((_timeout < (time - (15 + (random 10))))) then {
					
					_chosenspeak = _speaks call bis_fnc_selectrandom;
					
					if (!(player getVariable ["ACE_isUnconscious", false])) then {
						
						playSound3D ["CUP\Dubbing\CUP_Dubbing_Radio_TK\RadioProtocol\" + _voice + "\STEALTH\" + _chosenspeak +".ogg", player, false, getPosasl player, 2, 1, 40];
						player setvariable ["twcenemy_lastshout", time];
					};
				};
			};
		};
	} foreach allplayers;
};

