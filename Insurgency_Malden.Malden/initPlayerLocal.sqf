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
twc_restrictedCrates = ["Box_NATO_Ammo_F","ACE_medicalSupplyCrate","Box_Nato_AmmoOrd_F","CUP_BAF_IEDBox","Box_IED_Exp_F","twc_SuppliesBox"];

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
	],
	
	["UK3CB_BAF_Wildcat_AH1_CAS_8A", 
		["driver", 
			["Modern_British_HeliPilot"]
		],
		["commander", 
			["Modern_British_JetPilot","Modern_USMC_HeliPilot"]
		]
	],
	
	["RHS_UH60M_D", 
		["driver", 
			["Modern_USMC_HeliPilot"]
		],
		["commander", 
			["Modern_British_JetPilot","Modern_USMC_HeliPilot"]
		]
	]
];
//Items creatable from supplies boxes
twc_supplyBoxBuildables = [["ACE_ConcertinaWireCoil",500],["twc_Land_BagFence_Corner_F",100],["twc_Land_BagFence_Long_F",100],["twc_Land_BagFence_Short_F",100],["twc_Land_BagFence_End_F",100],["twc_Land_BagFence_Round_F",100],["twc_Land_BagBunker_Small_F",1000]];

//Slot Restrictions. TBA when we are doing more then just testing
_justPlayers = count(allPlayers - entities "HeadlessClient_F");
if(false)then{
	["End2", false, 0] call BIS_fnc_endMission;
};

execVM "Insurgency_Core\client\init.sqf";