// add vehicles to forward base, requestable by leaders
params ["_boxpos", ["_showhint", false]];

_car1 = "UK3CB_BAF_LandRover_Soft_Sand_A";

	if (twc_wdveh == 1) then {
_car1 = "UK3CB_BAF_LandRover_Soft_Green_A";};


//car2 stays green because a later script turns it sandy coloured in a different way to differentiate it from base vehicles
_car2 = "UK3CB_BAF_LandRover_WMIK_GPMG_Green_A";

if (["twc_ana", typeof player] call BIS_fnc_inString) then {

_car1 = "CUP_O_Hilux_unarmed_TK_INS";

_car2 = "CUP_O_Hilux_M2_TK_INS";
};

if (["usmc", typeof player] call BIS_fnc_inString) then {

_car1 = "CUP_B_HMMWV_Unarmed_USA";

_car2 = "CUP_B_HMMWV_M2_USA";
};


if (["70", twc_missionname] call BIS_fnc_inString) then {
	_car1 = "UK3CB_BAF_LandRover_Snatch_NI_A";
	_car2 = "UK3CB_BAF_LandRover_Snatch_NI_A";

	if (["twc_ana", typeof player] call BIS_fnc_inString) then {
		_car1 = "CUP_C_V3S_Open_TKC";
		_car2 = "CUP_I_Datsun_4seat_TK";
	};
	if (["CUP_O_RU", typeof player] call BIS_fnc_inString) then {
		_car1 = "CUP_O_UAZ_Unarmed_RU";
		_car2 = "CUP_O_Ural_Open_RU";
	};
};


if (["90", twc_missionname] call BIS_fnc_inString) then {


	if (twc_wdveh == 0) then {
	_car1 = "UK3CB_BAF_LandRover_Snatch_FFR_Sand_A";
} else {
	_car1 = "UK3CB_BAF_LandRover_Snatch_FFR_Green_A";
};


_car2 = "UK3CB_BAF_LandRover_WMIK_GPMG_Green_A";

if (["twc_ana", typeof player] call BIS_fnc_inString) then {


_car1 = "CUP_I_Datsun_4seat_TK";

_car2 = "CUP_I_Datsun_PK_TK_Random";
};

if (["usmc", typeof player] call BIS_fnc_inString) then {

_car1 = "CUP_B_HMMWV_Unarmed_USA";

_car2 = "CUP_B_HMMWV_M2_USA";
};



};

_playercount = (((count(allPlayers - entities "HeadlessClient_F"))/1.1) +2) max 2;
if (count (_boxpos nearentities ["car", 200]) >_playercount) exitwith {
	if (_showhint) then {
		hint "there are already enough vehicles here";
	};
};
if (count (_boxpos nearobjects ["Vysilacka", 200]) == 0) exitwith {
	if (_showhint) then {
		hint "There's no forward base here"
	};
};

_vehicle = createvehicle [_car1, [0,0,0]];
_total = (ceil (((_playercount * 0.5)-(count (_boxpos nearentities ["car", 200])))* 1.5) max 1) min 4;
if (_showhint) then {
	hint format ["Spawning %1 Vehicles", _total *2];
};
//vehdrop = {
//params ["_boxpos"];

//_pos = [_boxpos,[5,50],random 360,0, [1,50], [50,(typeof _vehicle)]] call SHK_pos; 
_pos = [_boxpos, 5, 50, 10, 0, 1, 0, [], [_boxpos, _boxpos]] call BIS_fnc_findSafePos;

