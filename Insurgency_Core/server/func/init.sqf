twc_spawnAIUnits = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_spawnAIUnits.sqf";
twc_spawnDefend = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_spawnDefend.sqf";
twc_spawnCiv = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_spawnCiv.sqf";
twc_townSetup = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_spawnTownSetup.sqf";
twc_fnc_townDeciding = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_townDeciding.sqf";
twc_fnc_deleteDead = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_deleteDead.sqf";

twc_fnc_aiWounds = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_aiWounds.sqf";

twc_fnc_campaignserver = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_campaignserver.sqf";

twc_fnc_enemychatter = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_enemychatter.sqf";

twc_fnc_enemyspawnpos = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_enemyspawnpos.sqf";
twc_fnc_isnearblufor = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_isnearblufor.sqf";
twc_fnc_bluforreport = compile preprocessfilelinenumbers "Insurgency_Core\client\func\fnc_bluforreport.sqf";
twc_fnc_seenbyplayers = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_seenbyplayers.sqf";
twc_fnc_lookedatbyplayers = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_lookedatbyplayers.sqf";
twc_fnc_findsneakypos = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_findsneakypos.sqf";
twc_fnc_civfluff = compile preprocessfilelinenumbers "Insurgency_Core\server\sys_civ\fnc_civfluff.sqf";
twc_fnc_civfluff_server = compile preprocessfilelinenumbers "Insurgency_Core\server\sys_civ\fnc_civfluff_server.sqf";
twc_fnc_townmarker = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_townmarker.sqf";
twc_fnc_counterattack = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_counterattack.sqf";
twc_fnc_findnearestroad = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_findnearestroad.sqf";

twc_fnc_civtraffic_server = compile preprocessfilelinenumbers "Insurgency_Core\server\sys_civ\fnc_civtraffic_server.sqf";

twc_fnc_betrayal = compile preprocessfilelinenumbers "Insurgency_Core\server\sys_civ\fnc_betrayal.sqf";

twc_fnc_aispreadout = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_aispreadout.sqf";

twc_fnc_flipvehicle = compile preprocessfilelinenumbers "insurgency_core\client\sys_player\flipvehicle.sqf";

twc_fnc_perspb_trigger = compile preprocessfilelinenumbers "Insurgency_Core\server\sys_forwardbase\fnc_persistentpb_trigger.sqf";
twc_fnc_perspb_write = compile preprocessfilelinenumbers "Insurgency_Core\server\sys_forwardbase\fnc_persistentpb_write.sqf";

twc_fnc_getDisplayName = compile preprocessfilelinenumbers "Insurgency_Core\client\func\fnc_getDisplayName.sqf";
twc_fnc_showSandBagItems = compile preprocessfilelinenumbers "Insurgency_Core\client\func\fnc_showSandBagItems.sqf";
twc_fnc_startcqbrangeserver = compile preprocessfilelinenumbers "Insurgency_Core\client\func\fnc_cqbrange_server.sqf";

twc_fnc_campaignserver = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_campaignserver.sqf";

twc_fnc_enemyspawnpos = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_enemyspawnpos.sqf";
twc_fnc_isnearblufor = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_isnearblufor.sqf";

twc_fnc_findnearestblufor = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_findnearestblufor.sqf";
twc_fnc_checkenemyradio = compile preprocessfilelinenumbers "Insurgency_Core\client\func\fnc_checkenemyradio.sqf";

twc_fnc_findoutsideblufor = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_findoutsideblufor.sqf";

twc_fnc_stopcivs = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_stopcivs.sqf";
twc_fnc_bluforreport = compile preprocessfilelinenumbers "Insurgency_Core\client\func\fnc_bluforreport.sqf";



twc_fnc_seenbyplayers = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_seenbyplayers.sqf";
twc_fnc_lookedatbyplayers = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_lookedatbyplayers.sqf";
twc_fnc_findsneakypos = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_findsneakypos.sqf";

twc_fnc_pubstartingloadout = compile preprocessfilelinenumbers "Insurgency_Core\client\sys_player\loadouts\fnc_startingloadout.sqf";

twc_terp_timer = compile preprocessfilelinenumbers "Insurgency_Core\server\sys_terp\fnc_terp_timer.sqf";
twc_terp_msgcheck = compile preprocessfilelinenumbers "Insurgency_Core\server\sys_terp\fnc_terp_msgcheck.sqf";

