// add vehicles to forward base, requestable by leaders
params ["_boxpos"];
_playercount = (((count(allPlayers - entities "HeadlessClient_F"))/1.5) +2) max 2;
if (count (_boxpos nearentities ["car", 200]) >_playercount) exitwith {hint "there are already enough vehicles here"};
if (count (_boxpos nearobjects ["Vysilacka", 200]) == 0) exitwith {hint "There's no forward base here"};

_vehicle = createvehicle ["UK3CB_BAF_LandRover_Soft_Sand_A", [0,0,0]];
_total = ((ceil(_playercount * 1.3))-(count (_boxpos nearentities ["car", 200]))) max 1;
hint format ["Spawning %1 Vehicles", _total *2];

vehdrop = {
params ["_boxpos"];

_pos = [_boxpos,[5,50],random 360,0, [1,50], [50,(typeof _vehicle)]] call SHK_pos; 

for "_i" from 1 to _total do{ 

_spawnPos = [_pos,[5,50],random 360,0, [1,40], [50,(typeof _vehicle)]] call SHK_pos; 
_wmik = createvehicle ["UK3CB_BAF_LandRover_WMIK_GPMG_Sand_A", _spawnPos];  
clearweaponcargoglobal _wmik; 
_wmik addmagazinecargoglobal ["UK3CB_BAF_762_200Rnd_T", 5];
sleep 1;
if ((vectorMagnitude (velocity _wmik))>2 || (damage _wmik > 0)) then {deletevehicle _wmik;
_spawnPos = [_pos,[5,50],random 360,0, [1,50], [50,(typeof _vehicle)]] call SHK_pos; 
_wmik = createvehicle ["UK3CB_BAF_LandRover_WMIK_GPMG_Sand_A", _spawnPos];  
clearweaponcargoglobal _wmik; 
_wmik addmagazinecargoglobal ["UK3CB_BAF_762_200Rnd_T", 5];
sleep 1;
if ((vectorMagnitude (velocity _wmik))>2 || (damage _wmik > 0)) then {deletevehicle _wmik;
_spawnPos = [_pos,[5,50],random 360,0, [1,70], [50,(typeof _vehicle)]] call SHK_pos; 
_wmik = createvehicle ["UK3CB_BAF_LandRover_WMIK_GPMG_Sand_A", _spawnPos];  
clearweaponcargoglobal _wmik; 
_wmik addmagazinecargoglobal ["UK3CB_BAF_762_200Rnd_T", 5];
sleep 5;
_wmik setdamage 0;

};
};

_spawnPos = [_pos,[5,50],random 360,0, [1,40], [50,(typeof _vehicle)]] call SHK_pos; 
_car = createvehicle ["UK3CB_BAF_LandRover_Soft_Sand_A", _spawnPos];
sleep 1;
if ((vectorMagnitude (velocity _car))>2 || (damage _car > 0)) then {deletevehicle _car;

_spawnPos = [_pos,[5,50],random 360,0, [1,50], [50,(typeof _vehicle)]] call SHK_pos; 
_car = createvehicle ["UK3CB_BAF_LandRover_Soft_Sand_A", _spawnPos];
sleep 1;
if ((vectorMagnitude (velocity _car))>2 || (damage _car > 0)) then {deletevehicle _car;

_spawnPos = [_pos,[5,50],random 360,0, [1,70], [50,(typeof _vehicle)]] call SHK_pos; 
_car = createvehicle ["UK3CB_BAF_LandRover_Soft_Sand_A", _spawnPos];
sleep 5;
_car setdamage 0;

};
};

};
deletevehicle _vehicle;};

[[_total],vehdrop] remoteExec ["bis_fnc_execvm", 2];