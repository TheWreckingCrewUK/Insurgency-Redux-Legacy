/* post-spawn instructions for spawned vehicles

*/


if ((typeof _veh == "UK3CB_BAF_LandRover_Soft_Green_A") || (typeof _veh == "UK3CB_BAF_LandRover_Soft_Green_A")) then {[ 
_veh, 
 nil, 
 ["AirIntakeSnorkel_Hide",0,"CamoNet_Hide",1,"stripdowndoorrear_hide",1,"AerialAtuL_Hide",1,"AerialAtuR_Hide",1,"AerialFL_Hide",0,"AerialFR_Hide",1,"Flag_Hide",0,"sparewheel_hide",0,"javelintubespare_hide",1,"radio_hide",0] 
] call BIS_fnc_initVehicle; 

};

if (typeof _veh == "C_Offroad_01_F") then {
_veh  
 setObjectTextureGlobal [0, "a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa"]; 
 [ 
 _veh, 
 ["Beige",1],  
 ["HideDoor1",0,"HideDoor2",0,"HideDoor3",1,"HideBackpacks",1,"HideBumper1",1,"HideBumper2",0,"HideConstruction",1,"hidePolice",1,"HideServices",1,"BeaconsStart",0,"BeaconsServicesStart",0] 
] call BIS_fnc_initVehicle;
};



if (typeof _veh == "UK3CB_BAF_LandRover_WMIK_GPMG_Green_A") then {
[ 
 _veh, 
 nil, 
 ["AirIntakeSnorkel_Hide",0,"CamoNet_Hide",1,"Gear_Hide",1,"AerialAtuL_Hide",1,"AerialAtuR_Hide",1,"AerialFL_Hide",0,"AerialFR_Hide",1,"Flag_Hide",0,"sparewheel_hide",0,"javelintubespare_hide",1,"radio_hide",0] 
] call BIS_fnc_initVehicle; 

_veh addmagazinecargoglobal ["UK3CB_BAF_762_200Rnd_T", 10];


	if (twc_wdveh == 0) then {

_veh setObjectTextureGlobal [2, "uk3cb_baf_vehicles\addons\uk3cb_baf_vehicles_landrover\data\lr_base_baf_sand2_co.paa"];

_veh setObjectTextureGlobal [7, "uk3cb_baf_vehicles\addons\uk3cb_baf_vehicles_landrover\data\lr_wmik_pannier_sand_co.paa"];

};

};

if (typeof _veh == "I_G_Offroad_01_armed_F") then {
  
 [ 
 _veh, 
 ["Beige",1],  
 ["HideDoor1",0,"HideDoor2",0,"HideDoor3",1,"HideBackpacks",1,"HideBumper1",1,"HideBumper2",0,"HideConstruction",1,"hidePolice",1,"HideServices",1,"BeaconsStart",0,"BeaconsServicesStart",0] 
] call BIS_fnc_initVehicle;


_veh setObjectTextureGlobal [0, "a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa"];
};

//rosomak, polish APC
if (typeof _veh == "B_APC_Wheeled_01_cannon_F") then {

if (twc_wdveh == 1) then {
	[
		_veh,
		["Olive",1], 
		["showBags",1,"showCamonetHull",1,"showCamonetTurret",1,"showSLATHull",0,"showSLATTurret",0]
	] call BIS_fnc_initVehicle;
	} else {
	[
		_veh,
		["Sand",1], 
		["showBags",0,"showCamonetHull",0,"showCamonetTurret",0,"showSLATHull",1,"showSLATTurret",1]
	] call BIS_fnc_initVehicle;
	};
};



if (typeof _veh == "ukcw_fv432_gpmg") then {
	if ((["70", twc_missionname] call BIS_fnc_inString)) then {
	_box = _veh;
		_box AddMagazineCargoGlobal ["UK3CB_BAF_762_20Rnd",40];
		_box AddMagazineCargoGlobal ["UK3CB_BAF_762_20Rnd_T",15];
		_box AddMagazineCargoGlobal ["UK3CB_BAF_9_13Rnd",3];
		_box AddMagazineCargoGlobal ["UK3CB_BAF_762_200Rnd_T",10];
		_box addItemCargoGlobal ["ACE_fieldDressing",25];
		_box addItemCargoGlobal ["ACE_elasticBandage",25];
		_box addItemCargoGlobal ["ACE_quikclot",25];
		_box addItemCargoGlobal ["ACE_packingBandage",25];
		_box addItemCargoGlobal ["ACE_salineIV_500",6];
		_box addItemCargoGlobal ["ACE_atropine",5];
		_box addItemCargoGlobal ["ACE_epinephrine",5];
		_box addItemCargoGlobal ["ACE_morphine",5];
		_box addItemCargoGlobal ["HandGrenade",2];
		_box addItemCargoGlobal ["SmokeShell",4];
		_box addItemCargoGlobal ["SmokeShellRed",4];
	};
};

