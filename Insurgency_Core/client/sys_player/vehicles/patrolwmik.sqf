 _spawnpos = getpos AmmoBoxSpawner;
 
 

 
 _veh = "UK3CB_BAF_LandRover_WMIK_HMG_FFR_Green_A_TWC" createvehicle _spawnpos;  


_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Vehicle Spawner</t>"; 

 _text1 =  "<br />The Vehicle Has Been Spawned.";
_spawntext = parsetext (_title + _text1);
hint _spawntext;