[] spawn {
	waituntil {(!(isnil "townLocationArray" ))};
	waituntil {(!(isnil "twc_basepos" ))};
	waituntil {(count townLocationArray ) > 5};
	sleep 5;
	[] spawn twc_fnc_enemyspawnpos;
};

twc_ailookat = {
	params ["_ai", "_player"];
	_ai lookat _player;
};

twc_fnc_findnearestblufor = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_findnearestblufor.sqf";

twc_fnc_findoutsideblufor = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_findoutsideblufor.sqf";

twc_fnc_posNearPlayers = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_posNearPlayers.sqf";
twc_fnc_getRandomNearbyRoad = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_getRandomNearbyRoad.sqf";
twc_fnc_randomBuildingPos = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_randomBuildingPos.sqf";

twc_fnc_stopcivs = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_stopcivs.sqf";
twc_fnc_startcqbrangeserver = compile preprocessfilelinenumbers "Insurgency_Core\client\func\fnc_cqbrange_server.sqf";

twc_fnc_checkLastDamage = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_checkLastDamage.sqf";
twc_fnc_addScore = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_addScore.sqf";
twc_fnc_calculateSpawnAmount = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_calculateSpawnAmount.sqf";
twc_fnc_spawntechnicals = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_spawnTechnicals.sqf";
twc_fnc_deadasset = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_deadAsset.sqf";
twc_fnc_mortarattack = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_mortarattack.sqf";
twc_fnc_spawnmortar = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_spawnmortar.sqf";
twc_fnc_deadmortar = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_deadmortar.sqf";
twc_fnc_commandcheck = compile preprocessfilelinenumbers "Insurgency_Core\server\func\fnc_commandcheck.sqf";

call twc_fnc_spawnmortar;


twc_shootcomp_addeh1 = {
	params ["_target", "_player", "_dis"];
	_target setvariable ["twcshootcomp_hits" + (str _dis) + (name _player), 0, true];
	_eh1 = _target addEventHandler ["Hit", {
		params ["_unit", "_source", "_damage", "_instigator"];
		_unit setdamage 0;
		[_unit] spawn {
			params ["_unit"];
			waitUntil {_unit animationPhase "terc" > 0};
			_unit animateSource ["terc",0,true];
		};
		
		_targets = _instigator getvariable ["twc_activecomptargets", []];
		
		{
			if ((_x select 0) == _unit) then {
				_dis = _x select 1;
				_h = _unit getvariable ["twcshootcomp_hits" + (str _dis) + (name _instigator), 0];
				_unit setvariable ["twcshootcomp_hits" + (str _dis) + (name _instigator), (_h + 1) min 5, true];
				
				_h = _unit getvariable ["twcshootcomp_hits" + (str _dis) + (name _instigator), 0];
				if ((_instigator getvariable ["twc_shootcomplete", 0]) == 1) then {
					(_instigator setvariable ["twc_shootcomplete", 0, true]);
				};
					
				
			};
		} foreach _targets;
		
		
		
	}];

	_target setvariable ["twcshootcomp_e1", _eh1, true];
};

twc_shootcomp_removeeh1 = {
	params ["_eh1", "_target"];
	_target removeEventHandler ["hit", _eh1];
};

twc_shootcomp_resettarget = {
	params [ "_target"];
	_target animateSource ["terc",0,true];
};


twc_shootcomp_completetarget = {
	params ["_player", "_dis"];
	_player setvariable ["twc_shootcomplete" + (str _dis), 0,true];
	
};


twc_hintnearbyshootcomp = {
	params ["_text", "_shooter"];
	if (!hasinterface) exitwith {
		diag_log ("twcshootcomp"+_text);
	};
	if ((player distance _shooter) > 30) exitwith {};
	systemchat _text;
};

twc_hintfullsection = {
	params ["_group"];
	
	_arr = [];
	{
		_arr pushback [name _x, typeof _x, getPlayerUID _x];
	} foreach (units _group);
	
	if (!hasinterface) exitwith {
		diag_log ("twcgoodeggs "+(str _arr));
	};
};

{ 
_x addEventHandler ["CuratorObjectPlaced", {
	params ["_curator", "_entity"];
	
	if ((side _entity) == east) then {
		_entity setVariable ["twc_isenemy",1];
	};
} 
 
]; 
 
} forEach allCurators;