if (typeof _veh == "CUP_B_M2A3Bradley_USA_W_wd") then {

if (twc_wdveh == 1) then {
	[
		_veh,
		["standard",1], 
		["DUKE_Hide",1,"IFF_Panels_Hide",0]
	] call BIS_fnc_initVehicle;
	} else {
	[
		_veh,
		["Desert",1], 
		["DUKE_Hide",1,"IFF_Panels_Hide",0]
	] call BIS_fnc_initVehicle;
	};
};



if (typeof _veh == "CUP_B_M2Bradley_USA_W") then {

if (twc_wdveh == 1) then {
	[
		_veh,
		["standard",1], 
		["DUKE_Hide",1,"IFF_Panels_Hide",0]
	] call BIS_fnc_initVehicle;
	} else {
	[
		_veh,
		["Desert",1], 
		["DUKE_Hide",1,"IFF_Panels_Hide",0]
	] call BIS_fnc_initVehicle;
	};
};



if (typeof _veh == "CUP_B_Challenger2_2CW_BAF") then {

if (twc_wdveh == 1) then {
	[
	_veh,
	["woodlandTwoColor",1], 
	true
] call BIS_fnc_initVehicle;
	} else {
[
	_veh,
	["desertTan",1], 
	true
] call BIS_fnc_initVehicle;
	};
};



if (typeof _veh == "CUP_B_MCV80_GB_D_SLAT") then {

	if ((["90", twc_missionname] call BIS_fnc_inString) || (["00", twc_missionname] call BIS_fnc_inString)) then {
		if (twc_wdveh == 1) then {
			[
				_veh,
				["Woodland",1], 
				["HideSlat",0,"HideProxy_Desert",0,"HideProxy_Woodland",1]
			] call BIS_fnc_initVehicle;
		} else {
			[
				_veh,
				["Desert",1], 
				["HideSlat",0,"HideProxy_Desert",1,"HideProxy_Woodland",0]
			] call BIS_fnc_initVehicle;
		};
	};

		_box = _veh;
		if (["90", twc_missionname] call BIS_fnc_inString) then {
			// 1990
			[_veh] execvm "insurgency_Core\client\sys_player\boxes\supply_boxes\smallcrateuk90.sqf";
		};

		if (["00", twc_missionname] call BIS_fnc_inString) then	{
			// 2000
			[_veh] execvm "insurgency_Core\client\sys_player\boxes\supply_boxes\smallcrateuk2000.sqf";
		};




		if ((!(["90", twc_missionname] call BIS_fnc_inString)) && (!(["00", twc_missionname] call BIS_fnc_inString))) then {
		
		if (twc_wdveh == 1) then {
			[
				_veh,
				["Woodland",1], 
				["HideSlat",1,"HideProxy_Desert",0,"HideProxy_Woodland",1]
			] call BIS_fnc_initVehicle;
		} else {
			[
				_veh,
				["Desert",1], 
				["HideSlat",1,"HideProxy_Desert",1,"HideProxy_Woodland",0]
			] call BIS_fnc_initVehicle;
		};

// Modern

	//supplies
	[_veh] execvm "insurgency_Core\client\sys_player\boxes\supply_boxes\smallcrateuk.sqf";

	};

//};
};



if (typeof _veh == "CUP_B_M1A2_TUSK_MG_US_Army") then {

if (twc_wdveh == 1) then {
	[
	_veh,
	["woodland",1], 
	["IFF_Panels_Hide",0,"Miles_Hide",1,"showCamonetTurret",0,"showCamonetHull",0,"DUKE_Hide",1]
	] call BIS_fnc_initVehicle;
	} else {

[
	_veh,
	["desert",1], 
	["IFF_Panels_Hide",0,"Miles_Hide",1,"showCamonetTurret",0,"showCamonetHull",0,"DUKE_Hide",1]
	] call BIS_fnc_initVehicle;
	};
};

if (typeof _veh == "CUP_B_M1A2_TUSK_MG_US_Army") then {

if (twc_wdveh == 1) then {
	[
	_veh,
	["woodland",1], 
	["IFF_Panels_Hide",0,"Miles_Hide",1,"showCamonetTurret",0,"showCamonetHull",0]
	] call BIS_fnc_initVehicle;
	} else {

[
	_veh,
	["desert",1], 
	["IFF_Panels_Hide",0,"Miles_Hide",1,"showCamonetTurret",0,"showCamonetHull",0]
	] call BIS_fnc_initVehicle;
	};
};

