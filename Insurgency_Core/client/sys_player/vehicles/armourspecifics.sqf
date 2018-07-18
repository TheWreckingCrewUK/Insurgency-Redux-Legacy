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
};


if (typeof _veh == "CUP_B_MCV80_GB_W_SLAT") then {

		if ((["90", twc_missionname] call BIS_fnc_inString) || (["00", twc_missionname] call BIS_fnc_inString)) then {

[
	_veh,
	["Woodland",1], 
	["HideSlat",0,"HideProxy_Desert",0,"HideProxy_Woodland",1]
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