for "_i" from 1 to _total do{ 

//_spawnPos = [_pos,[5,50],random 360,0, [1,40], [50,(typeof _vehicle)]] call SHK_pos; 
_spawnPos = [_pos, 5, 50, 10, 0, 1, 0, [], [_pos, _pos]] call BIS_fnc_findSafePos;
_wmik = createvehicle [_car2, _spawnPos];  
clearweaponcargoglobal _wmik; 
_wmik addmagazinecargoglobal ["UK3CB_BAF_762_200Rnd_T", 5];



sleep 1;
if ((vectorMagnitude (velocity _wmik))>2 || (damage _wmik > 0)) then {deletevehicle _wmik;
//_spawnPos = [_pos,[5,50],random 360,0, [1,50], [50,(typeof _vehicle)]] call SHK_pos; 
_spawnPos = [_pos, 5, 50, 10, 0, 1, 0, [], [_pos, _pos]] call BIS_fnc_findSafePos;
_wmik = createvehicle [_car2, _spawnPos];  
clearweaponcargoglobal _wmik; 



sleep 1;
if ((vectorMagnitude (velocity _wmik))>2 || (damage _wmik > 0)) then {deletevehicle _wmik;
//_spawnPos = [_pos,[5,50],random 360,0, [1,50], [50,(typeof _vehicle)]] call SHK_pos; 
_spawnPos = [_pos, 5, 50, 10, 0, 1, 0, [], [_pos, _pos]] call BIS_fnc_findSafePos;
_wmik = createvehicle [_car2, _spawnPos];  



sleep 5;
_wmik setdamage 0;

};
};

clearweaponcargoglobal _wmik; 
clearitemcargoglobal _wmik; 
clearmagazinecargoglobal _wmik; 

if (typeof _wmik == "UK3CB_BAF_LandRover_WMIK_GPMG_Green_A") then {
[ 
 _wmik, 
 nil, 
 ["AirIntakeSnorkel_Hide",0,"CamoNet_Hide",1,"Gear_Hide",1,"AerialAtuL_Hide",1,"AerialAtuR_Hide",1,"AerialFL_Hide",0,"AerialFR_Hide",1,"Flag_Hide",0,"sparewheel_hide",0,"javelintubespare_hide",1,"radio_hide",0] 
] call BIS_fnc_initVehicle; 

_wmik addmagazinecargoglobal ["UK3CB_BAF_762_200Rnd_T", 10];


	if (twc_wdveh == 0) then {

_wmik setObjectTextureGlobal [2, "uk3cb_baf_vehicles\addons\uk3cb_baf_vehicles_landrover\data\lr_base_baf_sand2_co.paa"];

_wmik setObjectTextureGlobal [7, "uk3cb_baf_vehicles\addons\uk3cb_baf_vehicles_landrover\data\lr_wmik_pannier_sand_co.paa"];

};

};

if (typeof _wmik == "I_G_Offroad_01_armed_F") then {
  
 [ 
 _wmik, 
 ["Beige",1],  
 ["HideDoor1",0,"HideDoor2",0,"HideDoor3",1,"HideBackpacks",1,"HideBumper1",1,"HideBumper2",0,"HideConstruction",1,"hidePolice",1,"HideServices",1,"BeaconsStart",0,"BeaconsServicesStart",0] 
] call BIS_fnc_initVehicle;


_wmik setObjectTextureGlobal [0, "a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa"];
};

if (typeof _wmik == "CUP_B_HMMWV_M2_USA") then {

};

//_spawnPos = [_pos,[5,50],random 360,0, [1,50], [50,(typeof _vehicle)]] call SHK_pos; 
_spawnPos = [_pos, 5, 50, 10, 0, 1, 0, [], [_pos, _pos]] call BIS_fnc_findSafePos;
_car = createvehicle [_car1, _spawnPos];
sleep 1;
if ((vectorMagnitude (velocity _car))>2 || (damage _car > 0)) then {deletevehicle _car;

//_spawnPos = [_pos,[5,50],random 360,0, [1,50], [50,(typeof _vehicle)]] call SHK_pos; 
_spawnPos = [_pos, 5, 50, 10, 0, 1, 0, [], [_pos, _pos]] call BIS_fnc_findSafePos;
_car = createvehicle [_car1, _spawnPos];
sleep 1;
if ((vectorMagnitude (velocity _car))>2 || (damage _car > 0)) then {deletevehicle _car;

//_spawnPos = [_pos,[5,50],random 360,0, [1,50], [50,(typeof _vehicle)]] call SHK_pos; 
_spawnPos = [_pos, 5, 50, 10, 0, 1, 0, [], [_pos, _pos]] call BIS_fnc_findSafePos;
_car = createvehicle [_car1, _spawnPos];
sleep 5;
_car setdamage 0;

};
};

clearweaponcargoglobal _car; 
clearitemcargoglobal _car; 
clearmagazinecargoglobal _car; 

if ((typeof _car == "UK3CB_BAF_LandRover_Soft_Green_A") || (typeof _car == "UK3CB_BAF_LandRover_Soft_Green_A")) then {[ 
_car, 
 nil, 
 ["AirIntakeSnorkel_Hide",0,"CamoNet_Hide",1,"stripdowndoorrear_hide",1,"AerialAtuL_Hide",1,"AerialAtuR_Hide",1,"AerialFL_Hide",0,"AerialFR_Hide",1,"Flag_Hide",0,"sparewheel_hide",0,"javelintubespare_hide",1,"radio_hide",0] 
] call BIS_fnc_initVehicle; 

};

if (typeof _car == "C_Offroad_01_F") then {
_car  
 setObjectTextureGlobal [0, "a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa"]; 
 [ 
 _car, 
 ["Beige",1],  
 ["HideDoor1",0,"HideDoor2",0,"HideDoor3",1,"HideBackpacks",1,"HideBumper1",1,"HideBumper2",0,"HideConstruction",1,"hidePolice",1,"HideServices",1,"BeaconsStart",0,"BeaconsServicesStart",0] 
] call BIS_fnc_initVehicle;
};

if (typeof _car == "CUP_B_HMMWV_Unarmed_USA") then {

};






};
deletevehicle _vehicle;
//};

//[[_total],vehdrop] remoteExec ["bis_fnc_execvm", 2];