if (typeof _veh == "CUP_B_M1A1_Woodland_US_Army") then {

if (twc_wdveh == 1) then {
	[
	_veh,
	["woodland",1], 
	["IFF_Panels_Hide",1,"Miles_Hide",1,"showCamonetTurret",0,"showCamonetHull",0]
	] call BIS_fnc_initVehicle;
	} else {

[
	_veh,
	["desert",1], 
	["IFF_Panels_Hide",1,"Miles_Hide",1,"showCamonetTurret",0,"showCamonetHull",0]
	] call BIS_fnc_initVehicle;
	};
};





if (typeof _veh == "CUP_B_M1128_MGS_Woodland") then {

if (twc_wdveh == 1) then {
[
	_veh,
	["Woodland",1], 
	true
	] call BIS_fnc_initVehicle;
	} else {
	[
	_veh,
	["Desert",1], 
	true
	] call BIS_fnc_initVehicle;
	};
};

if ((typeof _veh == "UK3CB_BAF_FV432_Mk3_GPMG_Green")||(typeof _veh == "UK3CB_BAF_FV432_Mk3_GPMG_Sand")) then {
_veh AddMagazineCargoGlobal ["UK3CB_BAF_762_200Rnd_T",9];

	//if ((group player getvariable ["twc_ismechanised", 0]) == 1) then {
_box = _veh;




		if (["90", twc_missionname] call BIS_fnc_inString) then {
			// 1990
			//Weapons
			_box AddWeaponCargoGlobal ["CUP_launch_M72A6",2];



			//supplies
			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd",40];
			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd_T",15];

			_box AddMagazineCargoGlobal ["UK3CB_BAF_9_13Rnd",3];

			_box addItemCargoGlobal ["ACE_fieldDressing",15];
			_box addItemCargoGlobal ["ACE_elasticBandage",15];
			_box addItemCargoGlobal ["ACE_quikclot",15];
			_box addItemCargoGlobal ["ACE_packingBandage",15];
			_box addItemCargoGlobal ["ACE_salineIV_500",4];
			_box addItemCargoGlobal ["ACE_atropine",5];
			_box addItemCargoGlobal ["ACE_epinephrine",5];
			_box addItemCargoGlobal ["ACE_morphine",5];
			_box addItemCargoGlobal ["HandGrenade",2];
			_box addItemCargoGlobal ["SmokeShell",4];
			_box addItemCargoGlobal ["SmokeShellRed",4];
			};
			
			
		if (["00", twc_missionname] call BIS_fnc_inString) then {
			// 2000
			
			//Weapons
			_box AddWeaponCargoGlobal ["CUP_launch_M72A6",2];

			//supplies

			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd",30];
			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd_T",10];

			_box AddMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",10];

			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd",7];
			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd_T",4];

			_box AddMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",10];

			_box AddMagazineCargoGlobal ["UK3CB_BAF_9_15Rnd",3];

			_box addItemCargoGlobal ["ACE_fieldDressing",15];
			_box addItemCargoGlobal ["ACE_elasticBandage",15];
			_box addItemCargoGlobal ["ACE_quikclot",15];
			_box addItemCargoGlobal ["ACE_packingBandage",15];
			_box addItemCargoGlobal ["ACE_salineIV_500",4];
			_box addItemCargoGlobal ["ACE_atropine",5];
			_box addItemCargoGlobal ["ACE_epinephrine",5];
			_box addItemCargoGlobal ["ACE_morphine",5];
			_box addItemCargoGlobal ["HandGrenade",2];
			_box addItemCargoGlobal ["SmokeShell",4];
			_box addItemCargoGlobal ["SmokeShellRed",4];
			};

		if ((!(["90", twc_missionname] call BIS_fnc_inString)) && (!(["00", twc_missionname] call BIS_fnc_inString))) then {

// Modern


//Weapons
	_box AddWeaponCargoGlobal ["CUP_launch_M72A6",2];


	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd",30];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd_T",10];

	_box AddMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",10];

	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd",7];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd_T",3];

	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd_T",4];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd",10];

	_box AddMagazineCargoGlobal ["CUP_17Rnd_9x19_glock17",3];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_9_15Rnd",5];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_12G_Pellets",5];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_12G_Slugs",5];

	_box addItemCargoGlobal ["ACE_fieldDressing",15];
	_box addItemCargoGlobal ["ACE_elasticBandage",15];
	_box addItemCargoGlobal ["ACE_quikclot",15];
	_box addItemCargoGlobal ["ACE_packingBandage",15];
	_box addItemCargoGlobal ["ACE_salineIV_500",4];
	_box addItemCargoGlobal ["ACE_atropine",5];
	_box addItemCargoGlobal ["ACE_epinephrine",5];
	_box addItemCargoGlobal ["ACE_morphine",5];
	_box addItemCargoGlobal ["HandGrenade",2];
	_box addItemCargoGlobal ["SmokeShell",4];
	_box addItemCargoGlobal ["SmokeShellRed",4];
	
};
/*} else {

_veh AddMagazineCargoGlobal ["UK3CB_BAF_762_200Rnd_T",6];
};
*/
};


