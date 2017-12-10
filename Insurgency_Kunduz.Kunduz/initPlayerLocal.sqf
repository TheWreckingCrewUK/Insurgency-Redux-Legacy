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


execVM "Insurgency_Core\client\init.sqf";
 
if ((typeOf vehicle player == "Modern_British_Jetpilot") or (typeOf vehicle player == "Modern_USMC_Jetpilot") ) then{ 

if (count allplayers <8) then {
//if(!isMultiplayer)exitWith{};

while {count allplayers <8}do{
    [
        "<t size='1.2'>Jet Pilot</t><br/><t size='0.6'>You need more than 8 people in the game before you can proceed</t>", 0, 0.22, 5, 0, 0, 2
    ] spawn bis_fnc_dynamictext;
	sleep 5;
cutText ["", "Black", 0.001];
player forceWalk true;
player setdamage 1;
};
cutText ["","Black IN",5];
player forceWalk false;

};
};

if ((typeOf vehicle player == "Modern_British_Sniper") or (typeOf vehicle player == "Modern_USMC_Spotter") ) then{ 

if (count allplayers <8) then {
//if(!isMultiplayer)exitWith{};

while {count allplayers <8}do{
    [
        "<t size='1.2'>Sniper Team</t><br/><t size='0.6'>You need more than 8 people in the game before you can proceed</t>", 0, 0.22, 5, 0, 0, 2
    ] spawn bis_fnc_dynamictext;
	sleep 5;
cutText ["", "Black", 0.001];
player forceWalk true;
player setdamage 1;
};
cutText ["","Black IN",5];
player forceWalk false;

};
};

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
			["Modern_British_HeliPilot","Modern_USMC_HeliPilot"]
		]
	],
	
	["CUP_B_UH1Y_Gunship_Dynamic_USMC", 
		["driver", 
			["Modern_USMC_HeliPilot"]
		],
		["commander", 
			["Modern_British_HeliPilot","Modern_USMC_HeliPilot"]
		]
	],
	

	
			["UK3CB_BAF_Merlin_HC3_CSAR", 
		["driver", 
			["Modern_British_HeliPilot"]
		],
		["commander", 
			["Modern_British_HeliPilot","Modern_USMC_HeliPilot"]
		]
	],
	
				["CUP_B_A10_DYN_USA", 
		["driver", 
			["Modern_USMC_JetPilot"]
		]
	],
	
					["CUP_B_GR9_DYN_GB", 
		["driver", 
			["Modern_British_JetPilot"]
		]
	]
	
	
];
//Items creatable from supplies boxes
twc_supplyBoxBuildables = [["ACE_ConcertinaWireCoil",200],["twc_Land_BagFence_Corner_F",100],["twc_Land_BagFence_Long_F",100],["twc_Land_BagFence_Short_F",100],["twc_Land_BagFence_End_F",100],["twc_Land_BagFence_Round_F",100],["twc_Land_BagBunker_Small_F",500],["Land_PortableLight_double_F",100]];

//Slot Restrictions. TBA when we are doing more then just testing
_justPlayers = count(allPlayers - entities "HeadlessClient_F");
if(false)then{
	["End2", false, 0] call BIS_fnc_endMission;
};
