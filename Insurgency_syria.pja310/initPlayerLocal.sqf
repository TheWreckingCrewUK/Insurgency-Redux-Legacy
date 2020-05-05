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
// if the last value is a number then that is the minimum player count before that vehicle can be used.
// if the second to last value is a number then that is the max player count until that vehicle can be used.
// you can also restrict specific slots to different player counts by duplicating the vehicle entry, only having that one slot, and then inputting different count values.
//this is now stored in core as it's only rare for there to be differences to the normal, I'll put in exemption code if this ever becomes necessary
twc_restrictedVehicleSlots = [	
	];
//Items creatable from supplies boxes
twc_supplyBoxBuildables = [["ACE_ConcertinaWireCoil",200],["twc_Land_BagFence_Corner_F",100],["twc_Land_BagFence_Long_F",100],["twc_Land_BagFence_Short_F",100],["twc_Land_BagFence_End_F",100],["twc_Land_BagFence_Round_F",100],["twc_Land_BagBunker_Small_F",500],["Land_PortableLight_double_F",100]];

//Slot Restrictions. TBA when we are doing more then just testing
_justPlayers = count(allPlayers - entities "HeadlessClient_F");
if(false)then{
	["End2", false, 0] call BIS_fnc_endMission;
};

execVM "Insurgency_Core\client\init.sqf";