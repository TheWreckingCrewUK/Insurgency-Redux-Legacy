//Clearing Script

//box Crate removal
	_box = (getPos AmmoBoxSpawner) nearestObject 'NATO_Box_Base';

	_trg = createTrigger ["EmptyDetector", getPos AmmoBoxSpawner];
	_trg setTriggerArea [50,50,0,false];
	_trg setTriggerActivation ["WEST", "PRESENT", true];
	_trg setTriggerStatements ["this", "_arr = nearestObjects [thistrigger, ['NATO_Box_Base'], 30]; {deletevehicle _x} foreach _arr;",""];
	_trg attachTo [_box];
	
	//spare wheel removal	
	_box = (getPos AmmoBoxSpawner) nearestObject 'ace_wheel';

	_trg = createTrigger ["EmptyDetector", getPos AmmoBoxSpawner];
	_trg setTriggerArea [50,50,0,false];
	_trg setTriggerActivation ["WEST", "PRESENT", true];
	_trg setTriggerStatements ["this", "_box = (getPos thisTrigger) nearestObject 'ace_wheel'; deleteVehicle _box;",""];
	_trg attachTo [_box];

	//spare track removal	
	_box = (getPos AmmoBoxSpawner) nearestObject 'ace_track';

	_trg = createTrigger ["EmptyDetector", getPos AmmoBoxSpawner];
	_trg setTriggerArea [50,50,0,false];
	_trg setTriggerActivation ["WEST", "PRESENT", true];
	_trg setTriggerStatements ["this", "_box = (getPos thisTrigger) nearestObject 'ace_track'; deleteVehicle _box;",""];
	_trg attachTo [_box];

