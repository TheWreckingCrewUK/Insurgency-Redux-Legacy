params["_heli"];

if(isNil "_heli")exitWith{hint "No vehicle was given to the spawn system, please notify management"};


_veh = _heli createvehicle (getPos AmmoBoxSpawner);

_colour = (["White", "Red", "Olive", "Grey", "Black", "Camo", "DarkBlue", "DarkGrey"] call bis_fnc_selectrandom);
[
	_veh,
	[_colour,1], 
	true
] call BIS_fnc_initVehicle;


if (_heli == "CUP_O_Hilux_unarmed_TK_INS") then {
	
	_a = "land_nav_pier_pneu" createvehicle [0,0,1000];
	_a attachto [_veh, [-1,-0.3,-0.5]];_y = 0; _p = 0; _r = 5; 
	_a setVectorDirAndUp [ 
	 [sin _y * cos _p,cos _y * cos _p,sin _p], 
	 [[sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D 
	];

	_a = "Land_CanisterPlastic_F" createvehicle [0,0,1000];
	_a attachto [_veh, [1.1,-0.3,-0.5]];_y = 0; _p = 0; _r = -10; 
	_a setVectorDirAndUp [ 
	 [sin _y * cos _p,cos _y * cos _p,sin _p], 
	 [[sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D 
	];
	[_a, 100] call acex_field_rations_fnc_setRemainingWater;
	

	_a = "Fuel_can" createvehicle [0,0,1000];
	_a attachto [_veh, [-0.4,-2.55,-0.5]];_y = 0; _p = 0; _r = 0; 
	_a setVectorDirAndUp [ 
	 [sin _y * cos _p,cos _y * cos _p,sin _p], 
	 [[sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D 
	];
	[_a, 20] call ace_refuel_fnc_makeSource;
	[_a, true, [0, 1, 0], 10] call ace_dragging_fnc_setCarryable;	
};

if (_heli == "CUP_O_Hilux_M2_TK_INS") then {
	
	_a = "land_nav_pier_pneu" createvehicle [0,0,1000];
	_a attachto [_veh, [1.1,-0.3,-0.5]];_y = 180; _p = 0; _r = 5;  
	_a setVectorDirAndUp [  
	 [sin _y * cos _p,cos _y * cos _p,sin _p],  
	 [[sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D  
	]; 


	_a = "Land_CanisterPlastic_F" createvehicle [0,0,1000];
	_a attachto [_veh, [-0.4,-0.8,-0.35]];_y = 180; _p = 0; _r = -3;  
	_a setVectorDirAndUp [  
	 [sin _y * cos _p,cos _y * cos _p,sin _p],  
	 [[sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D  
	]; 
	[_a, 100] call acex_field_rations_fnc_setRemainingWater;

	_a = "Land_BarrelSand_F" createvehicle [0,0,1000];
	_a attachto [_veh, [0.3,-0.8,-0.33]];_y = 180; _p = 0; _r = 1;  
	_a setVectorDirAndUp [  
	 [sin _y * cos _p,cos _y * cos _p,sin _p],  
	 [[sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D  
	]; 

	_a = "Fuel_can" createvehicle [0,0,1000];
	_a attachto [_veh, [0.97,-2.1,-0.5]];_y = 90; _p = 5; _r = -3;  
	_a setVectorDirAndUp [  
	 [sin _y * cos _p,cos _y * cos _p,sin _p],  
	 [[sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D  
	];
	[_a, 20] call ace_refuel_fnc_makeSource;
	[_a, true, [0, 1, 0], 10] call ace_dragging_fnc_setCarryable;	


	_a = "rhsusf_ammocan_M2A1" createvehicle [0,0,1000];
	_a attachto [_veh, [-0.91,-1,-0.5]];_y = 90; _p = -4; _r = 0;  
	_a setVectorDirAndUp [  
	 [sin _y * cos _p,cos _y * cos _p,sin _p],  
	 [[sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D  
	]; 

	_a = "rhsusf_ammocan_M2A1" createvehicle [0,0,1000];
	_a attachto [_veh, [-0.91,-1.33,-0.5]];_y = 90; _p = -4; _r = 0;  
	_a setVectorDirAndUp [  
	 [sin _y * cos _p,cos _y * cos _p,sin _p],  
	 [[sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D  
	]; 



	_a = "rhsusf_ammocan_M2A1" createvehicle [0,0,1000];
	_a attachto [_veh, [-0.91,-1.66,-0.5]];_y = 90; _p = -4; _r = 0;  
	_a setVectorDirAndUp [  
	 [sin _y * cos _p,cos _y * cos _p,sin _p],  
	 [[sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D  
	]; 


	_a = "Land_WoodenWall_03_s_d_pole_F" createvehicle [0,0,1000];
	_a attachto [_veh, [-0.92,-0.9,-0.52]];_y = 0; _p = 90; _r = 0;  
	_a setVectorDirAndUp [  
	 [sin _y * cos _p,cos _y * cos _p,sin _p],  
	 [[sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D  
	]; 


	_a = "Land_WoodenWall_03_s_d_pole_F" createvehicle [0,0,1000];
	_a attachto [_veh, [-0.99,-0.9,-0.4]];_y = 0; _p = 90; _r = 0;  
	_a setVectorDirAndUp [  
	 [sin _y * cos _p,cos _y * cos _p,sin _p],  
	 [[sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D  
	]; 

	_a = "Fuel_can" createvehicle [0,0,1000];
	_a attachto [_veh, [-0.93,-0.1,-0.4]];_y = 90; _p = -8; _r = 0;  
	_a setVectorDirAndUp [  
	 [sin _y * cos _p,cos _y * cos _p,sin _p],  
	 [[sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D  
	]; 
	[_a, 20] call ace_refuel_fnc_makeSource;
	[_a, true, [0, 1, 0], 10] call ace_dragging_fnc_setCarryable;	

	_a = "Fuel_can" createvehicle [0,0,1000];
	_a attachto [_veh, [-0.93,-0.6,-0.4]];_y = 90; _p = -8; _r = 0;  
	_a setVectorDirAndUp [  
	 [sin _y * cos _p,cos _y * cos _p,sin _p],  
	 [[sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D  
	]; 
	[_a, 20] call ace_refuel_fnc_makeSource;
	[_a, true, [0, 1, 0], 10] call ace_dragging_fnc_setCarryable;	



};




clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
//clearMagazineCargoGlobal _veh;
clearitemCargoGlobal _veh;

_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Vehicle Spawner</t>"; 

 _text1 =  "<br />The Pickup Has Been Spawned.";
_spawntext = parsetext (_title + _text1);
hint _spawntext;

_veh addweaponcargoglobal ["rhs_weap_pkm", 1];
_veh addmagazinecargoglobal ["rhs_100Rnd_762x54mmR_green", 1];

[_veh, player, 2] call twc_fnc_genericfillvehicle;


_boxaction = ["deleteCreate","Return Vehicle","",{deleteVehicle this;

},{(count (player nearobjects ["Land_InfoStand__veh_F", 200]) > 0)}] call ace_interact_menu_fnc_createAction;
[_veh,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;