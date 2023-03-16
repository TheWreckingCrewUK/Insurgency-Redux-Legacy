 _spawnpos = getpos AmmoBoxSpawner;
 
_vehtype = "CUP_O_Hilux_unarmed_TK_INS";

	
 _car = _vehtype createvehicle _spawnpos;  
_veh = _car;

_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Vehicle Spawner</t>"; 

 _text1 =  "<br />The Vehicle Has Been Spawned. It's Already Loaded With Ammunition";
_spawntext = parsetext (_title + _text1);
hint _spawntext;



_boxaction = ["deleteCreate","Return Vehicle","",{
{deletevehicle _x} foreach (attachedobjects this);

deleteVehicle this;

},{(count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)}] call ace_interact_menu_fnc_createAction;
[_veh,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;

clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearitemCargoGlobal _veh;


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


[_veh, player, 6] call twc_fnc_genericfillvehicle;

	
_colour = (["White", "White", "White", "Red", "Olive", "Grey", "Black", "Camo", "DarkBlue", "DarkGrey"] call bis_fnc_selectrandom);

[
	_veh,
	[_colour,1], 
	true
] call BIS_fnc_initVehicle;
