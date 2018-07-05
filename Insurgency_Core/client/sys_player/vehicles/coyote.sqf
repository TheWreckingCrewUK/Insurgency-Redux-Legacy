params["_heli"];

if(isNil "_heli")exitWith{hint "No coyote was given to the spawn system, please notify management"};


if(isNil "twc_coyotecount") then{
	twc_coyotecount = 0;
	publicVariable "twc_coyotecount";
};


if (twc_coyotecount >= 2) exitwith {
	
	
_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Too Many Coyotes</t>"; 

 _text1 = format ["<br />There Are Already 2 Coyotes In The AO. You Can Return Them To Base To Have Access to Another",1];
_spawntext = parsetext (_title + _text1);
hint _spawntext;
	
	};

twc_coyotecount=twc_coyotecount + 1;
publicVariable "twc_coyotecount";

_veh = _heli createvehicle (getPos AmmoBoxSpawner);

clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
//clearMagazineCargoGlobal _veh;
clearitemCargoGlobal _veh;

_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Coyote Spawner</t>"; 

 _text1 =  "<br />The Coyote Has Been Spawned.";
_spawntext = parsetext (_title + _text1);
hint _spawntext;





_veh addEventHandler ["Killed",{

twc_coyotecount=twc_coyotecount - 1;
publicVariable "twc_coyotecount";
	}];