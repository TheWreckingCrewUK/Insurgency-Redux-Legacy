
if(isNil "basemode") then{
	basemode = 0;
	publicVariable "basemode";
};

if(isNil "basesafe") then{
	basesafe = 201;
	publicVariable "basesafe";
};

if(isNil "alarm") then{
	alarm = 0;
	publicvariable "alarm";
};

if(isNil "clearing") then{
	clearing = 0;
	publicvariable "clearing";
};

if(isNil "idfreported") then{
	idfreported = 0;
	publicvariable "idfreported";
};

if(isNil "idfon") then{
	idfon = 0;
	publicvariable "idfon";
};


if(isNil "clearingmarker") then{
	clearingmarker = 0;
	publicvariable "clearingmarker";
};

if(isNil "idfGuns") then{
	idfGuns = [];
	publicvariable "idfGuns";
};
if(isNil "twc_cram_targetlist") then {twc_cram_targetlist = [];};

/*
twc_fnc_idf = compile preprocessfilelinenumbers "insurgency_Core\server\sys_basedefence\IDF_Alarmfire.sqf";
twc_fnc_cram_init = compile preprocessfilelinenumbers "insurgency_Core\server\sys_basedefence\IDF_cram_init.sqf";
twc_fnc_cram_init_2 = compile preprocessfilelinenumbers "insurgency_Core\server\sys_basedefence\IDF_cram_init_2.sqf";

[] spawn {
waituntil {(!(isnil "twc_basepos"))};
{[_x] spawn twc_fnc_cram_init} foreach (twc_basepos nearobjects ["B_AAA_System_01_F", 5000]);
};


*/


/*
[] spawn {
waituntil {(!(isnil "twc_basepos"))};
{[_x] spawn twc_fnc_cram_init} foreach (twc_basepos nearobjects ["B_AAA_System_01_F", 5000]);
};
*/

/* code dump for future base attack plans

[] spawn {_pos = getmarkerpos "base";mortar1 lookat (_pos);for "_i" from 1 to 10 do {mortar1 doArtilleryFire [[_pos,150] call cba_fnc_randpos, currentmagazine mortar1, 1];sleep 5}; mortar1 lookat objnull;}


 
T1 = createVehicle ["Land_CanOpener_F", position mortar1, [], 0, "can_collide"];  
hideobject T1; 
  
_total = 10;      
for "_i" from 1 to _total do{   [] spawn {     
_timer = (1+ (random 30));    
_spawnpos = [position player, 50] call CBA_fnc_randPos;  
_direction = _spawnpos getdir getmarkerpos "base";   
_range = _spawnpos distance getmarkerpos "base";     
     
   
_haseb = createVehicle ["Land_CanOpener_F", _spawnpos, [], 0, "can_collide"];         
_haseb setdir _direction;     _holder = createvehicle ["GroundWeaponHolder_Scripted", _spawnpos, [], 0, "can_collide"];     
 hideobject _haseb;   
  _y = getdir _haseb;       
_holder addmagazinecargoglobal ["rhs_rpg7_OG7V_mag",1];      
_holder setdir ((_direction) - 90);          
_shooter = _haseb;      
 _pos = getpos _shooter vectoradd [0,0,0.5];       
 sleep _timer;         
 _rocket = "rhs_ammo_maaws_HE" createVehicle _pos; _rocket setdir (getdir _shooter); _y = getdir _shooter; _p = 10; _r = 0;          
_rocket setVectorDirAndUp [          
 [ sin _y * cos _p,cos _y * cos _p,sin _p],          
 [ [ sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D          
]; _rocket setvelocity [((_range / 9) + (random 20)) * (sin (getdir _shooter + (-5 + random 10))), ((_range / 9) + (random 20)) * (cos (getdir _shooter + (-5 + random 10))), (40+ (random 10))]; deletevehicle _holder; deletevehicle _shooter;_bang = createvehicle ["rhsusf_mine_m14_ammo", position _shooter, [], 0, "can_collide"]; _bang setdamage 1;  
[_rocket, 1] execVM "Insurgency_Core\server\sys_basedefence\IDF_cram.sqf";[_holder,_range] execvm "Insurgency_Core\server\sys_basedefence\IDF_marker.sqf"; sleep 3;if (idfon == 0) then { 
execVM "Insurgency_Core\server\sys_basedefence\IDF_Alarm.sqf"; 
 
};sleep 1; deletevehicle _holder; 
};       
};    


if ((((getposasl T1) select 2) - ((getposasl T2) select 2)) > 100) then don't spawn hasebs


 
T1 = mortar1;  
 
T2 = createVehicle ["Land_CanOpener_F", getmarkerpos "base", [], 0, "can_collide"];  
hideobject T1;  
_total = 5 + (random 30);     
for "_i" from 1 to _total do{   [] spawn {    
_timer = (1+ (random 120));   
_spawnpos = [position T1, 50] call CBA_fnc_randPos; 
_direction = _spawnpos getdir getmarkerpos "base";  
_range = (_spawnpos distance getmarkerpos "base"); deletevehicle T2;  
  
  
  
_haseb = createVehicle ["Land_CanOpener_F", _spawnpos, [], 0, "can_collide"];        
_haseb setdir _direction;     _holder = createvehicle ["GroundWeaponHolder_Scripted", _spawnpos, [], 0, "can_collide"];    
 hideobject _haseb;  
  _y = getdir _haseb;      
_holder addmagazinecargoglobal ["rhs_rpg7_OG7V_mag",1];     
_holder setdir ((_direction) - 90);         
_shooter = _haseb;     
 _pos = getpos _shooter vectoradd [0,0,0.5];      
 sleep _timer;        
 _rocket = "rhs_ammo_maaws_HE" createVehicle _pos; _rocket setdir (getdir _shooter); _y = getdir _shooter; _p = 10; _r = 0;         
_rocket setVectorDirAndUp [         
 [ sin _y * cos _p,cos _y * cos _p,sin _p],         
 [ [ sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D         
]; _rocket setvelocity [((_range / 9) + (random 20)) * (sin (getdir _shooter + (-5 + random 10))), ((_range / 9) + (random 20)) * (cos (getdir _shooter + (-5 + random 10))), (40+ (random 10))]; deletevehicle _holder; deletevehicle _shooter;_bang = createvehicle ["rhsusf_mine_m14_ammo", position _shooter, [], 0, "can_collide"]; _bang setdamage 1; [(_spawnpos), (_rocket)] call twc_fnc_idf};      
};    
*/


