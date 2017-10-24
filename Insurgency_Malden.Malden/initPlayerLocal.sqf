//Disable hearing ai talk
enableSentences false;
 
//Enable or Disable Debug
twc_playerDebug = false;

player setVariable ["wantingSurrender",false];

twc_restrictedPrimaryWeapons = [""];
twc_restrictedSecondaryWeapons = [""];
twc_restrictedHangunWeapons = [""];
twc_FOAllowedPlayers = ["Modern_British_Squadleader"];

//Scoreable boxes and boxes players cant steal from. Pretty sure these will remain the same
twc_scoreableAmmoBoxes = ["Box_NATO_Ammo_F","ACE_medicalSupplyCrate","Box_Nato_AmmoOrd_F"];
twc_restrictedCrates = ["Box_NATO_Ammo_F","ACE_medicalSupplyCrate","Box_Nato_AmmoOrd_F"];

// Here be the list of vehicles, its restricted slots and players exempt from that
// always class names of the objects, including the player (so for example British Pilot = Modern_British_heliPilot)

// FORMAT:
// ["vehicle class name", ["slot name", ["acceptable person 1", ...]]],
// known slot names (verbatim): "driver", "gunner", "commander", "Turret", or "cargo"
twc_restrictedVehicleSlots = [
	["CUP_B_C130J_GB", 
		["driver", 
			["Modern_British_JetPilot"]
		],
		["commander", 
			["Modern_British_JetPilot"]
		]
	],
	
	["CUP_B_C130J_Cargo_GB",
		["driver",
			["Modern_British_JetPilot"]
		],
		["commander", 
			["Modern_British_JetPilot"]
		]
	]
];
//Slot Restrictions. TBA when we are doing more then just testing
_justPlayers = count(allPlayers - entities "HeadlessClient_F");
if(false)then{
	["End2", false, 0] call BIS_fnc_endMission;
};

execVM "Insurgency_Core\client\init.sqf";