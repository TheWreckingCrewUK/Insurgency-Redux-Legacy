/*
* Written by [TWC] jayman
*
* Creates the ammo box with an an event handler. This should decrease lag
* while always keeping the box full. Basically it reloads as soon as you close it
*/
_marker = "crate";  // marker used to spawn.
_boxType = "CUP_BAF_VehicleBox";  // the type of ammobox used.

// create and fill the box.
crateBox = _boxType createVehicleLocal (getMarkerPos _marker);
crateBox setPosATL (getMarkerPos _marker);
crateBox allowDamage false;
[crateBox] execVM "Insurgency_Core\client\sys_player\boxes\main_ammo.sqf";

player addEventHandler ["InventoryClosed", {
	if((_this select 1) == crateBox)then{
		[_this select 1]execVM "Insurgency_Core\client\sys_player\boxes\main_ammo.sqf";
	};
}];

	_twc_repveh = ["repveh","Repair Nearby Vehicles","",{[_target] execvm "insurgency_core\client\sys_player\repairvehicle.sqf"},{alive _target}] call ace_interact_menu_fnc_createAction;
	["CUP_B_Wolfhound_LMG_GB_W",0,["ACE_MainActions"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
	
	_twc_repvehd = ["repveh","Repair Nearby Vehicles","",{[_target] execvm "insurgency_core\client\sys_player\repairvehicle.sqf"},{alive _target}] call ace_interact_menu_fnc_createAction;
	["CUP_B_Wolfhound_LMG_GB_D",0,["ACE_MainActions"],_twc_repvehd,true] call ace_interact_menu_fnc_addActionToClass;

	_condition = {(count (player nearobjects ["Vysilacka", 100]) > 0) || (count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)};
	
	
#include "pilots.sqf";
	
	_minecondition = {(count (player nearobjects ["minebase", 500]) > 0) || (count (player nearobjects ["pipebombbase", 10]) > 0)};
	_twc_placeflag = ["placeflag","Place EOD Flag","",{ 
_flag = createVehicle ["FlagSmall_F", ([_player, 2, getdir _player] call BIS_fnc_relPos), [], 0, "CAN_COLLIDE"];
_flag setdir random 360;

if (count (player nearobjects ["FlagSmall_F", 250]) >50) then {deletevehicle _flag; hint "There Are Too Many Flags In The Area Already, Chill Your Bean"} else {if (count (player nearobjects ["FlagSmall_F", 40]) >15) then {deletevehicle _flag; hint "I Am A Server In Pain, Please Have Mercy"} else {if (count (player nearobjects ["FlagSmall_F", 5]) >3) then {deletevehicle _flag; hint "You're Really Enthusiastic With This Whole Flag Thing"}}}
;

},_minecondition] call ace_interact_menu_fnc_createAction; 
[player, 1, ["ACE_SelfActions"], _twc_placeflag] call ace_interact_menu_fnc_addActionToObject; 

		_flagcondition = {(count (player nearobjects ["FlagSmall_F", 2]) > 0)};
	_twc_removeflag = ["placeflag","Remove EOD Flag","",{ 
_flag = (player nearobjects ["FlagSmall_F", 2]) select 0;

deleteVehicle _flag;

},_flagcondition] call ace_interact_menu_fnc_createAction; 
[player, 1, ["ACE_SelfActions"], _twc_removeflag] call ace_interact_menu_fnc_addActionToObject; 


		_deleteboxcondition = {(count (_target nearobjects ["Land_InfoStand_V1_F", 5]) > 0)};
	_twc_deletebox = ["deletebox","Destroy","",{ 
deleteVehicle _target;

},_deleteboxcondition] call ace_interact_menu_fnc_createAction; 
	["ReammoBox_F",0,["ACE_MainActions"],_twc_deletebox,true] call ace_interact_menu_fnc_addActionToClass;


#include "armour.sqf";
#include "fst.sqf";
	
{



	_infaction1 = ["clearbox","Clear Boxes","",{execvm "insurgency_core\client\sys_player\boxes\clearboxes.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	[_x,0,["ACE_MainActions"],_infaction1,true] call ace_interact_menu_fnc_addActionToClass;


	_twc_repveh2 = ["repveh","Repair Nearby Vehicles","",{[_target] execvm "insurgency_core\client\sys_player\repairvehicle.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	[_x,0,["ACE_MainActions"],_twc_repveh2,true] call ace_interact_menu_fnc_addActionToClass;	


} foreach ["Land_InfoStand_V1_F", "twc_SuppliesBox"];

if((typeOf player) in ["Modern_British_Squadleader","Modern_British_2IC_COIN"])then{

	_UKaction5 = ["SpawnmedCreate","Spawn Ambulance","",{execvm "insurgency_core\client\sys_player\vehicles\specveh_uk.sqf"},{(count units group player) >= 6}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	

	_UKaction = ["SpawnsmallUKCreate","Spawn Small UK Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateuk.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction1 = ["Spawnheartscrate","Spawn Hearts And Minds Kit","",{execvm "insurgency_core\client\sys_player\boxes\heartsminds.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction4,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
};


if((typeOf player) in ["twc_nac_commander","twc_nac_subcommander"])then{

	_hUKactionnac = ["SpawnsmallUKCreate","Spawn Small NAC Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateNAC.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hUKactionnac,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction4,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
};

if((typeOf player) in ["twc_ana_commander","twc_ana_subcommander"])then{

	_UKaction = ["SpawnsmallanaCreate","Spawn Small ANA Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateana.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction4,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	

	_UKaction5 = ["SpawnmedCreate","Spawn ZSU HMMWV","",{execvm "insurgency_core\client\sys_player\vehicles\specveh_ana.sqf"},{(count units group player) >= 6}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
	
	waituntil {(!(isnil "twc_missionname"))};

if (["90", twc_missionname] call BIS_fnc_inString) then {

	_UKaction5 = ["SpawnmedCreate","Spawn Truck (Armed)","",{["CUP_I_Datsun_PK_TK_Random"] execvm "insurgency_core\client\sys_player\vehicles\anapickup90.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	

	_UKaction5 = ["SpawnmedCreate","Spawn Truck (Unarmed)","",{["CUP_I_Datsun_4seat_TK"] execvm "insurgency_core\client\sys_player\vehicles\anapickup90.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	} else {
	
	_UKaction5 = ["SpawnmedCreate","Spawn Truck (Armed)","",{["I_G_Offroad_01_armed_F"] execvm "insurgency_core\client\sys_player\vehicles\anapickup.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	

	_UKaction5 = ["SpawnmedCreate","Spawn Truck (Unarmed)","",{["C_Offroad_01_F"] execvm "insurgency_core\client\sys_player\vehicles\anapickup.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	};

};

if((typeOf player) in ["Modern_USMC_Squadleader","Modern_USMC_Teamleader", "Modern_USMC_Squadleader_d","Modern_USMC_Teamleader_d"])then{

	_UKaction5 = ["SpawnmedCreate","Spawn CROWS HMMWV","",{execvm "insurgency_core\client\sys_player\vehicles\specveh_usmc.sqf"},{(count units group player) >= 6}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	

	_charlieaction = ["SpawnsmallcharlieCreate","Spawn Small US Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateUSMC.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_charlieaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_charlieaction1 = ["Spawnheartscrateus","Spawn Hearts and Minds Kit","",{execvm "insurgency_core\client\sys_player\boxes\heartsminds_us.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_charlieaction1,true] call ace_interact_menu_fnc_addActionToClass;

	_charlieaction2 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_charlieaction2,true] call ace_interact_menu_fnc_addActionToClass;
		
};


if((typeOf player) in ["Modern_British_logitech"])then{
	_UKaction = ["Spawncontainer","Spawn Large Container","",{execvm "insurgency_core\client\sys_player\boxes\Container.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;
};

if((typeOf player) in ["Modern_Artillery_Commander"])then{

	_artaction = ["SpawnsmallcharlieCreate","Spawn 105mm HE Rounds","",{execvm "insurgency_core\client\sys_player\boxes\105he.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_artaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_artaction1 = ["Spawnheartscrateus","Spawn 105mm Smoke Rounds","",{execvm "insurgency_core\client\sys_player\boxes\105smoke.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_artaction1,true] call ace_interact_menu_fnc_addActionToClass;

	_artaction2 = ["SpawnmedCreate","Spawn 105mm Illum Rounds","",{execvm "insurgency_core\client\sys_player\boxes\105illum.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_artaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_artaction3 = ["SpawnrepCreate","Spawn Vehicle Repair Kit","",{execvm "insurgency_core\client\sys_player\boxes\RepairKit.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_artaction3,true] call ace_interact_menu_fnc_addActionToClass;
	

};


if((typeOf player) in ["Modern_British_Sniper_coin", "Modern_British_Spotter_coin"])then{

	_snaction1 = ["Spawnsnipbox","Spawn Sniper Ammo Box","",{execvm "insurgency_core\client\sys_player\boxes\smallCratesniper.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
};

if((typeOf player) in ["Modern_British_Medic", "1990_British_Medic", "1990_British_Medic_Desert", "1990_RM_British_Medic_Mix", "Modern_USMC_Medic", "Modern_USMC_Medic_d", "twc_ana_medic", "twc_nac_medic"])then{

	_medaction = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_medaction,true] call ace_interact_menu_fnc_addActionToClass;
		
};





if((typeOf player) in ["1990_British_quartermaster_Desert"])then{

	_qm90action1 = ["spawnl111","Spawn L111A1 HMG","",{execvm "insurgency_core\client\sys_player\boxes\staticL111A1.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_qm90action1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_qm90action3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_qm90action3,true] call ace_interact_menu_fnc_addActionToClass;

	_qm90action4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_qm90action4,true] call ace_interact_menu_fnc_addActionToClass;

};

if((typeOf player) in ["1990_British_mg_assistant_Desert"])then{

	_mgaction = ["Spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_mgaction,true] call ace_interact_menu_fnc_addActionToClass;
	
};

if((typeOf player) in ["1990_British_2IC_Desert","1990_British_SectionCommander_Desert"])then{

	
	_90UKaction = ["Spawnsmall90UKCreate","Spawn Ammo Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateuk90.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_90UKaction1 = ["Spawnheartscrate","Spawn Hearts and Minds Kit","",{execvm "insurgency_core\client\sys_player\boxes\heartsminds.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90UKaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_90UKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90UKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_90UKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90UKaction4,true] call ace_interact_menu_fnc_addActionToClass;

	
	_90charlieaction2 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90charlieaction2,true] call ace_interact_menu_fnc_addActionToClass;
		
};

if((typeOf player) in ["1990_RM_British_2IC_Mix","1990_RM_British_SectionCommander_Mix"])then{

	
	_90rmUKaction = ["Spawnsmall90UKCreate","Spawn Ammo Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateuk90RM.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90rmUKaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_90rmUKaction1 = ["Spawnheartscrate","Spawn Hearts and Minds Kit","",{execvm "insurgency_core\client\sys_player\boxes\heartsmindsRM.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90rmUKaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_90rmUKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90rmUKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_90rmUKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90rmUKaction4,true] call ace_interact_menu_fnc_addActionToClass;

	_90rmaction2 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90rmaction2,true] call ace_interact_menu_fnc_addActionToClass;
		
};








if((typeOf player) in ["2000_British_SectionCommander_Desert","2000_British_SectionCommander","2000_British_2IC_Desert","2000_British_2IC"])then{



	_hUKaction3 = ["SpawnsmallUKCreate","Spawn UK Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateuk2000.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hUKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_haction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_haction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hfstaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hfstaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_hfstaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hfstaction4,true] call ace_interact_menu_fnc_addActionToClass;
	

	
};






if((typeOf player) in ["TWC_2000_US_Army_SectionCommander","TWC_2000_US_Army_TeamLeader"])then{


	_hcharlieaction2 = ["SpawnsmallcharlieCreate","Spawn US Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallcrateUS2000.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hcharlieaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_haction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_haction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hfstaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hfstaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_hfstaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hfstaction4,true] call ace_interact_menu_fnc_addActionToClass;
	

	
};




if((typeOf player) in ["TWC_2000_US_Army_SectionCommander","TWC_2000_US_Army_TeamLeader","2000_British_SectionCommander_Desert","2000_British_SectionCommander","2000_British_2IC_Desert","2000_British_2IC","1990_RM_British_2IC_Mix","1990_RM_British_SectionCommander_Mix","1990_British_2IC_Desert","1990_British_SectionCommander_Desert", "Modern_British_Spotter_coin","Modern_British_FSTCommander","Modern_USMC_Squadleader","Modern_USMC_Teamleader", "Modern_USMC_Squadleader_d","Modern_USMC_Teamleader_d","twc_ana_commander","twc_ana_subcommander","Modern_British_Squadleader","Modern_British_2IC_COIN"])then{
	_vic = ["spawn762","Spawn Vehicles","",{[_target] execvm "insurgency_core\client\sys_player\vehicledrop.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["twc_SuppliesBox",0,["ACE_MainActions"],_vic,true] call ace_interact_menu_fnc_addActionToClass;};

if((typeOf player) in ["Modern_British_Quartermaster","2000_British_quartermaster_Desert","1990_British_quartermaster_Desert"])then{
execVM "insurgency_core\client\zeus\camera.sqf";

	_action2 = ["Zeus","Spectator On","",{execVM "insurgency_core\client\zeus\spectator_on.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action2] call ace_interact_menu_fnc_addActionToObject;
	_action3 = ["Zeus","Spectator Off","",{execVM "insurgency_core\client\zeus\spectator_off.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action3] call ace_interact_menu_fnc_addActionToObject;
	_action4 = ["Zeus","Basemode On","",{execVM "insurgency_core\client\zeus\basemode_on.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action4] call ace_interact_menu_fnc_addActionToObject;
	_action5 = ["Zeus","Basemode Off","",{execVM "insurgency_core\client\zeus\basemode_off.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action5] call ace_interact_menu_fnc_addActionToObject;
	
	_action6 = ["Zeus","Enemy Siren","",{execVM "insurgency_core\server\sys_basedefence\INF_Alarm.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action6] call ace_interact_menu_fnc_addActionToObject;
	
	
	_action7 = ["Zeus","IDF Siren","",{execVM "insurgency_core\server\sys_basedefence\IDF_Alarm.sqf"
},_condition] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action7] call ace_interact_menu_fnc_addActionToObject;
	
	_action8 = ["Zeus","Clear Siren","",{execVM "insurgency_core\server\sys_basedefence\INF_Alarmclear.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action8] call ace_interact_menu_fnc_addActionToObject;

};