if ((typeof _veh == "UK3CB_BAF_FV432_Mk3_RWS_Green")||(typeof _veh == "UK3CB_BAF_FV432_Mk3_RWS_Sand")) then {
_veh AddMagazineCargoGlobal ["UK3CB_BAF_127_100Rnd",5];

//	if ((group player getvariable ["twc_ismechanised", 0]) == 1) then {
_box = _veh;




		if (["90", twc_missionname] call BIS_fnc_inString) then {
			// 1990
			//Weapons
			_box AddWeaponCargoGlobal ["CUP_launch_M72A6",1];


			//supplies
			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd",30];
			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd_T",15];

			_box AddMagazineCargoGlobal ["UK3CB_BAF_9_13Rnd",3];

			_box addItemCargoGlobal ["ACE_fieldDressing",15];
			_box addItemCargoGlobal ["ACE_elasticBandage",15];
			_box addItemCargoGlobal ["ACE_quikclot",15];
			_box addItemCargoGlobal ["ACE_packingBandage",15];
			_box addItemCargoGlobal ["ACE_salineIV_500",4];
			_box addItemCargoGlobal ["ACE_atropine",5];
			_box addItemCargoGlobal ["ACE_epinephrine",5];
			_box addItemCargoGlobal ["ACE_morphine",5];
			_box addItemCargoGlobal ["HandGrenade",2];
			_box addItemCargoGlobal ["SmokeShell",4];
			_box addItemCargoGlobal ["SmokeShellRed",4];
			};
			
			
		if (["00", twc_missionname] call BIS_fnc_inString) then {
			// 2000
			
			//Weapons
			_box AddWeaponCargoGlobal ["CUP_launch_M72A6",1];


			//supplies

			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd",20];
			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd_T",5];

			_box AddMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",5];

			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd",5];
			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd_T",2];

			_box AddMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",5];

			_box AddMagazineCargoGlobal ["UK3CB_BAF_9_15Rnd",3];

			_box addItemCargoGlobal ["ACE_fieldDressing",15];
			_box addItemCargoGlobal ["ACE_elasticBandage",15];
			_box addItemCargoGlobal ["ACE_quikclot",15];
			_box addItemCargoGlobal ["ACE_packingBandage",15];
			_box addItemCargoGlobal ["ACE_salineIV_500",4];
			_box addItemCargoGlobal ["ACE_atropine",5];
			_box addItemCargoGlobal ["ACE_epinephrine",5];
			_box addItemCargoGlobal ["ACE_morphine",5];
			_box addItemCargoGlobal ["HandGrenade",2];
			_box addItemCargoGlobal ["SmokeShell",4];
			_box addItemCargoGlobal ["SmokeShellRed",4];
			};

		if ((!(["90", twc_missionname] call BIS_fnc_inString)) && (!(["00", twc_missionname] call BIS_fnc_inString))) then {

// Modern


//Weapons
	_box AddWeaponCargoGlobal ["CUP_launch_M72A6",1];



	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd",25];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd_T",5];

	_box AddMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",6];

	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd",6];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd_T",3];
	
	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_100Rnd_T",2];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_100Rnd",6];

	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd_T",4];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd",10];

	_box AddMagazineCargoGlobal ["CUP_17Rnd_9x19_glock17",3];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_9_15Rnd",3];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_12G_Pellets",3];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_12G_Slugs",3];

	_box addItemCargoGlobal ["ACE_fieldDressing",15];
	_box addItemCargoGlobal ["ACE_elasticBandage",15];
	_box addItemCargoGlobal ["ACE_quikclot",15];
	_box addItemCargoGlobal ["ACE_packingBandage",15];
	_box addItemCargoGlobal ["ACE_salineIV_500",4];
	_box addItemCargoGlobal ["ACE_atropine",5];
	_box addItemCargoGlobal ["ACE_epinephrine",5];
	_box addItemCargoGlobal ["ACE_morphine",5];
	_box addItemCargoGlobal ["HandGrenade",2];
	_box addItemCargoGlobal ["SmokeShell",4];
	_box addItemCargoGlobal ["SmokeShellRed",4];
	
};
/*
} else {

_veh AddMagazineCargoGlobal ["UK3CB_BAF_127_100Rnd",5];
};
*/
};





