/* post-spawn instructions for spawned vehicles

*/

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



if (typeof _veh == "RHS_M2A3_BUSKIII_wd") then {

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



if (typeof _veh == "RHS_M2A2_wd") then {

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

[
	_veh,
	["Desert",1], 
	["HideSlat",0,"HideProxy_Desert",1,"HideProxy_Woodland",0]
] call BIS_fnc_initVehicle;
};

	//if ((group player getvariable ["twc_ismechanised", 0]) == 1) then {

		_box = _veh;
		if (["90", twc_missionname] call BIS_fnc_inString) then {
			// 1990
			//Weapons
			_box AddWeaponCargoGlobal ["rhs_weap_m72a7",3];


			//supplies
			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd",50];
			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd_T",20];

			_box AddMagazineCargoGlobal ["ukcw_13rd_9x19",8];

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

		if (["00", twc_missionname] call BIS_fnc_inString) then	{
			// 2000
			
			//Weapons
			_box AddWeaponCargoGlobal ["rhs_weap_m72a7",3];


			//supplies
			_box AddMagazineCargoGlobal ["UK3CB_BAF_762_100Rnd_T",6];
			_box AddMagazineCargoGlobal ["UK3CB_BAF_762_100Rnd",10];

			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd",40];
			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd_T",15];

			_box AddMagazineCargoGlobal ["UGL_FlareWhite_F",5];
			_box AddMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",20];
			_box AddMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",5];

			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd",10];
			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd_T",5];

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

//	if ((group player getvariable ["twc_ismechanised", 0]) == 1) then {

//Weapons
	_box AddWeaponCargoGlobal ["rhs_weap_m72a7",3];


	//supplies
	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_100Rnd_T",5];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_100Rnd",9];

	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd",40];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd_T",15];

	_box AddMagazineCargoGlobal ["UGL_FlareWhite_F",5];
	_box AddMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",20];
	_box AddMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",5];

	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd",9];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd_T",4];

	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd_T",4];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd",10];

	_box AddMagazineCargoGlobal ["rhsusf_mag_17Rnd_9x19_JHP",8];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_9_15Rnd",8];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_12G_Pellets",8];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_12G_Slugs",8];

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
//	};
};

//};
};

if (typeof _veh == "CUP_B_MCV80_GB_W_SLAT") then {

		if ((["90", twc_missionname] call BIS_fnc_inString) || (["00", twc_missionname] call BIS_fnc_inString)) then {

[
	_veh,
	["Woodland",1], 
	["HideSlat",0,"HideProxy_Desert",0,"HideProxy_Woodland",1]
] call BIS_fnc_initVehicle;
};

	//if ((group player getvariable ["twc_ismechanised", 0]) == 1) then {

		_box = _veh;
		if (["90", twc_missionname] call BIS_fnc_inString) then {
			// 1990
			//Weapons
			_box AddWeaponCargoGlobal ["rhs_weap_m72a7",3];


			//supplies
			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd",50];
			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd_T",20];

			_box AddMagazineCargoGlobal ["ukcw_13rd_9x19",8];

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

		if (["00", twc_missionname] call BIS_fnc_inString) then	{
			// 2000
			
			//Weapons
			_box AddWeaponCargoGlobal ["rhs_weap_m72a7",3];


			//supplies
			_box AddMagazineCargoGlobal ["UK3CB_BAF_762_100Rnd_T",6];
			_box AddMagazineCargoGlobal ["UK3CB_BAF_762_100Rnd",10];

			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd",40];
			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd_T",15];

			_box AddMagazineCargoGlobal ["UGL_FlareWhite_F",5];
			_box AddMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",20];
			_box AddMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",5];

			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd",10];
			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd_T",5];

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

	//if ((group player getvariable ["twc_ismechanised", 0]) == 1) then {

//Weapons
	_box AddWeaponCargoGlobal ["rhs_weap_m72a7",3];


	//supplies
	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_100Rnd_T",5];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_100Rnd",9];

	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd",40];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd_T",15];

	_box AddMagazineCargoGlobal ["UGL_FlareWhite_F",5];
	_box AddMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",20];
	_box AddMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",5];

	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd",9];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd_T",4];

	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd_T",4];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd",10];

	_box AddMagazineCargoGlobal ["rhsusf_mag_17Rnd_9x19_JHP",8];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_9_15Rnd",8];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_12G_Pellets",8];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_12G_Slugs",8];

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
//};
};

//};
};


if (typeof _veh == "rhsusf_m1a2sep1tuskiid_usarmy") then {

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

if (typeof _veh == "rhsusf_m1a2sep1tuskid_usarmy") then {

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

if (typeof _veh == "rhsusf_m1a1aimwd_usarmy") then {

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
			_box AddWeaponCargoGlobal ["rhs_weap_m72a7",2];



			//supplies
			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd",40];
			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd_T",15];

			_box AddMagazineCargoGlobal ["ukcw_13rd_9x19",3];

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
			_box AddWeaponCargoGlobal ["rhs_weap_m72a7",2];

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
	_box AddWeaponCargoGlobal ["rhs_weap_m72a7",2];


	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd",30];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd_T",10];

	_box AddMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",10];

	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd",7];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd_T",3];

	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd_T",4];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd",10];

	_box AddMagazineCargoGlobal ["rhsusf_mag_17Rnd_9x19_JHP",3];
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
			_box AddWeaponCargoGlobal ["rhs_weap_m72a7",1];


			//supplies
			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd",30];
			_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd_T",15];

			_box AddMagazineCargoGlobal ["ukcw_13rd_9x19",3];

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
			_box AddWeaponCargoGlobal ["rhs_weap_m72a7",1];


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
	_box AddWeaponCargoGlobal ["rhs_weap_m72a7",1];



	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd",25];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd_T",5];

	_box AddMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",6];

	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd",6];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd_T",3];
	
	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_100Rnd_T",2];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_100Rnd",6];

	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd_T",4];
	_box AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd",10];

	_box AddMagazineCargoGlobal ["rhsusf_mag_17Rnd_9x19_JHP",3];
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





