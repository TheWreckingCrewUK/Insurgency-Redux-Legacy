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
crateBox setPosATL ((getMarkerPos _marker) vectoradd [0,0,2]);
crateBox allowDamage false;
[crateBox] execVM "Insurgency_Core\client\sys_player\boxes\base_box\main_ammo.sqf";

/*
player addEventHandler ["InventoryClosed", {
	if((_this select 1) == crateBox)then{
		[_this select 1]execVM "Insurgency_Core\client\sys_player\boxes\base_box\main_ammo.sqf";
	};
}];
*/

	_twc_repveh = ["repveh","Recover Vehicle","",{_isflipping = _target getvariable ["twc_vehisflipping", false];

if (_isflipping) exitwith {hint "this vehicle is being recovered already";};[_target, player] remoteexec ["twc_fnc_flipvehicle", _target];},{(alive _target) && (1 < (vectorUp _target) vectorDistance (surfaceNormal getPosATL _target))}] call ace_interact_menu_fnc_createAction;
	["landvehicle",0,["ACE_MainActions"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
	

	_twc_repveh = ["prepveh","Prep Supplies","",{[_target, player, 2] call twc_fnc_genericfillvehicle;playSound3D ["A3\missions_f\data\sounds\click.wss", player];},{(alive _target) && (((getPos AmmoBoxSpawner) distance _target) < 20)}] call ace_interact_menu_fnc_createAction;
	["landvehicle",0,["ACE_MainActions"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
	
	_twc_repveh = ["prepvehm","Prep Magazines Only","",{[_target, player, 2, true, false] call twc_fnc_genericfillvehicle;playSound3D ["A3\missions_f\data\sounds\click.wss", player];},{(alive _target) && (((getPos AmmoBoxSpawner) distance _target) < 20)}] call ace_interact_menu_fnc_createAction;
	["landvehicle",0,["ACE_MainActions", "prepveh"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
	
	_twc_repveh = ["prepvehi","Prep Items Only","",{[_target, player, 2, false, true] call twc_fnc_genericfillvehicle;playSound3D ["A3\missions_f\data\sounds\click.wss", player];},{(alive _target) && (((getPos AmmoBoxSpawner) distance _target) < 20)}] call ace_interact_menu_fnc_createAction;
	["landvehicle",0,["ACE_MainActions", "prepveh"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	_twc_repveh = ["clearsupplies","Clear Supplies","",{},{(alive _target) && (((getPos AmmoBoxSpawner) distance _target) < 20) && ((["lead", typeof player] call BIS_fnc_inString) || (["command", typeof player] call BIS_fnc_inString) || (["2ic", typeof player] call BIS_fnc_inString) || (["pilot", typeof player] call BIS_fnc_inString) || (["crew", typeof player] call BIS_fnc_inString) || ((count units group player) < 3))}] call ace_interact_menu_fnc_createAction;
	["landvehicle",0,["ACE_MainActions"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
	
	_twc_repveh = ["clearsuppliesweps","Clear Weapons","",{clearweaponcargoglobal _target;playSound3D ["A3\missions_f\data\sounds\click.wss", player];},{((count (weaponcargo _target)) > 0)}] call ace_interact_menu_fnc_createAction;
	["landvehicle",0,["ACE_MainActions", "clearsupplies"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
	
	_twc_repveh = ["clearsuppliesweps2","Clear Specific Weapon","",{player setvariable ["twc_isclearingvehicleweaponcargo", time];playSound3D ["A3\missions_f\data\sounds\click.wss", player];hint "The next weapon you put in or take from the vehicle within 20 seconds will be completely removed from the vehicle";},{true}] call ace_interact_menu_fnc_createAction;
	["landvehicle",0,["ACE_MainActions", "clearsupplies", "clearsuppliesweps"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
	
	_twc_repveh = ["clearsuppliesitems","Clear All Items","",{clearitemcargoglobal _target;playSound3D ["A3\missions_f\data\sounds\click.wss", player];},{((count (itemcargo _target)) > 0)}] call ace_interact_menu_fnc_createAction;
	["landvehicle",0,["ACE_MainActions", "clearsupplies"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
	
	_twc_repveh = ["clearsuppliesiweps","Clear Specific Item","",{player setvariable ["twc_isclearingvehicleitemcargo", time];playSound3D ["A3\missions_f\data\sounds\click.wss", player];hint "The next item you put in or take from the vehicle within 20 seconds will be completely removed from the vehicle";},{true}] call ace_interact_menu_fnc_createAction;
	["landvehicle",0,["ACE_MainActions", "clearsupplies", "clearsuppliesitems"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
	
	_twc_repveh = ["clearsuppliesmags","Clear All Magazines","",{clearmagazinecargoglobal _target;playSound3D ["A3\missions_f\data\sounds\click.wss", player];},{((count (magazinecargo _target)) > 0)}] call ace_interact_menu_fnc_createAction;
	["landvehicle",0,["ACE_MainActions", "clearsupplies"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
	
	_twc_repveh = ["clearsuppliesiweps","Clear Specific Magazine","",{player setvariable ["twc_isclearingvehiclemagcargo", time];playSound3D ["A3\missions_f\data\sounds\click.wss", player]; hint "The next magazine you put in or take from the vehicle within 20 seconds will be completely removed from the vehicle";},{true}] call ace_interact_menu_fnc_createAction;
	["landvehicle",0,["ACE_MainActions", "clearsupplies", "clearsuppliesmags"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	_twc_repveh = ["repveh","Repair Nearby Vehicles","",{[_target] execvm "insurgency_core\client\sys_player\repairvehicle.sqf"},{alive _target}] call ace_interact_menu_fnc_createAction;
	["UK3CB_BAF_MAN_HX58_Repair_Sand",0,["ACE_MainActions"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;
	
	_twc_repvehd = ["repveh","Repair Nearby Vehicles","",{[_target] execvm "insurgency_core\client\sys_player\repairvehicle.sqf"},{alive _target}] call ace_interact_menu_fnc_createAction;
	["UK3CB_BAF_MAN_HX58_Repair_Green",0,["ACE_MainActions"],_twc_repvehd,true] call ace_interact_menu_fnc_addActionToClass;

	_condition = {(count (player nearobjects ["Vysilacka", 100]) > 0) || (count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)};
	
	
#include "pilots.sqf";

#include "supply_boxes\1970_baf.sqf";
#include "supply_boxes\modern_ger.sqf";
#include "supply_boxes\modern_pol.sqf";
#include "supply_boxes\1990_us.sqf";
	
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
#include "HQ.sqf";
	

	_infaction1 = ["clearbox","Clear Boxes","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\clearboxes.sqf"},{(["lead", typeof player] call BIS_fnc_inString) || (["command", typeof player] call BIS_fnc_inString) || (["2ic", typeof player] call BIS_fnc_inString) || (["pilot", typeof player] call BIS_fnc_inString) || (["crew", typeof player] call BIS_fnc_inString) || ((count units group player) < 3)}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_infaction1,true] call ace_interact_menu_fnc_addActionToClass;
	

	_infaction1 = ["clearbox","Wait Until Night","",{_cond = call twc_issidenearby;if (!_cond) exitwith {};[0] remoteExec ["twc_fnc_changedaynight", 2];},{((["lead", typeof player] call BIS_fnc_inString) || (["command", typeof player] call BIS_fnc_inString) || (["2ic", typeof player] call BIS_fnc_inString) || (["pilot", typeof player] call BIS_fnc_inString) || (["crew", typeof player] call BIS_fnc_inString) || ((count units group player) < 3)) && (sunormoon != 0)}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_infaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_infaction1 = ["clearbox","Wait Until Day","",{_cond = call twc_issidenearby;if (!_cond) exitwith {};[1] remoteExec ["twc_fnc_changedaynight", 2];},{((["lead", typeof player] call BIS_fnc_inString) || (["command", typeof player] call BIS_fnc_inString) || (["2ic", typeof player] call BIS_fnc_inString) || (["pilot", typeof player] call BIS_fnc_inString) || (["crew", typeof player] call BIS_fnc_inString) || ((count units group player) < 3)) && (sunormoon != 1)}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_infaction1,true] call ace_interact_menu_fnc_addActionToClass;
{




	_twc_repveh2 = ["repveh","Repair/Rearm Nearby Vehicles","",{[_target] execvm "insurgency_core\client\sys_player\repairvehicle.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	[_x,0,["ACE_MainActions"],_twc_repveh2,true] call ace_interact_menu_fnc_addActionToClass;	


} foreach ["Land_InfoStand_V1_F", "twc_SuppliesBox", "UK3CB_BAF_MAN_HX58_Container_Green"];

if((typeOf player) in ["Modern_British_Squadleader","Modern_British_2IC_COIN","Modern_British_Squadleader_Light","Modern_British_2IC_COIN_Light","Modern_UKSF_Squadleader","Modern_UKSF_2IC"])then{

	if((typeOf player) in ["Modern_British_Squadleader_Light","Modern_British_2IC_COIN_Light"])then{
		_UKaction5 = ["SpawnmedCreate","Spawn Loaded WMIK","",{execvm "insurgency_core\client\sys_player\vehicles\patrolwmik.sqf"},{((group player getvariable ["twc_ismechanised", 0]) == 0)}] call ace_interact_menu_fnc_createAction;
		["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
		_UKaction5 = ["SpawnmedCreate","Spawn Loaded Mastiff","",{execvm "insurgency_core\client\sys_player\vehicles\patrolmastiff.sqf"},{(count units group player > 3) && ((group player getvariable ["twc_ismechanised", 0]) == 0)}] call ace_interact_menu_fnc_createAction;
		["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
	};
		

	_UKaction5 = ["SpawnmedCreate","Spawn Panther CLV","",{execvm "insurgency_core\client\sys_player\vehicles\specveh_uk.sqf"},{(count units group player) >= 6}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;

	_alphaaction = ["SpawnsmallAlphaCreate","Spawn Javelin Launcher","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcratejav.sqf"},{((count units group player) > 3)}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_alphaaction,true] call ace_interact_menu_fnc_addActionToClass;

	_alphaaction = ["SpawnsmallAlphaCreate","Spawn Javelin Tubes","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcratejav_tube.sqf"},{((count units group player) > 3)}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_alphaaction,true] call ace_interact_menu_fnc_addActionToClass;


	if ((typeof player) in ["Modern_UKSF_Squadleader","Modern_UKSF_2IC"]) then {
		_UKaction = ["SpawnsmallUKCreate","Spawn Small Ammo Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrategeneric.sqf"},_condition] call ace_interact_menu_fnc_createAction;
		["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	} else {
		_UKaction = ["SpawnsmallUKCreate","Spawn Small UK Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateuk.sqf"},_condition] call ace_interact_menu_fnc_createAction;
		["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	};
	_UKaction1 = ["Spawnheartscrate","Spawn Hearts And Minds Kit","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\heartsminds.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction3 = ["spawn50","Spawn Night Ops Box","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallCratenightops.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_alphaaction6 = ["spawn40","Spawn 40mm Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\40ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_alphaaction6,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
};


if((typeOf player) in ["Modern_UKSF_Squadleader","Modern_UKSF_2IC"])then{
	_UKaction5 = ["SpawnmedCreate","Spawn Loaded Coyote (GMG)","",{execvm "insurgency_core\client\sys_player\vehicles\sfjackal40.sqf"},{((group player) getvariable ["twc_groupcountry", "baf"]) == "baf"}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction5 = ["SpawnmedCreate","Spawn Loaded Coyote (HMG)","",{execvm "insurgency_core\client\sys_player\vehicles\sfjackal50.sqf"},{((group player) getvariable ["twc_groupcountry", "baf"]) == "baf"}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	_UKaction5 = ["SpawnmedCreate","Spawn Loaded SF MATV (HMG)","",{execvm "insurgency_core\client\sys_player\vehicles\sfrg.sqf"},{(((group player) getvariable ["twc_groupcountry", "baf"]) != "baf") && (((group player) getvariable ["twc_groupcountry", "ana"]) != "ana")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction5 = ["SpawnmedCreate","Spawn Loaded MRAP (HMG)","",{execvm "insurgency_core\client\sys_player\vehicles\sfmrap.sqf"},{(((group player) getvariable ["twc_groupcountry", "baf"]) != "baf") && (((group player) getvariable ["twc_groupcountry", "ana"]) != "ana") && (((group player) getvariable ["twc_groupcountry", "cag"]) != "cag")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction5 = ["heavyveh","Heavy Vehicles","",{},{(((group player) getvariable ["twc_groupcountry", "baf"]) == "cag")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction5 = ["SpawnmedCreate","Spawn Loaded MRAP (HMG)","",{execvm "insurgency_core\client\sys_player\vehicles\sfmrap.sqf"},{(((group player) getvariable ["twc_groupcountry", "baf"]) == "cag")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "heavyveh"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction5 = ["SpawnmedCreate","Spawn Loaded Stryker (HMG)","",{execvm "insurgency_core\client\sys_player\vehicles\sfstryker.sqf"},{(((group player) getvariable ["twc_groupcountry", "baf"]) == "cag")}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "heavyveh"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction5 = ["SpawnmedCreate","Spawn Hilux","",{execvm "insurgency_core\client\sys_player\vehicles\sfpickup.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	_UKaction5 = ["SpawnmedCreate","Spawn Suppressors","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\suppressors.sqf"},{((missionnamespace getvariable ["twc_suppspawned", 0]) == 0)}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
};

if((typeOf player) in ["2000_UKSF_Sectionleader","2000_UKSF_2ic"])then{
	_UKaction5 = ["SpawnmedCreate","Spawn Loaded Jackal (GMG)","",{execvm "insurgency_core\client\sys_player\vehicles\sfjackal40.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction5 = ["SpawnmedCreate","Spawn Loaded Jackal (HMG)","",{execvm "insurgency_core\client\sys_player\vehicles\sfjackal50.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction5 = ["SpawnmedCreate","Spawn Suppressors","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\suppressors.sqf"},{((missionnamespace getvariable ["twc_suppspawned", 0]) == 0)}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
};

if((typeOf player) in ["Modern_British_Recce_Commander"])then{

	_snaction1 = ["Spawnsnipbox","Spawn Ammo Box","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallCrateRecce.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;

	_snaction1 = ["Spawnsnipbox","Spawn Loaded GMG Jackal","",{execvm "insurgency_core\client\sys_player\vehicles\reccejackal.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
		
	_alphaaction6 = ["spawn40","Spawn 40mm Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\40ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_alphaaction6,true] call ace_interact_menu_fnc_addActionToClass;
};


if((typeOf player) in ["twc_nac_commander","twc_nac_subcommander"])then{

	_hUKactionnac = ["SpawnsmallUKCreate","Spawn Small NAC Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateNAC.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hUKactionnac,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction3 = ["spawn50","Spawn Night Ops Box","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallCratenightops.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction4,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
};

if((typeOf player) in ["twc_ana_commander","twc_ana_subcommander"])then{

	_UKaction = ["SpawnsmallanaCreate","Spawn Small ANA Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateana.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hUKaction3 = ["SpawnsmallUKCreate","Spawn Marksman Rifle","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\marksmancrateana.sqf"},{(count units group player) >= 8}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hUKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction3 = ["spawn50","Spawn Night Ops Box","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallCratenightops.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction4,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	

	_UKaction5 = ["SpawnmedCreate","Spawn ZSU HMMWV","",{execvm "insurgency_core\client\sys_player\vehicles\specveh_ana.sqf"},{(count units group player) >= 6}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
	
	waituntil {(!(isnil "twc_missionname"))};

if ((["90", twc_missionname] call BIS_fnc_inString) || (["00", twc_missionname] call BIS_fnc_inString) || (["70", twc_missionname] call BIS_fnc_inString)) then {

	_UKaction5 = ["SpawnmedCreate","Spawn Truck (Armed)","",{["CUP_I_Datsun_PK_TK_Random"] execvm "insurgency_core\client\sys_player\vehicles\anapickup90.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	

	_UKaction5 = ["SpawnmedCreate","Spawn Truck (Unarmed)","",{["CUP_I_Datsun_4seat_TK"] execvm "insurgency_core\client\sys_player\vehicles\anapickup90.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
	
	} else {
	
	_UKaction5 = ["SpawnmedCreate","Spawn Truck (Armed)","",{["CUP_O_Hilux_M2_TK_INS"] execvm "insurgency_core\client\sys_player\vehicles\anapickup.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	

	_UKaction5 = ["SpawnmedCreate","Spawn Truck (Unarmed)","",{["CUP_O_Hilux_unarmed_TK_INS"] execvm "insurgency_core\client\sys_player\vehicles\anapickup.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	};

};

if((typeOf player) in ["Modern_USMC_Squadleader","Modern_USMC_Teamleader", "Modern_USMC_Squadleader_d","Modern_USMC_Teamleader_d"])then{

	_UKaction5 = ["SpawnmedCreate","Spawn CROWS HMMWV","",{execvm "insurgency_core\client\sys_player\vehicles\specveh_usmc.sqf"},{(count units group player) >= 6}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
	
	_UKaction3 = ["spawn50","Spawn Night Ops Box","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallCratenightops.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction3 = ["spawn50","Spawn Javelin Launcher","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcratejav.sqf"},{(count units group player) >= 4}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction3 = ["spawn50","Spawn Javelin Tubes","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcratejav_tube.sqf"},{(count units group player) >= 4}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_charlieaction = ["SpawnsmallcharlieCreate","Spawn Small US Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateUSMC.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_charlieaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hUKaction3 = ["SpawnsmallUKCreate","Spawn Marksman Rifle","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\marksmancrateus.sqf"},{(count units group player) >= 8}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hUKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_charlieaction1 = ["Spawnheartscrateus","Spawn Hearts and Minds Kit","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\heartsminds_us.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_charlieaction1,true] call ace_interact_menu_fnc_addActionToClass;

	_charlieaction2 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_charlieaction2,true] call ace_interact_menu_fnc_addActionToClass;
		
	
	_UKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_alphaaction6 = ["spawn40","Spawn 40mm Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\40ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_alphaaction6,true] call ace_interact_menu_fnc_addActionToClass;
};

if((typeOf player) in ["TWC_Modern_US_Army_SectionCommander","TWC_Modern_US_Army_TeamLeader"])then{

	_UKaction5 = ["SpawnmedCreate","Spawn CROWS HMMWV","",{execvm "insurgency_core\client\sys_player\vehicles\specveh_usmc.sqf"},{(count units group player) >= 6}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
	
	_UKaction3 = ["spawn50","Spawn Night Ops Box","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallCratenightops.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction3 = ["spawn50","Spawn Javelin Launcher","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcratejav.sqf"},{(count units group player) >= 4}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction3 = ["spawn50","Spawn Javelin Tubes","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcratejav_tube.sqf"},{(count units group player) >= 4}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_charlieaction = ["SpawnsmallcharlieCreate","Spawn Small US Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateUS.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_charlieaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hUKaction3 = ["SpawnsmallUKCreate","Spawn Marksman Rifle","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\marksmancrateus.sqf"},{(count units group player) >= 8}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hUKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_charlieaction1 = ["Spawnheartscrateus","Spawn Hearts and Minds Kit","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\heartsminds_us.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_charlieaction1,true] call ace_interact_menu_fnc_addActionToClass;

	_charlieaction2 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_charlieaction2,true] call ace_interact_menu_fnc_addActionToClass;
		
	
	_UKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_alphaaction6 = ["spawn40","Spawn 40mm Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\40ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_alphaaction6,true] call ace_interact_menu_fnc_addActionToClass;
};



if((typeOf player) in ["Modern_Artillery_Commander"])then{

	_artaction = ["SpawnsmallcharlieCreate","Spawn 105mm HE Rounds","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\105he.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_artaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_artaction1 = ["Spawnheartscrateus","Spawn 105mm Smoke Rounds","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\105smoke.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_artaction1,true] call ace_interact_menu_fnc_addActionToClass;

	_artaction2 = ["SpawnmedCreate","Spawn 105mm Illum Rounds","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\105illum.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_artaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_artaction3 = ["SpawnrepCreate","Spawn Vehicle Repair Kit","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\RepairKit.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_artaction3,true] call ace_interact_menu_fnc_addActionToClass;
	

};


if((typeOf player) in ["Modern_British_Sniper_coin", "Modern_British_Spotter_coin"])then{

	_snaction1 = ["Spawnsnipbox","Spawn Sniper Ammo Box","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallCratesniper.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	_UKaction3 = ["spawn50","Spawn Night Ops Box","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallCratenightops.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hUKaction3 = ["SpawnsmallUKCreate","Spawn Anti Material Rifle","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\barretrifle.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hUKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
};

if (["Medic", typeof player] call BIS_fnc_inString) then {

	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
	
	player additemtovest "TWC_Item_Medical_SutureKit_20";
};





if((typeOf player) in ["1990_British_quartermaster_Desert"])then{

	_qm90action1 = ["spawnl111","Spawn L111A1 HMG","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\staticL111A1.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_qm90action1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_qm90action3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_qm90action3,true] call ace_interact_menu_fnc_addActionToClass;

	_qm90action4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_qm90action4,true] call ace_interact_menu_fnc_addActionToClass;

};

if((typeOf player) in ["1990_British_mg_assistant_Desert","1990_British_mg_assistant"])then{

	_mgaction = ["Spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_mgaction,true] call ace_interact_menu_fnc_addActionToClass;
	
};

if((typeOf player) in ["1990_British_2IC","1990_British_SectionCommander","1990_British_2IC_Desert","1990_British_SectionCommander_Desert"])then{

	
	_90UKaction = ["Spawnsmall90UKCreate","Spawn Ammo Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateuk90.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction3 = ["spawn50","Spawn Night Ops Box","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallCratenightops.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_90UKaction1 = ["Spawnheartscrate","Spawn Hearts and Minds Kit","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\heartsminds.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90UKaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	_UKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_alphaaction6 = ["spawn40","Spawn 40mm Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\40ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_alphaaction6,true] call ace_interact_menu_fnc_addActionToClass;

	
	_90charlieaction2 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90charlieaction2,true] call ace_interact_menu_fnc_addActionToClass;
		
};

if((typeOf player) in ["1990_RM_British_2IC_Mix","1990_RM_British_SectionCommander_Mix"])then{

	
	_90rmUKaction = ["Spawnsmall90UKCreate","Spawn Ammo Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateuk90RM.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90rmUKaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction3 = ["spawn50","Spawn Night Ops Box","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallCratenightops.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_90rmUKaction1 = ["Spawnheartscrate","Spawn Hearts and Minds Kit","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\heartsmindsRM.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90rmUKaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_90rmUKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90rmUKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_90rmUKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90rmUKaction4,true] call ace_interact_menu_fnc_addActionToClass;

	_90rmaction2 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90rmaction2,true] call ace_interact_menu_fnc_addActionToClass;
		
};








if((typeOf player) in ["2000_British_SectionCommander_Desert","2000_British_SectionCommander","2000_British_2IC_Desert","2000_British_2IC","2000_British_SectionCommander_Desert_light","2000_British_SectionCommander_light","2000_British_2IC_Desert_light","2000_British_2IC_light","2000_UKSF_Sectionleader","2000_UKSF_2ic"])then{



	_hUKaction3 = ["SpawnsmallUKCreate","Spawn UK Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateuk2000.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hUKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	if(!((typeOf player) in ["2000_UKSF_Sectionleader","2000_UKSF_2ic"]))then{
	_hUKaction3 = ["SpawnsmallUKCreate","Spawn Marksman Rifle","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\marksmancrateuk.sqf"},{(count units group player) >= 8}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hUKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	};
	_UKaction3 = ["spawn50","Spawn Night Ops Box","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallCratenightops.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_haction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_haction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	_UKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_alphaaction6 = ["spawn40","Spawn 40mm Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\40ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_alphaaction6,true] call ace_interact_menu_fnc_addActionToClass;

	
};




if((typeOf player) in ["2000_British_Spotter", "2000_British_Spotter_desert","2000_British_Sniper","2000_British_Sniper_desert"])then{



	_hUKaction3 = ["SpawnsmallUKCreate","Spawn Anti Material Rifle","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\barretrifle.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hUKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_hUKaction3 = ["SpawnsmallUKCreate","Spawn Sniper Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcratesniper2000.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hUKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	

	
};






if((typeOf player) in ["TWC_2000_US_Army_SectionCommander","TWC_2000_US_Army_TeamLeader","2000_USMC_Squadleader_d","2000_USMC_Squadleader","2000_USMC_Teamleader_d","2000_USMC_Teamleader"])then{


	_hcharlieaction2 = ["SpawnsmallcharlieCreate","Spawn US Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallcrateUS2000.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hcharlieaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hUKaction3 = ["SpawnsmallUKCreate","Spawn Marksman Rifle","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\marksmancrateus.sqf"},{(count units group player) >= 8}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hUKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction3 = ["spawn50","Spawn Night Ops Box","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallCratenightops.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_haction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\smallMedical.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_haction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	_UKaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\50calammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_UKaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\762ammo.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_alphaaction6 = ["spawn40","Spawn 40mm Ammo","",{execvm "insurgency_core\client\sys_player\boxes\supply_boxes\40ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_alphaaction6,true] call ace_interact_menu_fnc_addActionToClass;

	
};




if ((["commander", typeof player] call BIS_fnc_inString) || (["leader", typeof player] call BIS_fnc_inString) || (["2ic", typeof player] call BIS_fnc_inString) || (["pilot", typeof player] call BIS_fnc_inString) || (["spotter", typeof player] call BIS_fnc_inString)) then {
	_vic = ["spawn762","Spawn Vehicles","",{[_target] execvm "insurgency_core\client\sys_player\vehicledrop.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	["UK3CB_BAF_MAN_HX58_Container_Green",0,["ACE_MainActions"],_vic,true] call ace_interact_menu_fnc_addActionToClass;};

//if((typeOf player) in ["Modern_British_Quartermaster","2000_British_quartermaster_Desert","1990_British_quartermaster_Desert"])then{
if([player] call TWC_Core_fnc_ismanagement)then{
execVM "insurgency_core\client\zeus\camera.sqf";

	_vehaction1 = ["base_Interact","Management","",{},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions"], _vehaction1] call ace_interact_menu_fnc_addActionToObject;

	_action3 = ["Zeus","TP to/from base","",{execVM "insurgency_core\client\zeus\fnc_management_tp.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action3] call ace_interact_menu_fnc_addActionToObject;
	_action2 = ["Zeus","Spectator On","",{execVM "insurgency_core\client\zeus\spectator_on.sqf";(player setvariable ["twcmgmt_spectate", 1])},{(player getvariable ["twcmgmt_spectate", 0]) == 0}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action2] call ace_interact_menu_fnc_addActionToObject;
	_action3 = ["Zeus","Spectator Off","",{execVM "insurgency_core\client\zeus\spectator_off.sqf";(player setvariable ["twcmgmt_spectate", 0])},{(player getvariable ["twcmgmt_spectate", 0]) == 1}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action3] call ace_interact_menu_fnc_addActionToObject;
	/*
	_action4 = ["Zeus","Basemode On","",{execVM "insurgency_core\client\zeus\basemode_on.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action4] call ace_interact_menu_fnc_addActionToObject;
	_action5 = ["Zeus","Basemode Off","",{execVM "insurgency_core\client\zeus\basemode_off.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action5] call ace_interact_menu_fnc_addActionToObject;
	*/
	_action6 = ["Zeus","Unflip Current Vehicle","",{(vehicle player) setpos ((getpos (vehicle player)) vectoradd [0,0,2]);(vehicle player) setvectordirandup [vectordir (vehicle player), [0,0,1]]},{(vehicle player != player)}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action6] call ace_interact_menu_fnc_addActionToObject;
	
	_action6 = ["Zeus","Repair Current Vehicle","",{execVM "insurgency_core\client\zeus\zrepair.sqf"},{(vehicle player != player)}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action6] call ace_interact_menu_fnc_addActionToObject;
	
	
	_action6 = ["Zeus","Enemy Siren","",{execVM "insurgency_core\server\sys_basedefence\INF_Alarm.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action6] call ace_interact_menu_fnc_addActionToObject;
	
	
	_action7 = ["Zeus","IDF Siren","",{execVM "insurgency_core\server\sys_basedefence\IDF_Alarm.sqf"
},_condition] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action7] call ace_interact_menu_fnc_addActionToObject;
	
	_action8 = ["Zeus","Clear Siren","",{execVM "insurgency_core\server\sys_basedefence\INF_Alarmclear.sqf"},_condition] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action8] call ace_interact_menu_fnc_addActionToObject;

};
