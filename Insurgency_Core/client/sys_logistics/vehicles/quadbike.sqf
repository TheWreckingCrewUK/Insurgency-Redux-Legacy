params["_heli"];

if(isNil "_heli")exitWith{hint "No quadbike was given to the spawn system, please notify management"};


if(isNil "twc_quadbikecount") then{
	twc_quadbikecount = 0;
	publicVariable "twc_quadbikecount";
};


if (twc_quadbikecount >= 2) exitwith {
	
	
_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Too Many Quad Bikes</t>"; 

 _text1 = format ["<br />There Are Already 2 quadbikes In The AO. You Can Return Them To Base To Have Access to Another",(ceil(((((twc_utilplanetime)-time) max (twc_planetime-time)) / 60) / 6)) /10];
_spawntext = parsetext (_title + _text1);
hint _spawntext;
	
	};

twc_quadbikecount=twc_quadbikecount + 1;
publicVariable "twc_quadbikecount";

_veh = _heli createvehicle (getPos AmmoBoxSpawner);

clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
//clearMagazineCargoGlobal _veh;
clearitemCargoGlobal _veh;

_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Quad Bike Spawner</t>"; 

 _text1 =  "<br />The Quad Bike Has Been Spawned.";
_spawntext = parsetext (_title + _text1);
hint _spawntext;





_veh addEventHandler ["Killed",{

twc_quadbikecount=twc_quadbikecount - 1;
publicVariable "twc_quadbikecount";
	}];