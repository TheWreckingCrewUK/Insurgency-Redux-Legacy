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

	
		["CUP_B_MCV80_GB_D_SLAT",[ 
		["driver", 
			["Modern_British_VehicleCrew"]
		],
		["gunner", 
			["Modern_British_VehicleCrew"]
		],
		["commander", 
			["Modern_British_VehicleCommander"]
		]],5
	],
	
		["CUP_B_LAV25_desert_USMC",[ 
		["driver", 
			["Modern_USMC_VehicleCrew"]
		],
		["gunner", 
			["Modern_USMC_VehicleCrew"]
		],
		["commander", 
			["Modern_USMC_VehicleCommander"]
		]],5
	],
		
	
		["twc_public_c5_hercules", [
		["driver", 
			["Modern_British_JetPilot"]
		],
		["turret", 
			["Modern_British_JetPilot"]
		]],14
	],
	
		["CUP_B_C130J_Cargo_GB",[
		["driver",
			["Modern_British_JetPilot"]
		],
		["turret", 
			["Modern_British_JetPilot"]
		]],14
	],
	
		["UK3CB_BAF_Wildcat_AH1_CAS_8A", [
		["driver", 
			["Modern_British_HeliPilot"]
		],
		["gunner", 
			["Modern_British_crewchief"]
		]],7
	],
	
		["CUP_B_UH1Y_Gunship_Dynamic_USMC",[ 
		["driver", 
			["Modern_USMC_HeliPilot"]
		],
		["turret", 
			["Modern_USMC_crewchief"]
		]],7
	],	
	
		["CUP_B_MV22_USMC_RAMPGUN",[ 
		["driver", 
			["Modern_USMC_HeliPilot"]
		],
		["gunner", 
			["Modern_USMC_crewchief"]
		]],5
	],	
	
		["CUP_B_AH1_DL_BAF",[ 
		["driver", 
			["Modern_British_HeliPilot"]
		],
		["gunner", 
			["Modern_British_crewchief"]
		]],10
	],

		["CUP_B_AH1Z_Dynamic_USMC",[ 
		["driver", 
			["Modern_USMC_HeliPilot"]
		],
		["gunner", 
			["Modern_USMC_crewchief"]
		]],10
	],

	
		["CUP_B_CH47F_GB",[ 
		["driver", 
			["Modern_British_HeliPilot","Modern_USMC_HeliPilot"]
		],
		["turret", 
			["Modern_British_crewchief","Modern_USMC_crewchief"]
		]],5
	],
	
		["CUP_B_MH60S_FFV_USMC",[ 
		["driver", 
			["Modern_USMC_HeliPilot"]
		],
		["Turret", 
			["Modern_USMC_crewchief"]
		]],5
	],
	
				["CUP_B_A10_DYN_USA", [
		["driver", 
			["Modern_USMC_JetPilot"]
		]],14
	],
	
	
					["CUP_B_GR9_DYN_GB", [
		["driver", 
			["Modern_British_JetPilot"]
		]],14
	]
	
	
];//Items creatable from supplies boxes
twc_supplyBoxBuildables = [["ACE_ConcertinaWireCoil",200],["twc_Land_BagFence_Corner_F",100],["twc_Land_BagFence_Long_F",100],["twc_Land_BagFence_Short_F",100],["twc_Land_BagFence_End_F",100],["twc_Land_BagFence_Round_F",100],["twc_Land_BagBunker_Small_F",500],["Land_PortableLight_double_F",100]];

//Slot Restrictions. TBA when we are doing more then just testing
_justPlayers = count(allPlayers - entities "HeadlessClient_F");
if(false)then{
	["End2", false, 0] call BIS_fnc_endMission;
};

execVM "Insurgency_Core\client\init.sqf";