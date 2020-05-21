//SF

if (typeof player == "Modern_UKSF_2IC") then {
	player setvariable ["twc_loadoutrole", "2IC"];
};

if (typeof player == "Modern_UKSF_Squadleader") then {
	player setvariable ["twc_loadoutrole", "sl"];
};

if (typeof player == "Modern_UKSF_Base") then {
	player setvariable ["twc_loadoutrole", "rifleman"];
};

if (typeof player == "Modern_UKSF_Pointman") then {
	player setvariable ["twc_loadoutrole", "pointman"];
};

if (typeof player == "Modern_UKSF_Grenadier") then {
	player setvariable ["twc_loadoutrole", "Grenadier"];
};

if (typeof player == "Modern_UKSF_Marksman") then {
	//player setvariable ["twc_loadoutrole", "Marksman"];
};

if (typeof player == "Modern_UKSF_Base") then {
	player setvariable ["twc_loadoutrole", "rifleman"];
};

if (typeof player == "Modern_UKSF_Medic") then {
	player setvariable ["twc_loadoutrole", "Medic"];
};

//Heli crew

if (typeof player == "Modern_British_HeliPilot") then {
	player setvariable ["twc_loadoutrole", "helipilot"];
};

if (typeof player == "Modern_British_crewchief") then {
	player setvariable ["twc_loadoutrole", "crewchief"];
};

//FST

if (typeof player == "Modern_British_FSTCommander") then {
	player setvariable ["twc_loadoutrole", "sl"];
};

if (typeof player == "Modern_British_FSTAssistant") then {
	player setvariable ["twc_loadoutrole", "assistant"];
};

if (typeof player == "Modern_British_FSTForwardObserver") then {
	player setvariable ["twc_loadoutrole", "observer"];
};

//fixed wing

if (typeof player == "Modern_British_FAC") then {
	player setvariable ["twc_loadoutrole", "jtac"];
};

//sniper

if (typeof player == "Modern_British_Sniper_coin") then {
	player setvariable ["twc_loadoutrole", "shooter"];
};

if (typeof player == "Modern_British_Spotter_coin") then {
	//player setvariable ["twc_loadoutrole", "spotter"];
};

_isdone = player getvariable ["twc_loadoutrole", ""];

if (_isdone == "") then {
	_text = getText (configFile >> "CfgVehicles" >> typeof player >> "twc_loadoutstring");
	player setvariable ["twc_loadoutrole", _text];
};

_isdone = player getvariable ["twc_loadoutrole", ""];

if (_isdone == "") then {
	_text = getText (configFile >> "CfgVehicles" >> typeof player >> "displayname");
	player setvariable ["twc_loadoutrole", _text];
};
