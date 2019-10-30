
params ["_unit"];

_speaks = ["advance", "ATEASE", "attacke", "attackinge", "atthatposition", "cannotfire", "cantgetthereE", "cantshoot", "changeformation", "checkyourfireE", "clear", "contactE", "copy", "copymystance", "dangerE", "defense", "Disembark", "disengage", "doitnow", "donotfireE", "doyoureadQ", "drop that", "enemies", "enemyfireE", "engageatwill", "engagingE", "fallbackE", "fast", "fire", "fireatwill", "flankleft", "flankright", "follow", "forward", "fromme", "getbackE", "getdownE", "getinthat", "getsupportat", "gothimE", "guerilla", "heal", "healthat", "healyourself", "hesdownE", "holdfire", "icant", "inatthisposition", "imhit", "in", "ivegothimE", "left", "move", "moveto", "movetothat", "movetothatposition", "needhelpE", "negative", "NoTarget", "objects", "ofyou", "openupE", "outofammoE", "outoffuelE", "over", "ready", "readyfororders", "readytofire", "repeatlast", "requestingsupportto", "reverse", "right", "roger", "runningoutofammo", "runningoutoffuel", "scanhorizon", "slow", "standup", "stayalert", "stayback", "staycrouched", "stealth", "stopE", "supporting", "takecoverE", "takeit", "takingcommand", "targetinsight", "targetthat", "theygothim", "underfire", "understood", "waiting", "watch", "watchthatposition", "weapon", "weapons", "weaponshot", "whereareyouq", "woundedE", "you", "youthere"];

_mode = "yellow";

_combatspeaks = ["CS_ChangingMagsE", "CS_CheckThatOut", "CS_ContactE", "CS_CoveringFire2E", "CS_CoveringFireE", "CS_CoveringGoE", "CS_CoverMeE", "CS_CoverMeReloadingE", "CS_DidYouSeeThatQ", "CS_EnemyE", "CS_EngagingE", "CS_FireInTheHoleE", "CS_FocusE", "CS_FragOutE", "CS_GoE", "CS_GoIllCoverE", "CS_GoImCoveringE", "CS_GottaReloadE", "CS_GrenadeE", "CS_HangOnIllSuppressEmE", "CS_HeeeyE", "CS_HostilesE", "CS_IncomingFragE", "CS_MotherfuckerE", "CS_MoveE", "CS_MoveOutE", "CS_MovingE", "CS_MovinOutE", "CS_NoE", "CS_OKLetsGo", "CS_ReloadingE", "CS_SeeThatQE", "CS_SmokeOutE", "CS_SuppressingE", "CS_SuppressiveFireE", "CS_ThrowingFragE", "CS_ThrowingSmokeE"];


_voice = _unit getvariable ["twc_aivoice", "none"];
if (_voice == "none") then {
	_voice = (["male01tk", "male02tk", "male03tk", "male04tk", "male05tk"] call bis_fnc_selectrandom);
	_unit setvariable ["twc_aivoice", _voice];
};

while {(alive _unit) && (!([(getpos _unit),50] call twc_fnc_posNearPlayers))} do {
	sleep 60;
};

while {(alive _unit) && (([(getpos _unit),50] call twc_fnc_posNearPlayers))} do {
	_mode = combatmode (group _unit);
	
	_chosenspeak = _speaks call bis_fnc_selectrandom;
	_modepath = "\default\";
	if (_mode == "red") then {
		_chosenspeak = _combatspeaks call bis_fnc_selectrandom;
		_modepath = "\default\combat\";
	};

	playSound3D ["CUP\Dubbing\CUP_Dubbing_Radio_TK\RadioProtocol\" + _voice + _modepath + _chosenspeak +".ogg", player, false, getPosasl player, 3, 1, 40];
	sleep (20 + (random 20));
};

if (!(alive _unit)) exitwith {};

[_unit] spawn twc_fnc_enemychatter;