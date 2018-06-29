// dump of attachto positions, offsets and vectors, for use in init code later


/////// wmik fuel cans, riht side
_car= (this nearobjects ["UK3CB_BAF_LandRover_WMIK_GPMG_Sand_A", 5] select 0); this attachto [_car]; _y = getdir _car- 90;  _p = 10; _r = 0;     
this setVectorDirAndUp [[1,0,0.2],[0,0,1]];this setpos position this; [this, true, [0, 1, 0], 10] call ace_dragging_fnc_setCarryable;


//spare tire on the front of wmik
_car= (this nearobjects ["UK3CB_BAF_LandRover_WMIK_GPMG_Sand_A", 5] select 0); this attachto [_car]; _y = getdir _car- 90;  _p = 10; _r = 0;     
this setVectorDirAndUp [[0,-0.1,1],[0,1,0]]; this setpos position this;

//spare tire on the SIDE of wmik
_car= (this nearobjects ["UK3CB_BAF_LandRover_WMIK_GPMG_Sand_A", 5] select 0); this attachto [_car]; _y = getdir _car- 90;  _p = 10; _r = 0;     
this setVectorDirAndUp [[0.2,0,1],[0,0,1]]; this setpos position this;

//magic boxes in wmik, should work for all of them
_car= (this nearobjects ["UK3CB_BAF_LandRover_WMIK_GPMG_Sand_A", 5] select 0); this attachto [_car]; _y = getdir _car- 90;  _p = 10; _r = 0;     
this setVectorDirAndUp [[0,1,0],[1,0,0]]; this setpos position this;

//groundweaponholder with l85. probably useless
_car= (this nearobjects ["UK3CB_BAF_LandRover_WMIK_GPMG_Sand_A", 5] select 0); this attachto [_car]; _y = getdir _car- 90;  _p = 10; _r = 0;     
this setVectorDirAndUp [[0.1,-0.9,0],[1,0,-0.1]]; this setpos position this;