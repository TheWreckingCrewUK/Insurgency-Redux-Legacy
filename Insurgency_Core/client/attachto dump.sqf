// dump of attachto positions, offsets and vectors, for use in init code later

classnames

ace_wheel
ace_box_ammo
Box_NATO_AmmoVeh_F
fuel_can
TWC_Public_AmmoBox_Hobbs_Precious


/////// wmik fuel cans, right side
_car= (this nearobjects ["UK3CB_BAF_LandRover_WMIK_GPMG_Sand_A", 5] select 0); this attachto [_car]; _y = getdir _car- 90;  _p = 10; _r = 0;     
this setVectorDirAndUp [[1,0,0.2],[0,0,1]];this setpos position this; [this, true, [0, 1, 0], 10] call ace_dragging_fnc_setCarryable;
//attachto offsets for 2 fuel canS
obj attachto [wmik, [0.85,0.28,-0.8]]
obj attachto [wmik, [0.85,-0.2,-0.8]]

//fuel can, left side
obj setVectorDirAndUp [[1,0,0],[0,0,1]];
obj attachto [wmik, [-1.11,-1.7,-1.5]]


//spare tire on the front of wmik
_car= (this nearobjects ["UK3CB_BAF_LandRover_WMIK_GPMG_Sand_A", 5] select 0); this attachto [_car]; _y = getdir _car- 90;  _p = 10; _r = 0;     
this setVectorDirAndUp [[0,-0.1,1],[0,1,0]]; this setpos position this;
//opffset
obj attachto [wmik, [-0.1,2.95,-1.4]]

//spare tire on the SIDE of wmik
_car= (this nearobjects ["UK3CB_BAF_LandRover_WMIK_GPMG_Sand_A", 5] select 0); this attachto [_car]; _y = getdir _car- 90;  _p = 10; _r = 0;     
this setVectorDirAndUp [[0.2,0,1],[0,0,1]]; this setpos position this;
obj attachto [wmik, [-1.1,-0.2,-0.8]]
vehicle player animate ["sparewheel_hide", 1];
vehicle player animate ["gear_hide", 1];
obj attachto [wmik, [-1.1,-1.3,-0.7]]



//magic boxes in wmik, should work for all of them
_car= (this nearobjects ["UK3CB_BAF_LandRover_WMIK_GPMG_Sand_A", 5] select 0); this attachto [_car]; _y = getdir _car- 90;  _p = 10; _r = 0;     
this setVectorDirAndUp [[0,1,0],[1,0,0]]; this setpos position this;



_y = 0; _p = 0; _r = 90; 
obj setVectorDirAndUp [ 
 [ sin _y * cos _p,cos _y * cos _p,sin _p], 
 [ [ sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D 
];

obj attachto [wmik, [-1.0,-0,-1.57]]
obj attachto [wmik, [0.85,-0,-1.57]]








mastiff

boxes

TWC_Public_AmmoBox_Hobbs_Precious
obj attachto [wmik, [-1.1,0.4,1]]
obj setVectorDirAndUp [[1,0,0],[0,0,1]]

obj attachto [wmik, [-1.1,-0.7,0.95]]
obj setVectorDirAndUp [[1,0,0],[0,0,1]]

obj attachto [wmik, [-1.1,-0.7,1.5]]
obj setVectorDirAndUp [[1,0,0],[0,0,1]]

obj attachto [wmik, [1.1,0.4,1]]
obj setVectorDirAndUp [[1,0,0],[0,0,1]]

obj attachto [wmik, [1.1,-0.7,0.95]]
obj setVectorDirAndUp [[1,0,0],[0,0,1]]

obj attachto [wmik, [1.1,-0.7,1.5]]
obj setVectorDirAndUp [[1,0,0],[0,0,1]]


wolfhound

vehicle box

Box_NATO_AmmoVeh_F
obj attachto [wmik, [-0.3,-3.5,2.3]]
no vector

ammoboxes

UK3CB_BAF_Box_762_Ammo
obj attachto [wmik, [0.8,-4.5,2.0]]


UK3CB_BAF_Box_556_Ammo
obj attachto [wmik, [0.8,-3.75,2.0]]


UK3CB_BAF_Box_40_Ammo
obj attachto [wmik, [0.8,-3.0,2.0]]

fuel cans

_obj = 'fuel_can' createvehicle [0,0,0];  _obj attachto [_car, [-1.11,-1.7,-1.4]];   _obj setVectorDirAndUp [[1,0,0],[0,0,1]];				[_obj, 20] call ace_refuel_fnc_makeSource;		[_obj, true, [0, 1, 0], 10] call ace_dragging_fnc_setCarryable;


obj attachto [car, [-1.2,2.5,1.69]]; 
obj setVectorDirAndUp [[-1,0,0],[0,0.1,1]]


obj attachto [car, [-1.05,2.5,1.69]];
obj setVectorDirAndUp [[-1,0,0],[0,0.1,1]] 


snatch landy, lockers


TWC_Public_AmmoBox_Hobbs_Precious

obj attachto [car, [-0.9,-0.35,-1.05]];  
obj setVectorDirAndUp [[0,1,0],[1,0,0]];

obj attachto [car, [0.9,-0.35,-1.05]];  
obj setVectorDirAndUp [[0,1,0],[1,0,0]];

spare wheel
car animate ['sparewheel_hide', 1]; obj = 'ace_wheel' createvehicle [0,0,0];  obj attachto [car, [0,2.65,-0.9]];   obj setVectorDirAndUp [[0,-0.1,1],[0,1,0]]; 


hardtop landy, lockers

TWC_Public_AmmoBox_Hobbs_Precious

obj attachto [car, [-0.9,-0.3,-1.15]];  
obj setVectorDirAndUp [[0,1,0],[1,0,0]];

obj attachto [car, [0.9,-0.35,-1.05]];  
obj setVectorDirAndUp [[0,1,0],[1,0,0]];
obj attachto [car, [-1.1,-0.25,-0.35]];   obj setVectorDirAndUp [[0.1,0,1],[0,0,1]]; 


softtop landy, lockers

TWC_Public_AmmoBox_Hobbs_Precious

obj attachto [car, [0.8,-0.35,-1.15]];  
obj setVectorDirAndUp [[0,1,0],[1,0,0]];

obj attachto [car, [-1.0,-0.35,-1.15]];  
obj setVectorDirAndUp [[0,1,0],[1,0,0]];

wheel on left flank
_car animate ['sparewheel_hide', 1];
obj attachto [car, [-1.2,-0.25,-0.35]];   obj setVectorDirAndUp [[0.1,0,1],[0,0,1]];  



jackal, lockers

TWC_Public_AmmoBox_Hobbs_Precious
obj attachto [car, [-1,0.3,-1.5]];
obj setVectorDirAndUp [[0,0,1],[1,0,0]];


obj attachto [car, [0.7,0.3,-1.5]];
obj setVectorDirAndUp [[0,0,1],[1,0,0]];

coyote, lockers

TWC_Public_AmmoBox_Hobbs_Precious
obj attachto [car, [0.9,1.0,-1.5]];
obj setVectorDirAndUp [[0,0,1],[1,0,0]];


obj attachto [car, [-0.8,1.0,-1.5]];
obj setVectorDirAndUp [[0,0,1],[1,0,0]];