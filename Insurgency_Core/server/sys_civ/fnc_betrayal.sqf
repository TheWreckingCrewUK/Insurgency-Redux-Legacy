params["_pos"];


_trg2 = createTrigger ["EmptyDetector", _pos]; 
_trg2 setTriggerArea [500, 500, 0, false]; 
_trg2 setTriggerActivation ["GUER", "PRESENT", false]; 
_trg2 setTriggerTimeout [0,0,0, false]; 
_trg2 setTriggerStatements ["this", "_group = creategroup east;  
{[_x] joinsilent _group;
_x addEventHandler ['Killed',{
	params ['_unit', '_killer', '_instigator', '_useEffects'];
	_pos = (_unit getvariable ['unitsHome', (getpos _unit)]); _var = missionnamespace getvariable ['twctown_deadvilcount' + (str _pos), 0];
	missionnamespace setvariable ['twctown_deadvilcount' + (str _pos), _var + 1];
	_var = missionnamespace getvariable ['twctown_deadvilcount' + (str _pos), 0];
	_origvar = missionnamespace getvariable ['twctown_vilcount' + (str _pos), 0];
	systemchat (str _var);
	if (_var > (_origvar / 2)) then {
		_towncheck = profilenamespace getvariable ['twcenemytown' + (str _pos), 0];
		if (_towncheck != 0) then {
			profilenamespace setvariable ['twcenemytown' + (str _pos), 0]; saveprofilenamespace;
			systemchat 'town made enemy';
		};
	};
	}];
	
	} foreach thislist; _pos = ((thislist select 0) getvariable ['unitsHome', (getpos (thislist select 0))]); missionnamespace setvariable ['twctown_vilcount' + (str _pos), (count thislist)];",""]; 
 

//[_pos] spawn {params ['_pos']; sleep 60;[_pos,1] call twc_fnc_townmarker;};
//profilenamespace setvariable ['twcenemytown' + (str _pos), 0]; saveprofilenamespace;