// making the minimi less of a laser

  player addEventHandler["Fired",{ 
  if (currentweapon player == "UK3CB_BAF_L110A2_ELCAN3D") then { 
   
	_bullet = _this select 6; _bullet setvelocity [(velocity _bullet select 0) + (random 10) - 5, 
	(velocity _bullet select 1) + (random 6) - 3, 
	(velocity _bullet select 2) + (random 6) - 3];
	};
}
];