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

//Glasses stuff, needs twc mission module to be fleshed out for all missions to work
/*
if !((goggles player) in approvedFacewear) then {
            removeGoggles player;
        };
 */

// Here be the list of vehicles, its restricted slots and players exempt from that
// always class names of the objects, including the player (so for example British Pilot = Modern_British_heliPilot)

// FORMAT:
// ["vehicle class name", ["slot name", ["acceptable person 1", ...]]],
// known slot names (verbatim): "driver", "gunner", "commander", "Turret", or "cargo"
// if the last value is a number then that is the amount of players needed to use that vehicle in those slots. Otherwise there is no player count restriction
twc_restrictedVehicleSlots = [	
	
		["RHS_M119_D", [
		["gunner", 
			["Modern_Artillery_Gunner"]
		]],23,22
	],
	
			["UK3CB_BAF_Static_L16_Deployed", [
		["gunner", 
			["Modern_Artillery_Gunner"]
		]],14,10
	],
	
		["rhsusf_m1a2sep1wd_usarmy",[ 
		["driver", 
			["Modern_USMC_VehicleCrew"]
		],
		["gunner", 
			["Modern_USMC_VehicleCrew"]
		],
		["commander", 
			["Modern_USMC_VehicleCommander"]
		]],12
	],
		["rhsusf_m1a2sep1d_usarmy",[ 
		["driver", 
			["Modern_USMC_VehicleCrew"]
		],
		["gunner", 
			["Modern_USMC_VehicleCrew"]
		],
		["commander", 
			["Modern_USMC_VehicleCommander"]
		]],12
	],
	
		["rhsusf_m113_usarmy_M240",[ 
		["driver", 
			["Modern_USMC_VehicleCrew","Modern_USMC_VehicleCommander"]
		]],6
	],
			["CUP_B_M113_desert_USA",[ 
		["driver", 
			["Modern_USMC_VehicleCrew","Modern_USMC_VehicleCommander"]
		]],6
	],
	
		["CUP_B_MCV80_GB_W_SLAT",[ 
		["driver", 
			["Modern_British_VehicleCrew"]
		],
		["gunner", 
			["Modern_British_VehicleCrew"]
		],
		["commander", 
			["Modern_British_VehicleCommander"]
		]],10
	],	
	
			["CUP_B_MCV80_GB_D_SLAT",[ 
		["driver", 
			["Modern_British_VehicleCrew"]
		],
		["gunner", 
			["Modern_British_VehicleCrew"]
		],
		["commander", 
			["Modern_British_VehicleCommander"]
		]],10
	],	
	
		["CUP_B_FV432_Bulldog_GB_W",[ 
		["driver", 
			["Modern_British_VehicleCrew","Modern_British_VehicleCommander"]
		]],6
	],
	
			["CUP_B_FV432_Bulldog_GB_D",[ 
		["driver", 
			["Modern_British_VehicleCrew","Modern_British_VehicleCommander"]
		]],6
	],
		
		["rhsusf_m113d_usarmy_medical",[ 
		["driver", 
			["Modern_British_VehicleCrew","Modern_British_VehicleCommander","Modern_USMC_VehicleCrew","Modern_USMC_VehicleCommander","Modern_USMC_Medic","Modern_British_Medic"]
		]]
	],
		
		["rhsusf_m113_usarmy_medical",[ 
		["driver", 
			["Modern_British_VehicleCrew","Modern_British_VehicleCommander","Modern_USMC_VehicleCrew","Modern_USMC_VehicleCommander","Modern_USMC_Medic","Modern_British_Medic"]
		]]
	],
	
		["CUP_B_LAV25_USMC",[ 
		["driver", 
			["Modern_USMC_VehicleCrew"]
		],
		["gunner", 
			["Modern_USMC_VehicleCrew"]
		],
		["commander", 
			["Modern_USMC_VehicleCommander"]
		]],10
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
		]],10
	],
	
		["UK3CB_BAF_Wildcat_AH1_CAS_8A", [
		["driver", 
			["Modern_British_HeliPilot"]
		],
		["gunner", 
			["Modern_British_crewchief"]
		]],9
	],
	
		["CUP_B_UH1Y_Gunship_Dynamic_USMC",[ 
		["driver", 
			["Modern_USMC_HeliPilot"]
		],
		["turret", 
			["Modern_USMC_crewchief"]
		]],9
	],	
	
		["UK3CB_BAF_Wildcat_AH1_HEL_8A",[ 
		["driver", 
			["Modern_British_HeliPilot"]
		],
		["gunner", 
			["Modern_British_crewchief"]
		]],9
	],

		["CUP_B_AH1Z_Dynamic_USMC",[ 
		["driver", 
			["Modern_USMC_HeliPilot"]
		],
		["gunner", 
			["Modern_USMC_crewchief"]
		]],14
	],

		["CUP_B_AH1_DL_BAF",[ 
		["driver", 
			["Modern_British_HeliPilot"]
		],
		["gunner", 
			["Modern_British_crewchief"]
		]],14
	],
	
		["CUP_B_CH47F_GB",[ 
		["driver", 
			["Modern_British_HeliPilot","Modern_USMC_HeliPilot"]
		],
		["turret", 
			["Modern_British_crewchief","Modern_USMC_crewchief"]
		]],5
	],
	
		["CUP_B_MV22_USMC_RAMPGUN",[ 
		["driver", 
			["Modern_USMC_HeliPilot"]
		],
		["gunner", 
			["Modern_USMC_crewchief"]
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
	]
	
];
//Items creatable from supplies boxes
twc_supplyBoxBuildables = [["ACE_ConcertinaWireCoil",200],["twc_Land_BagFence_Corner_F",100],["twc_Land_BagFence_Long_F",100],["twc_Land_BagFence_Short_F",100],["twc_Land_BagFence_End_F",100],["twc_Land_BagFence_Round_F",100],["twc_Land_BagBunker_Small_F",500],["Land_PortableLight_double_F",100]];

//Slot Restrictions. TBA when we are doing more then just testing
_justPlayers = count(allPlayers - entities "HeadlessClient_F");
if(false)then{
	["End2", false, 0] call BIS_fnc_endMission;
};

execVM "Insurgency_Core\client\init.sqf";