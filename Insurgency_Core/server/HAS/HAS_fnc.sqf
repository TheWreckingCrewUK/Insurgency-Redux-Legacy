RYD_HAS_Init = 
	{
	systemChat "HAS 1.96";
	
	if (isNil "RYD_HAS_Base") exitWith 
		{
		//hint "RYD_HAS_Base not defined - exiting."
		"RYD_HAS_Base not defined - exiting." remoteExec ["hint"];
		};
	
	_synced = synchronizedObjects RYD_HAS_Base;
	_helis = [];
	_helisCAS = [];
	_units = [];
	_containers = [];
		
		{
		_vh = vehicle _x;
		if ((_vh isKindOf "ReammoBox_F") or {(_vh getVariable ["RYD_HAS_ThisIsBox",false])}) then
			{
			_containers pushBack _vh
			}
		else
			{
			if ((_vh isKindOf "Helicopter") or {(_vh isKindOf "VTOL_Base_F")}) then
				{
				_helis pushBack _vh;
				if ((_vh isKindOf "Helicopter") and {([_vh] call RYD_HAS_isGunship)}) then
					{
					_helisCAS pushBack _vh
					}
				}
			else
				{
				_units appEnd (crew _vh)
				}
			}
		}
	foreach _synced;

	if (isNil "RYD_HAS_allChoppers") then 
		{
		RYD_HAS_allChoppers = _helis;
		}
	else
		{
			{
			if ([_x] call RYD_HAS_isGunship) then
				{
				if not (_x in _helisCAS) then
					{
					_helisCAS pushBack _x
					}
				}
			}
		foreach RYD_HAS_allChoppers;
		};
		
	if (isNil "RYD_HAS_CASChoppers") then 
		{
		RYD_HAS_CASChoppers = _helisCAS;
		};

	if (isNil "RYD_HAS_STT") then 
		{
		RYD_HAS_STT = _units
		};
		
	if (isNil "RYD_HAS_SupplyDrop_Prepared") then
		{
		RYD_HAS_SupplyDrop_Prepared = _containers;
		};	
	
	publicVariable "RYD_HAS_Limit";
	publicVariable "RYD_HAS_SupplyDrop_SlingLoad";
	publicVariable "RYD_HAS_STT";
	publicVariable "RYD_HAS_ContourFlightMode";
	
	if not (isNil "RYD_HAS_Chopper") then
		{
		publicVariable "RYD_HAS_Chopper"
		}
	else
		{
		RYD_HAS_Chopper = objNull;
		publicVariable "RYD_HAS_Chopper"
		};
	
	if ((count RYD_HAS_allChoppers) < 1) then
		{
		RYD_HAS_allChoppers = [RYD_HAS_Chopper];
		};
		
	publicVariable "RYD_HAS_allChoppers";
	
	if ((count RYD_HAS_allChoppers) < 1) exitWith 
		{
		//hint "No suitable helicopters defined - exiting."
		"No suitable helicopters defined - exiting." remoteExec ["hint"];
		};
		
	RYD_HAS_ChopperPool = [];
	if not (RYD_HAS_RespawnHelis == 0) then
		{
			{
			RYD_HAS_ChopperPool pushBack [[_x,(crew _x),(group _x)],(typeOf _x),getPosATL _x,getDir _x] 
			}
		foreach RYD_HAS_allChoppers;
		
		RYD_HAS_RespawnHelisLoop_handle = [] spawn 
			{
			while {(not (RYD_HAS_RemoveAtLimit) or {not (RYD_HAS_Limit == 0)})} do
				{
				sleep 10;
				
				if not (RYD_HAS_RespawnHelis == 0) then
					{
						{
						_alive = switch (true) do
							{
							case (not (alive _x)): {false};
							case (not (canMove _x)): {false};
							case ((isNull (driver _x))): {false};
							case (not (alive (driver _x))): {false};
							case (((fuel _x) == 0)): {false};
							default {true}
							};
						
						if not (_alive) then
							{
							[_x] call RYD_HAS_RespawnHeliCheck;
							RYD_HAS_allChoppers set [_foreachIndex,objNull];
							}
						}
					foreach RYD_HAS_allChoppers;
					RYD_HAS_allChoppers = RYD_HAS_allChoppers - [objNull];
					publicVariable "RYD_HAS_allChoppers";
					}
				}
			};
		};
				
	RYD_HAS_CT_submenu = [["Available transport",true]];
	RYD_HAS_CS_submenu = [["Available delivery",true]];
	RYD_HAS_CC_submenu = [["Available CAS",true]];
	_cfgVeh = configFile >> "CfgVehicles";
	
		{
		_name = _cfgVeh >> (typeOf _x) >> "displayName";
		_name = if (isText _name) then
			{
			(getText _name)
			}
		else
			{
			"Vehicle"
			};
		
		_varName = vehicleVarName _x;
		if (_varName isEqualTo "") then
			{
			_varName = format ["HAS%1",(_foreachIndex + 1)];
			_x setVehicleVarName _varName;
			};
			
		if (isNil {(missionNameSpace getVariable _varName)}) then
			{
			missionNameSpace setVariable [_varName,_x];
			publicVariable _varName
			};
						
		_name = _name + ": " + _varName;
		if ((_x emptyPositions "cargo") > 0) then
			{
			_exp = format ["_callerUnit = player;[[_callerUnit,_callerUnit,-1,0,%1],RYD_HAS_atCalled] remoteExec ['spawn',2];",_x];
			_entry = [_name,[(_foreachIndex + 2)],"",-5,[["expression",_exp]], "1", "1"];
			_x setVariable ["RYD_HAS_myEntry",_entry,true];
			RYD_HAS_CT_submenu pushBack _entry;
			
			_exp2 = format ["_callerUnit = player;[[_callerUnit,_callerUnit,-1,1,%1],RYD_HAS_atCalled] remoteExec ['spawn',2];",_x];
			_entry2 = [_name,[(_foreachIndex + 2)],"",-5,[["expression",_exp2]], "1", "1"];
			_x setVariable ["RYD_HAS_myEntry2",_entry2,true];
			RYD_HAS_CS_submenu pushBack _entry2;
			};
					
		if (_x in RYD_HAS_CASChoppers) then
			{
			_exp3 = format ["_callerUnit = player;[[_callerUnit,_callerUnit,-1,2,%1],RYD_HAS_atCalled] remoteExec ['spawn',2];",_x];
			_entry3 = [_name,[(_foreachIndex + 2)],"",-5,[["expression",_exp3]], "1", "1"];	
			_x setVariable ["RYD_HAS_myEntry3",_entry3,true];
			RYD_HAS_CC_submenu pushBack _entry3;
			};
			
		_x setVariable ["RYD_HAS_myEntryIx",(_foreachIndex + 1),true];
		}
	foreach RYD_HAS_allChoppers;
	
	RYD_HAS_FC_submenu = 
		[
		["Flight ceiling",true],
		["+50m",[2],"",-5,[["expression", "[[nil,nil,nil,50],RYD_HAS_ChangeAltitude] remoteExec ['spawn',2];"]], "1", "1"],
		["+250m",[3],"",-5,[["expression", "[[nil,nil,nil,250],RYD_HAS_ChangeAltitude] remoteExec ['spawn',2];"]], "1", "1"],
		["-50m",[4],"",-5,[["expression", "[[nil,nil,nil,-50],RYD_HAS_ChangeAltitude] remoteExec ['spawn',2];"]], "1", "1"],
		["-250m",[5],"",-5,[["expression", "[[nil,nil,nil,-250],RYD_HAS_ChangeAltitude] remoteExec ['spawn',2];"]], "1", "1"]
		];
		
	publicVariable "RYD_HAS_CT_submenu";
	publicVariable "RYD_HAS_CS_submenu";
	publicVariable "RYD_HAS_CC_submenu";
	publicVariable "RYD_HAS_FC_submenu";
			
		/*{
		_x setVariable ["RYD_HAS_Access",true,true];
		_x addMPEventHandler ["MPRespawn", RYD_HAS_atRespawn];
		}
	foreach RYD_HAS_STT;*/
	
		{
		_ix = _x addMPEventHandler ["MPKilled",RYD_HAS_removeHeliEntry];
		_x setVariable ["RYD_HAS_myKEH",_ix,true];
		}
	foreach RYD_HAS_allChoppers;
	
	RYD_HAS_FastRoping = false;publicVariable "RYD_HAS_FastRoping";
	RYD_HAS_wasFastRoping = false;
	RYD_HAS_UseCount = 0; publicVariable "RYD_HAS_UseCount";
	RYD_HAS_radioCalled = false; publicVariable "RYD_HAS_radioCalled";
	RYD_HAS_wasCalled = false; publicVariable "RYD_HAS_wasCalled";
	RYD_HAS_wasCalledFast = false; publicVariable "RYD_HAS_wasCalledFast";
	RYD_HAS_wasSignal = false;
	RYD_HAS_UnitsGone = false;
	RYD_HAS_DecisionTime = false;
	RYD_HAS_CallCancelled = false;
	RYD_HAS_canCancel = false; publicVariable "RYD_HAS_canCancel";
	RYD_HAS_isSupplyRun = false; publicVariable "RYD_HAS_isSupplyRun";
	RYD_HAS_isCASRun = false; publicVariable "RYD_HAS_isCASRun";
	RYD_HAS_kEHIx = -1; publicVariable "RYD_HAS_kEHIx";
	RYD_TI_EFEH = -1;publicVariable "RYD_TI_EFEH";
	RYD_TI_ControlTI = false;publicVariable "RYD_TI_ControlTI";
	//RYD_HAS_dEHIx = -1; publicVariable "RYD_HAS_dEHIx";
	
	RYD_HAS_dEHIx = addMissionEventHandler ["HandleDisconnect",{nul = _this spawn RYD_HAS_atDisconnect}];
	publicVariable "RYD_HAS_dEHIx";	
	
	RYD_HAS_Hooked = false; publicVariable "RYD_HAS_Hooked";
	RYD_HAS_delivered = false;
	publicVariable "RYD_HAS_delivered";
	RYD_HAS_box = objNull;
	RYD_HAS_NewDestinationPending = false;publicVariable "RYD_HAS_NewDestinationPending";
	RYD_HAS_wasHit = false;publicVariable "RYD_HAS_wasHit";
	RYD_HAS_MidWPs = [];publicVariable "RYD_HAS_MidWPs";
	publicVariable "RYD_HAS_UseSupportsMenu";
	
	RYD_HAS_RadioReq = toLower RYD_HAS_RadioReq;
	publicVariable "RYD_HAS_RadioReq";
	
	RYD_HAS_CASPatternChoice = false;
	RYD_HAS_CAS_isHover = false;
	RYD_HAS_CAS_isSAD = false;
	publicVariable "RYD_HAS_CASPatternChoice";
	publicVariable "RYD_HAS_CAS_isHover";
	publicVariable "RYD_HAS_CAS_isSAD";
	
	publicVariable "RYD_HAS_Switch_Taxi";
	publicVariable "RYD_HAS_Switch_Supply";
	publicVariable "RYD_HAS_Switch_CAS";
	
	if (RYD_HAS_VoiceChat) then
		{
		BIS_SUPP_channels = ["","",""];
		if not (RYD_HAS_Base kbHasTopic "BIS_SUPP_protocol") then
			{
			RYD_HAS_Base kbAddtopic ["BIS_SUPP_protocol", "A3\Modules_F\supports\kb\protocol.bikb", "A3\Modules_F\supports\kb\protocol.fsm", {call compile preprocessFileLineNumbers "A3\Modules_F\supports\kb\protocol.sqf"}];
			};
		
			{
			if not ((driver _x) kbHasTopic "BIS_SUPP_protocol") then
				{
				(driver _x) kbAddtopic ["BIS_SUPP_protocol", "A3\Modules_F\supports\kb\protocol.bikb", "A3\Modules_F\supports\kb\protocol.fsm", {call compile preprocessFileLineNumbers "A3\Modules_F\supports\kb\protocol.sqf"}];
				};
			}
		foreach RYD_HAS_allChoppers
		}
	else
		{
		
		};
				
	//action for RYD_HAS_STT units, if player controlled:

	//RYD_HAS_STT call RYD_HAS_GiveActions;	

	//or instead, for non-unit object:
	//object1 addAction ["<t color='#fe8701'>Call for transport</t>", RYD_HAS_atCalled, 0, 1, false, true, "", "(not (RYD_HAS_wasCalled or {RYD_HAS_radioCalled or {(_originalTarget in RYD_HAS_Chopper)}}) and {(isPlayer _this) and {(RYD_HAS_UseCount < RYD_HAS_Limit) or {(RYD_HAS_Limit < 0)}}})"];
	//object1 addAction ["<t color='#fe8701'>Cancel airlift</t>", "Cancel airlift", 2, 1, false, true, "", "((RYD_HAS_wasCalled) and {(isPlayer _originalTarget) and {not (isNull RYD_HAS_Chopper) and {(alive RYD_HAS_Chopper) and {(RYD_HAS_canCancel)}}}})"];

	_channelU = RYD_HAS_STT + [RYD_HAS_Base];
	
		{
		_channelU = _channelU + (crew _x)
		}
	foreach RYD_HAS_allChoppers;
	RYD_HAS_HQChannel = radioChannelCreate [[1, 1, 0, 0.8], "RadioHQ", "HQ:",_channelU, false];	
	RYD_HAS_PilotChannel = radioChannelCreate [[0, 1, 1, 0.8], "RadioP", "PILOT:",_channelU, false];
	RYD_HAS_CallerChannel = radioChannelCreate [[1, 0, 1, 0.8], "RadioC", "REQUESTOR:",_channelU, false];
	
	publicVariable "RYD_HAS_HQChannel";
	publicVariable "RYD_HAS_PilotChannel";
	publicVariable "RYD_HAS_CallerChannel";
	
	RYD_HAS_isInit = true;
	publicVariable "RYD_HAS_isInit";
	
	RYD_HAS_STT call RYD_HAS_NewUnits;
	
	if ((RYD_HAS_AddHints) and {not (RYD_HAS_Limit < 0)}) then
		{
		[] spawn
			{
			sleep 1;
			
			//hint format ["Chopper available, %1 calls left.",RYD_HAS_Limit];
			(format ["Chopper available, %1 calls left.",RYD_HAS_Limit]) remoteExec ["hint"];
			};
		};
		
	if (RYD_HAS_addJIPs) then
		{
		RYD_HAS_JIPEH = addMissionEventHandler ["PlayerConnected",
			{
			params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
						
			if (_jip) then
				{
				_allPlayers = (allPlayers - (entities "HeadlessClient_F"));

				[_owner,_allPlayers] spawn
					{
					params ["_owner","_allPlayers"];
					
					waitUntil
						{
						sleep 0.1;
						
						not ((allPlayers - (entities "HeadlessClient_F")) isEqualTo _allPlayers)
						};
					
						{
						//if (((owner _x) isEqualTo _owner) and {not ((_x getVariable ["RYD_HAS_Access",false]))}) exitWith
						if ((owner _x) isEqualTo _owner) exitWith
							{
							[_x] call RYD_HAS_NewUnits;
							}
						}
					foreach (allPlayers - (entities "HeadlessClient_F"))
					}
				};
			}];
			
		/*RYD_HAS_JIPLoop = [] spawn
			{
			sleep 5;//just in case
			
			while {true} do
				{
				_allPlayers = (allPlayers - (entities "HeadlessClient_F"));
				sleep 1;
				
				if not ((allPlayers - (entities "HeadlessClient_F")) isEqualTo _allPlayers) then
					{
						{
						if not (_x getVariable ["RYD_HAS_Access",false]) then
							{
							[_x] call RYD_HAS_NewUnits;
							}
						}
					foreach (allPlayers - (entities "HeadlessClient_F"))					
					}
				}
			}*/
		};
		
	[] spawn RYD_HAS_atEnterLoop;
	};
	
RYD_HAS_removeHeliEntry = 
	{
	params ["_heli"];
	
	if (isNull _heli) exitWith {};	
	if not (local _heli) exitWith {};	
	_heli removeMPEventHandler ["MPKilled",(_heli getVariable ["RYD_HAS_myKEH",-1])];
	
	_entry = _heli getVariable ["RYD_HAS_myEntry",[]];
	if ((count _entry) > 0) then
		{
			{
			if (_x isEqualTo _entry) exitWith
				{
				RYD_HAS_CT_submenu set [_foreachIndex,0];
				RYD_HAS_CT_submenu = RYD_HAS_CT_submenu - [0];
				}
			}
		foreach RYD_HAS_CT_submenu;
		};
		
	publicVariable "RYD_HAS_CT_submenu";
	
	_entry2 = _heli getVariable ["RYD_HAS_myEntry2",[]];
	if ((count _entry2) > 0) then
		{
			{
			if (_x isEqualTo _entry2) exitWith
				{
				RYD_HAS_CS_submenu set [_foreachIndex,0];
				RYD_HAS_CS_submenu = RYD_HAS_CS_submenu - [0];
				}
			}
		foreach RYD_HAS_CS_submenu;
		};
		
	publicVariable "RYD_HAS_CS_submenu";
	
	_entry3 = _heli getVariable ["RYD_HAS_myEntry3",[]];
	if ((count _entry3) > 0) then
		{
			{
			if (_x isEqualTo _entry3) exitWith
				{
				RYD_HAS_CC_submenu set [_foreachIndex,0];
				RYD_HAS_CC_submenu = RYD_HAS_CC_submenu - [0];
				}
			}
		foreach RYD_HAS_CC_submenu;
		};

	publicVariable "RYD_HAS_CC_submenu";	
	};
	
RYD_HAS_AddAction =
	{
	params ["_tgt","_pars","_vn"];
	private _id = _tgt addAction _pars;
	_tgt setVariable [_vn,_id,true];
	
	_cond = ((_tgt getVariable ['RYD_HAS_canCall',true]) and {((not (RYD_HAS_wasCalled or {RYD_HAS_radioCalled or {(({_tgt in _x} count RYD_HAS_allChoppers) > 0)}}) and {(isPlayer _tgt) and {((RYD_HAS_UseCount < RYD_HAS_Limit) or {(RYD_HAS_Limit < 0)}) and {_tgt == _tgt}}}) and {(({((not (isNull _x) and {(alive _x) and {not (isNull (driver _x)) and {(alive (driver _x))}}}))} count RYD_HAS_allChoppers) > 0)})});
	};
	
publicVariable "RYD_HAS_AddAction";
	
RYD_HAS_atCalled = 
	{
	if (RYD_HAS_FastReady) then
		{
		_hG = group RYD_HAS_Chopper;

		 while {(count (waypoints _hG)) > 0} do
			 {
			 deleteWaypoint ((waypoints _hG) select 0);
			 };

		//[] call RYD_HAS_ClearRoute;
		};	
	
	[] call RYD_HAS_ClearRoute;
	RYD_HAS_radioCalled = (count _this) > 1; publicVariable "RYD_HAS_radioCalled";
	if (RYD_HAS_wasCalled) exitWith {};
	RYD_HAS_wasCalled = true; publicVariable "RYD_HAS_wasCalled";
	RYD_HAS_wasCalledFast = true; publicVariable "RYD_HAS_wasCalledFast";
	[] call RYD_HAS_ClearUnits;
	
	if ((count RYD_HAS_STT) < 1) exitWith
		{
		//hint "All RYD_HAS_STT units are gone - exiting call.";
		"All RYD_HAS_STT units are gone - exiting call." remoteExec ["hint"];
		RYD_HAS_wasCalled = false; publicVariable "RYD_HAS_wasCalled";
		RYD_HAS_wasCalledFast = false; publicVariable "RYD_HAS_wasCalledFast";
		RYD_HAS_radioCalled = false; publicVariable "RYD_HAS_radioCalled";
		};
		
	diag_log "atcalled clear helis";
	[] call RYD_HAS_ClearHelis;
	
	if ((count RYD_HAS_allChoppers) < 1) exitWith
		{
		//hint "All helis are gone - exiting call.";
		"All helis are gone - exiting call." remoteExec ["hint"];
		RYD_HAS_wasCalled = false; publicVariable "RYD_HAS_wasCalled";
		RYD_HAS_wasCalledFast = false; publicVariable "RYD_HAS_wasCalledFast";
		RYD_HAS_radioCalled = false; publicVariable "RYD_HAS_radioCalled";
		};
		
	RYD_HAS_isSupplyRun = false; 
	publicVariable "RYD_HAS_isSupplyRun";
	RYD_HAS_isCASRun = false; 
	publicVariable "RYD_HAS_isCASRun";
			
	RYD_HAS_Caller = if (RYD_HAS_radioCalled) then
		{
		RYD_HAS_isSupplyRun = (_this select 3) == 1;
		publicVariable "RYD_HAS_isSupplyRun";
		RYD_HAS_isCASRun = (_this select 3) == 2;
		publicVariable "RYD_HAS_isCASRun";
		_this select 1
		}
	else
		{
		_unit = objNull;
		
			{
			if ((isPlayer _x) and {(_x in RYD_HAS_Chopper)}) exitWith
				{
				_unit = _x
				}
			}
		foreach RYD_HAS_STT;
		
		if (isNull _unit) then
			{
				{
				if (isPlayer _x) exitWith
					{
					_unit = _x
					}
				}
			foreach RYD_HAS_STT;
			};
			
		if (isNull _unit) then
			{
			_unit = RYD_HAS_STT select 0
			};
		
		_unit
		};
		
	publicVariable "RYD_HAS_Caller";
	
	_pickPos = position RYD_HAS_Caller;
	_box = objNull;
	
	if (RYD_HAS_isSupplyRun) then
		{
		RYD_HAS_box = objNull;
		_box = [RYD_HAS_Base] call RYD_HAS_doBox
		};
		
	if (((count _this) > 4) and {((_this select 4) in RYD_HAS_allChoppers)}) then
		{
		RYD_HAS_Chopper = _this select 4;
		}
	else
		{
		if (RYD_HAS_radioCalled) then
			{
			if (RYD_HAS_isCASRun) exitWith
				{
				if ((count RYD_HAS_CASChoppers) > 0) then
					{
					RYD_HAS_Chopper = [position RYD_HAS_Caller,RYD_HAS_CASChoppers,false] call RYD_HAS_FindCASAbleHeli;
					};
				};
				
			RYD_HAS_Chopper = [_pickPos,RYD_HAS_allChoppers,_box] call RYD_HAS_FindClosestAbleHeli;
			}
		else
			{
			RYD_HAS_Chopper = _this select 0;
			};
		};
		
	publicVariable "RYD_HAS_Chopper";
				
	if (isNull RYD_HAS_Chopper) exitWith
		{
		deleteVehicle _box;
		//hint "There's no heli able to perform the airlift - exiting call.";
		"There's no heli able to perform the task - exiting call." remoteExec ["hint"];
		RYD_HAS_wasCalled = false; publicVariable "RYD_HAS_wasCalled";
		RYD_HAS_wasCalledFast = false; publicVariable "RYD_HAS_wasCalledFast";
		RYD_HAS_radioCalled = false; publicVariable "RYD_HAS_radioCalled";
		};
	
	if (((_pickPos distance RYD_HAS_Chopper) < 100) and {(RYD_HAS_whenInside) and {(RYD_HAS_radioCalled) and {not ((RYD_HAS_isSupplyRun) or {(RYD_HAS_isCASRun)}) and {(isTouchingGround RYD_HAS_Chopper)}}}}) exitWith
		{
		//hint format ["You're too close to the heli for radio call (%1 meters). For airlift just embark the helicopter.",(round (_pickPos distance RYD_HAS_Chopper))];
		(format ["You're too close to the heli for radio call (%1 meters). For airlift just embark the helicopter.",(round (_pickPos distance RYD_HAS_Chopper))]) remoteExec ["hint"];
		RYD_HAS_wasCalled = false; publicVariable "RYD_HAS_wasCalled";
		RYD_HAS_wasCalledFast = false; publicVariable "RYD_HAS_wasCalledFast";
		RYD_HAS_radioCalled = false; publicVariable "RYD_HAS_radioCalled";		
		};
		
	RYD_HAS_clickedPos = [];
	RYD_HAS_MidWPs = [];
	publicVariable "RYD_HAS_MidWPs";

	_lvl = if (RYD_HAS_AutoInOut) then
		{
		6
		}
	else
		{
		4
		};	
	
	RYD_HAS_kEHIx = RYD_HAS_Caller addMPEventHandler ["MPKilled",RYD_HAS_atKilled];
	publicVariable "RYD_HAS_kEHIx";
	
	_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
	_unable = false;
	RYD_HAS_Hooked = false; publicVariable "RYD_HAS_Hooked";
	RYD_HAS_canCancel = true; publicVariable "RYD_HAS_canCancel";
	
	_dropPos = position RYD_HAS_Base;
	_lzMark = "";
	_heliPad = objNull;
	RYD_HAS_wps = [];
	RYD_HAS_UseCount = RYD_HAS_UseCount + 1;
	publicVariable "RYD_HAS_UseCount";
	
	if (RYD_HAS_isCASRun) exitWith
		{
		RYD_HAS_canCancel = true; publicVariable "RYD_HAS_canCancel";
		RYD_HAS_CASPatternChoice = true;publicVariable "RYD_HAS_CASPatternChoice";
		RYD_HAS_CAS_isHover = false;
		RYD_HAS_CAS_isSAD = false;
		
		publicVariable "RYD_HAS_CAS_isHover";
		publicVariable "RYD_HAS_CAS_isSAD";
		
		'Choose CAS pattern' remoteExec ['hint'];
		
		[RYD_HAS_Caller,["<t color='#fe8701'>CAS pattern: HOVER</t>", "RYD_HAS_CAS_isHover = true;publicVariableServer 'RYD_HAS_CAS_isHover';RYD_HAS_CAS_isSAD = false;publicVariableServer 'RYD_HAS_CAS_isSAD';'CAS pattern: HOVER' remoteExec ['hint'];", true, 1, true, true, "", "not RYD_HAS_CAS_isHover"],"RYD_HAS_myCASAction"] remoteExec ["RYD_HAS_AddAction",RYD_HAS_Caller];
		[RYD_HAS_Caller,["<t color='#fe8701'>CAS pattern: SAD</t>", "RYD_HAS_CAS_isSAD = true;publicVariableServer 'RYD_HAS_CAS_isSAD';RYD_HAS_CAS_isHover = false;publicVariableServer 'RYD_HAS_CAS_isHover';'CAS pattern: SAD' remoteExec ['hint'];", true, 1, true, true, "", "not RYD_HAS_CAS_isSAD"],"RYD_HAS_myCASActionB"] remoteExec ["RYD_HAS_AddAction",RYD_HAS_Caller];

		waitUntil
			{
			sleep 0.1;
			if (RYD_HAS_UnitsGone) exitWith {_unable = true;true};			
			if (RYD_HAS_CallCancelled) exitWith {true};
			
			((RYD_HAS_CAS_isHover) or {(RYD_HAS_CAS_isSAD)})						
			};
				
		if ((isNull RYD_HAS_Chopper) or {(RYD_HAS_CallCancelled) or {(_unable)}}) exitWith 
			{
			[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myCASAction",-1])] remoteExec ["removeAction",RYD_HAS_Caller];
			[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myCASActionB",-1])] remoteExec ["removeAction",RYD_HAS_Caller];			
			'CAS mission cancelled.' remoteExec ['hint'];
			};		
				
		_uName = if (RYD_HAS_CallerName isEqualTo "") then
			{
			((toLower (rank RYD_HAS_Caller)) + " " + (name RYD_HAS_Caller))
			}
		else
			{
			RYD_HAS_CallerName
			};
			
		_txt = format [(selectRandom RYD_HAS_sent_Request_cas),_uName];
		//RYD_HAS_Caller customChat [RYD_HAS_CallerChannel,_txt];
		[RYD_HAS_Caller,[RYD_HAS_CallerChannel,_txt]] remoteExec ["customChat"];
		if (true) then//if (player in RYD_HAS_STT) then
			{
			//playSound "TacticalPing2";
			"TacticalPing2" remoteExec ["playSound",RYD_HAS_Caller];
			};
			
		sleep 4;
		if ((isNull RYD_HAS_Chopper) or {not (alive RYD_HAS_Chopper) or {(isNull (driver RYD_HAS_Chopper)) or {not (alive (driver RYD_HAS_Chopper)) or {not (canMove RYD_HAS_Chopper)}}}}) exitWith//if not ((alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)}) exitWith
			{
			[] call RYD_HAS_atDestroy
			};
			
		if (RYD_HAS_CallCancelled) exitWith 
			{
			[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myCASAction",-1])] remoteExec ["removeAction",RYD_HAS_Caller];
			[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myCASActionB",-1])] remoteExec ["removeAction",RYD_HAS_Caller];
			};
			
		_txt = selectRandom RYD_HAS_sent_Confirmation_cas;
		//RYD_HAS_Base customChat [RYD_HAS_HQChannel,_txt];
		[RYD_HAS_Base,[RYD_HAS_HQChannel,_txt]] remoteExec ["customChat"];
		if (true) then//if (player in RYD_HAS_STT) then
			{
			//playSound "TacticalPing4";
			"TacticalPing4" remoteExec ["playSound",RYD_HAS_Caller];
			};
	
		[["RYD_HAS_HeliT","onMapSingleClick","RYD_HAS_MapPointCAS"],BIS_fnc_addStackedEventHandler] remoteExec ["call",RYD_HAS_Caller];
		true remoteExec ["openMap",RYD_HAS_Caller];
		["HelpLayer",["shift+LMB: new route navpoint\nalt+LMB: clear all navpoints\nLMB: final coordinates (ends route planning)","PLAIN DOWN"]] remoteExec ["cutText",RYD_HAS_Caller];
		
		RYD_HAS_clickedPos = [];
		
		waitUntil
			{
			sleep 0.1;
			if (RYD_HAS_UnitsGone) exitWith {_unable = true;true};			
			if (RYD_HAS_CallCancelled) exitWith {true};
			
			((count RYD_HAS_clickedPos) > 1)						
			};

		//[["RYD_HAS_HeliT", "onMapSingleClick"],BIS_fnc_removeStackedEventHandler] remoteExec ["call",RYD_HAS_Caller];
		
		if not ((count _this) > 4) then
			{
			RYD_HAS_Chopper = [RYD_HAS_clickedPos,RYD_HAS_CASChoppers,({(((side RYD_HAS_Caller) getFriend (side _x)) < 0.6)} count (RYD_HAS_clickedPos nearEntities [["Tank"],RYD_HAS_CAS_Range]) > 0)] call RYD_HAS_FindCASAbleHeli;
			};
				
		if ((isNull RYD_HAS_Chopper) or {(RYD_HAS_CallCancelled) or {(_unable)}}) exitWith 
			{
			[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myCASAction",-1])] remoteExec ["removeAction",RYD_HAS_Caller];
			[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myCASActionB",-1])] remoteExec ["removeAction",RYD_HAS_Caller];
			[["RYD_HAS_HeliT", "onMapSingleClick"],BIS_fnc_removeStackedEventHandler] remoteExec ["call",RYD_HAS_Caller];
			'CAS mission cancelled.' remoteExec ['hint'];
			};
			
		[RYD_HAS_Chopper,RYD_HAS_clickedPos,RYD_HAS_Caller,RYD_HAS_CAS_Distance,RYD_HAS_CAS_Range,RYD_HAS_CAS_OnlyKnownTargets] call RYD_HAS_CAS;
		RYD_HAS_canCancel = false; publicVariable "RYD_HAS_canCancel";
		
		if ((isNull RYD_HAS_Chopper) or {not (alive RYD_HAS_Chopper) or {(isNull (driver RYD_HAS_Chopper)) or {not (alive (driver RYD_HAS_Chopper)) or {not (canMove RYD_HAS_Chopper)}}}}) exitWith//if not ((alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)}) exitWith
			{
			[] call RYD_HAS_atDestroy
			};
			
		if (RYD_HAS_CAS_reammo) then
			{
			RYD_HAS_Chopper setVehicleAmmoDef 1;
			};
							
		if (RYD_HAS_CallCancelled) exitWith
			{
			RYD_HAS_CallCancelled = false;

			_uName = if (RYD_HAS_CallerName isEqualTo "") then
				{
				((toLower (rank RYD_HAS_Caller)) + " " + (name RYD_HAS_Caller))
				}
			else
				{
				RYD_HAS_CallerName
				};
				
			_txt = format [(selectRandom RYD_HAS_sent_CASCancelled_cas),_uName];
			//RYD_HAS_Caller customChat [RYD_HAS_CallerChannel,_txt];
			[RYD_HAS_Caller,[RYD_HAS_CallerChannel,_txt]] remoteExec ["customChat"];
			if (true) then//if (player in RYD_HAS_STT) then
				{
				//playSound "TacticalPing2";
				"TacticalPing2" remoteExec ["playSound",RYD_HAS_Caller];
				};

			sleep (3 + (random 2));
			
			_txt = selectRandom RYD_HAS_sent_CASCancelledConf_cas;
			//(driver _heli) customChat [RYD_HAS_PilotChannel,_txt];
			[(driver RYD_HAS_Chopper),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
			if (true) then//if (player in RYD_HAS_STT) then
				{
				//playSound "TacticalPing3";
				"TacticalPing3" remoteExec ["playSound",RYD_HAS_Caller];
				};
				
			[] call RYD_HAS_HeliRTB
			};
			
		RYD_HAS_CallCancelled = false;
		[] call RYD_HAS_HeliRTB
		};
	
	_hG = group RYD_HAS_Chopper;
		 
	RYD_HAS_oldBeh = behaviour (leader _hG);
	RYD_HAS_oldCM = combatMode _hG;
	
	 while {(count (waypoints _hG)) > 0} do
		 {
		 deleteWaypoint ((waypoints _hG) select 0);
		 };		
	
	_hG setBehaviour "CARELESS";
	_hG setCombatMode "YELLOW";

	if (RYD_HAS_radioCalled) then
		{
		RYD_HAS_ForcedPos = _pickPos;
		publicVariable "RYD_HAS_ForcedPos";
		RYD_HAS_canCancel = false; publicVariable "RYD_HAS_canCancel";
		[["RYD_HAS_HeliT","onMapSingleClick","RYD_HAS_MapPoint"],BIS_fnc_addStackedEventHandler] remoteExec ["call",RYD_HAS_Caller];
		//openMap true;
		true remoteExec ["openMap",RYD_HAS_Caller];
		["HelpLayer",["shift+LMB: new route navpoint\nalt+LMB: clear all navpoints\nLMB: ends route planning","PLAIN DOWN"]] remoteExec ["cutText",RYD_HAS_Caller];
		
		RYD_HAS_clickedPos = [];
				
		waitUntil
			{
			sleep 0.1;
			_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
			if not (_alive) exitWith {true};
			if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};

			((count RYD_HAS_clickedPos) > 1)						
			};

		//["RYD_HAS_HeliT", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
		[["RYD_HAS_HeliT", "onMapSingleClick"],BIS_fnc_removeStackedEventHandler] remoteExec ["call",RYD_HAS_Caller];	
		RYD_HAS_canCancel = true; publicVariable "RYD_HAS_canCancel";
		};
	
	if (RYD_HAS_isSupplyRun) exitWith
		{
		[RYD_HAS_Chopper,_pickPos,_box] call RYD_HAS_SupplyCall
		};

	_myLvl = (getTerrainHeightASL (position RYD_HAS_Chopper)) + RYD_HAS_ChopperLvl;
	RYD_HAS_Chopper flyInHeightASL [_myLvl, _myLvl, _myLvl];
	RYD_HAS_Chopper flyInHeight RYD_HAS_ChopperLvl;
	RYD_HAS_Chopper setVariable ["RYD_HAS_myLvl",RYD_HAS_ChopperLvl];
		
	if (RYD_HAS_radioCalled) then
		{
		if not (_alive) exitWith 
			{
			//RYD_HAS_Caller removeAction RYD_HAS_aID2;
			//[RYD_HAS_Caller,RYD_HAS_aID2] remoteExec ["removeAction",RYD_HAS_Caller];		
			'Route planning cancelled.' remoteExec ['hint'];
			};	
			
		if (_unable) exitWith 
			{
			//RYD_HAS_Caller removeAction RYD_HAS_aID2;
			//[RYD_HAS_Caller,RYD_HAS_aID2] remoteExec ["removeAction",RYD_HAS_Caller];			
			'Route planning cancelled.' remoteExec ['hint'];
			};		
		
		if (RYD_HAS_VoiceChat) then
			{
			if not (RYD_HAS_Caller kbHasTopic "BIS_SUPP_protocol") then
				{
				RYD_HAS_Caller kbAddtopic ["BIS_SUPP_protocol", "A3\Modules_F\supports\kb\protocol.bikb", "A3\Modules_F\supports\kb\protocol.fsm", {call compile preprocessFileLineNumbers "A3\Modules_F\supports\kb\protocol.sqf"}]
				};
			}
		else
			{
			};
		
		if ((isNull RYD_HAS_Chopper) or {not (alive RYD_HAS_Chopper) or {(isNull (driver RYD_HAS_Chopper)) or {not (alive (driver RYD_HAS_Chopper)) or {not (canMove RYD_HAS_Chopper)}}}}) exitWith//if not ((alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)}) exitWith
			{
			[] call RYD_HAS_atDestroy
			};
		
		if (RYD_HAS_VoiceChat) then
			{	
			RYD_HAS_Caller kbTell [RYD_HAS_Base, "BIS_SUPP_protocol", "Transport_Request", ""];
			}
		else
			{
			_uName = if (RYD_HAS_CallerName isEqualTo "") then
				{
				((toLower (rank RYD_HAS_Caller)) + " " + (name RYD_HAS_Caller))
				}
			else
				{
				RYD_HAS_CallerName
				};
				
			_txt = format [(selectRandom RYD_HAS_sent_Request),_uName];
			//RYD_HAS_Caller customChat [RYD_HAS_CallerChannel,_txt];
			[RYD_HAS_Caller,[RYD_HAS_CallerChannel,_txt]] remoteExec ["customChat"];
			if (true) then//if (player in RYD_HAS_STT) then
				{
				//playSound "TacticalPing2";
				"TacticalPing2" remoteExec ["playSound",RYD_HAS_Caller];
				}
			};
								
		sleep 4;
		if ((isNull RYD_HAS_Chopper) or {not (alive RYD_HAS_Chopper) or {(isNull (driver RYD_HAS_Chopper)) or {not (alive (driver RYD_HAS_Chopper)) or {not (canMove RYD_HAS_Chopper)}}}}) exitWith//if not ((alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)}) exitWith
			{
			[] call RYD_HAS_atDestroy
			};
			
		if (RYD_HAS_CallCancelled) exitWith {};
		
		if (RYD_HAS_AddHints) then
			{
			//Hint "Chopper en route!";
			"Chopper en route!" remoteExec ["hint"];
			};
			
		if (RYD_HAS_VoiceChat) then
			{
			RYD_HAS_Base kbTell [RYD_HAS_Caller, "BIS_SUPP_protocol", "Transport_Acknowledged", ""];
			}
		else
			{				
			_txt = selectRandom RYD_HAS_sent_Confirmation;
			//RYD_HAS_Base customChat [RYD_HAS_HQChannel,_txt];
			[RYD_HAS_Base,[RYD_HAS_HQChannel,_txt]] remoteExec ["customChat"];
			if (true) then//if (player in RYD_HAS_STT) then
				{
				//playSound "TacticalPing4";
				"TacticalPing4" remoteExec ["playSound",RYD_HAS_Caller];
				}
			};
			
		_signalClasses = if ([] call RYD_HAS_isDaylight) then
			{
			RYD_HAS_SignalClassesDay
			}
		else
			{
			RYD_HAS_SignalClassesNight
			};	
			
		_pickPos = [_signalClasses,_pickPos,true,200] call RYD_HAS_Signal;
			
		if not (_alive) exitWith {};
		if (_unable) exitWith {};
		if (RYD_HAS_CallCancelled) exitWith {};
		RYD_HAS_done = false;
		
		_pickPosR = _pickPos;
				
		_wpRad = if not (RYD_HAS_AlternativeLanding) then
			{
			_pickPosR = RYD_HAS_Chopper getPos [(RYD_HAS_Chopper distance2D _pickPos) + 80, RYD_HAS_Chopper getDir _pickPos];
			50
			}
		else
			{
			0
			};

		_wp0 = group RYD_HAS_Chopper addWaypoint [_pickPosR, _wpRad];
		_wp0 setWaypointType "MOVE";
		
		_lvl = 4;
		if not (RYD_HAS_AlternativeLanding) then
			{
			_wp0 setWaypointStatements ["true", "RYD_HAS_Chopper land 'GET IN';RYD_HAS_done = true;"]
			}
		else
			{
			_lvl = 1;
			_wp0 setWaypointStatements ["true", "RYD_HAS_done = true;"]
			};
		
		group RYD_HAS_Chopper setCurrentWaypoint _wp0;
		
		waitUntil 
			{
			sleep 0.1;
			_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
			
			if not (_alive) exitWith {true};
			if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};
			if (RYD_HAS_CallCancelled) exitWith {true};
			
			if not (RYD_HAS_CruisingSpeed < 10) then
				{
				[RYD_HAS_Chopper] call RYD_HAS_TurningSpeed
				};

			(((((getPos RYD_HAS_Chopper) select 2) < _lvl) or {(RYD_HAS_AlternativeLanding)}) and {(RYD_HAS_done)})
			};
		
		if not (_alive) exitWith {};
		if (_unable) exitWith {};
		if (RYD_HAS_CallCancelled) exitWith {};
		
		if (RYD_HAS_AlternativeLanding) then
			{
			_frc = 0.9;
			waitUntil 
				{
				sleep 0.1;
				_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
				
				if not (_alive) exitWith {true};
				if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};
				if (RYD_HAS_CallCancelled) exitWith {true};
				
				if (RYD_HAS_AlternativeLanding) then
					{
					[RYD_HAS_Chopper,0.5,0,_pickPos,2,3,_frc] call RYD_HAS_AutoGuideB;
					_frc = (_frc - 0.025) max 0;
					};

				(((getPos RYD_HAS_Chopper) select 2) < _lvl)
				};			
			};
			
		if not (_alive) exitWith {};
		if (_unable) exitWith {};
		if (RYD_HAS_CallCancelled) exitWith {};
		
		if (RYD_HAS_AutoInOut) then
			{
			[] call RYD_HAS_AutoEmbark
			};

		/*waitUntil 
			{
			sleep 1;
			_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
			if not (_alive) exitWith {true};
			if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};
			if (RYD_HAS_CallCancelled) exitWith {true};

			(({_x in RYD_HAS_Chopper} count RYD_HAS_STT) == ({alive _x} count RYD_HAS_STT))
			};
		
		if not (_alive) exitWith {};
		if (_unable) exitWith {};
		if (RYD_HAS_CallCancelled) exitWith {};*/
		};
					
	if not (_alive) exitWith
		{
		deleteMarker _lzMark;
		deleteVehicle _helipad;	
		RYD_HAS_canCancel = false; publicVariable "RYD_HAS_canCancel";
		[] call RYD_HAS_atDestroy
		};	

	if (_unable) exitWith 
		{
		deleteMarker _lzMark;
		deleteVehicle _helipad;	
		RYD_HAS_canCancel = false; publicVariable "RYD_HAS_canCancel";
		//hint "Unable to complete airlift. Exiting call.";
		"Unable to complete airlift. Exiting call." remoteExec ["hint"];
		[] call RYD_HAS_HeliRTB
		};

	if (RYD_HAS_CallCancelled) exitWith
		{
		deleteMarker _lzMark;
		deleteVehicle _helipad;	
		RYD_HAS_canCancel = false; publicVariable "RYD_HAS_canCancel";
		RYD_HAS_CallCancelled = false;
		if not (RYD_HAS_VoiceChat) then
			{
			_uName = if (RYD_HAS_CallerName isEqualTo "") then
				{
				((toLower (rank RYD_HAS_Caller)) + " " + (name RYD_HAS_Caller))
				}
			else
				{
				RYD_HAS_CallerName
				};
				
			_txt = format [(selectRandom RYD_HAS_sent_AirliftCancelled),_uName];
			//RYD_HAS_Caller customChat [RYD_HAS_CallerChannel,_txt];
			[RYD_HAS_Caller,[RYD_HAS_CallerChannel,_txt]] remoteExec ["customChat"];
			if (true) then//if (player in RYD_HAS_STT) then
				{
				playSound "TacticalPing2";
				"TacticalPing2" remoteExec ["playSound",RYD_HAS_Caller];
				};

			sleep (3 + (random 2));
			
			_txt = selectRandom RYD_HAS_sent_AirliftCancelledConf;
			//(driver RYD_HAS_Chopper) customChat [RYD_HAS_PilotChannel,_txt];
			[(driver RYD_HAS_Chopper),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
			if (true) then//if (player in RYD_HAS_STT) then
				{
				playSound "TacticalPing3";
				"TacticalPing3" remoteExec ["playSound",RYD_HAS_Caller];
				}			
			}
		else
			{
			//hint "Airlift cancelled. Heli is RTB."
			"Airlift cancelled. Heli is RTB." remoteExec ["hint"];
			};
			
		[] call RYD_HAS_HeliRTB
		};
	
	RYD_HAS_canCancel = false; publicVariable "RYD_HAS_canCancel";
	RYD_HAS_RTB = false;
	RYD_HAS_Map = false;//not RYD_HAS_RadioCalled;
	RYD_HAS_Corr = false;
	
	if (RYD_HAS_AlternativeLanding) then
		{
		_tme = time;
		waitUntil 
			{
			sleep 0.1;
			_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
			
			if not (_alive) exitWith {true};
			if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};

			[RYD_HAS_Chopper,0.5,0,_pickPos,2,2.5,0] call RYD_HAS_AutoGuideB;

			((time - _tme) > 1)
			};			
		}
	else
		{
		sleep 1;
		};
		
	if not (_alive) exitWith
		{
		[] call RYD_HAS_atDestroy
		};
		
	if (_unable) exitWith 
		{
		//hint "Unable to complete airlift. Exiting call.";
		"Unable to complete airlift. Exiting call." remoteExec ["hint"];
		[] call RYD_HAS_HeliRTB
		};
	
	if (RYD_HAS_AddHints) then
		{
		//hint "Choose destination!";
		"Choose destination!" remoteExec ["hint"];
		};
			
	if (RYD_HAS_VoiceChat) then
		{
		[] spawn
			{
			_alive = true;
			_unable = false;
			waitUntil
				{
				sleep 0.1;
				_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
				if not (_alive) exitWith {true};
				if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};
				
				(((RYD_HAS_Map) or {(RYD_HAS_RTB)}) or {(({_x in RYD_HAS_Chopper} count RYD_HAS_STT) == ({alive _x} count RYD_HAS_STT))})
				};
				
		
			if not (_alive) exitWith {};
			if (_unable) exitWith {};
			
			if ((RYD_HAS_Map) or {(RYD_HAS_RTB)}) exitwith {};
			sleep 2;
			
			_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
			if not (_alive) exitWith {};
			if not ([] call RYD_HAS_ifChopperReady) exitWith {};
			
			(driver RYD_HAS_Chopper) kbTell [RYD_HAS_Caller, "BIS_SUPP_protocol", "Transport_Welcome", ""];
			};
		}
	else
		{
		_txt = selectRandom RYD_HAS_sent_Welcome;
		//(driver RYD_HAS_Chopper) customChat [RYD_HAS_PilotChannel,_txt];
		[(driver RYD_HAS_Chopper),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
		};
		
	RYD_HAS_DecisionTime = true;

	//RYD_HAS_aID2 = RYD_HAS_Caller addAction ["<t color='#fe8701'>Transport to another location</t>", "RYD_HAS_Map = true", true, 1, true, true, "", ""];
	//[RYD_HAS_Caller,["<t color='#fe8701'>Transport to another location</t>", "RYD_HAS_Map = true;publicVariableServer 'RYD_HAS_Map';RYD_HAS_aID2 = _this select 2;publicVariableServer 'RYD_HAS_aID2';", true, 1, true, true, "", ""]] remoteExec ["addAction",RYD_HAS_Caller];
	[RYD_HAS_Caller,["<t color='#fe8701'>Transport to another location (touchdown)</t>", "RYD_HAS_Map = true;publicVariableServer 'RYD_HAS_Map';RYD_HAS_Corr = true;publicVariableServer 'RYD_HAS_Corr';RYD_HAS_wasFastRoping = RYD_HAS_FastRoping;publicVariableServer 'RYD_HAS_wasFastRoping';RYD_HAS_FastRoping = false;publicVariable 'RYD_HAS_FastRoping';", true, 1, true, true, "", "not RYD_HAS_NewDestinationPending"],"RYD_HAS_myTTLAction"] remoteExec ["RYD_HAS_AddAction",RYD_HAS_Caller];
	[RYD_HAS_Caller,["<t color='#fe8701'>Transport to another location (fast rope)</t>", "RYD_HAS_Map = true;publicVariableServer 'RYD_HAS_Map';RYD_HAS_Corr = true;publicVariableServer 'RYD_HAS_Corr';RYD_HAS_wasFastRoping = RYD_HAS_FastRoping;publicVariableServer 'RYD_HAS_wasFastRoping';RYD_HAS_FastRoping = true;publicVariable 'RYD_HAS_FastRoping';", true, 1, true, true, "", "not RYD_HAS_NewDestinationPending"],"RYD_HAS_myTTLActionB"] remoteExec ["RYD_HAS_AddAction",RYD_HAS_Caller];
	if (RYD_HAS_RadioCalled) then
		{
		//RYD_HAS_aID = RYD_HAS_Caller addAction ["<t color='#fe8701'>RTB</t>", "RYD_HAS_RTB = true", true, 1, true, true, "", ""];
		//[RYD_HAS_Caller,["<t color='#fe8701'>RTB</t>", "RYD_HAS_RTB = true;publicVariableServer 'RYD_HAS_RTB';RYD_HAS_aID = _this select 2;publicVariableServer 'RYD_HAS_aID';", true, 1, true, true, "", ""]] remoteExec ["addAction",RYD_HAS_Caller]; 
		[RYD_HAS_Caller,["<t color='#fe8701'>RTB</t>", "RYD_HAS_RTB = true;publicVariableServer 'RYD_HAS_RTB';", true, 1, true, true, "", ""],"RYD_HAS_myRTBAction"] remoteExec ["RYD_HAS_AddAction",RYD_HAS_Caller];
		};

	_callerAlive = true;	
	waitUntil
		{
		sleep 0.1;
		
		_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
		if not (_alive) exitWith {true};
		if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};
		
		if (RYD_HAS_AlternativeLanding) then
			{
			[RYD_HAS_Chopper,0.5,0,_pickPos,2,2.5,0] call RYD_HAS_AutoGuideB
			};

		((RYD_HAS_Map) or {(RYD_HAS_RTB)}) 
		};
		
		{
		deleteWaypoint _x
		}
	foreach RYD_HAS_wps;
	
	//RYD_HAS_Caller removeAction RYD_HAS_aID;
	[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myRTBAction",-1])] remoteExec ["removeAction",RYD_HAS_Caller];
	
	deleteMarker _lzMark;
	deleteVehicle _helipad;
				
	if not (_alive) exitWith
		{
		RYD_HAS_DecisionTime = false;
		//RYD_HAS_Caller removeAction RYD_HAS_aID2;
		//[RYD_HAS_Caller,RYD_HAS_aID2] remoteExec ["removeAction",RYD_HAS_Caller];
		[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myTTLAction",-1])] remoteExec ["removeAction",RYD_HAS_Caller];
		[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myTTLActionB",-1])] remoteExec ["removeAction",RYD_HAS_Caller];
		[] call RYD_HAS_atDestroy
		};
		
	if (_unable) exitWith 
		{
		RYD_HAS_DecisionTime = false;
		//RYD_HAS_Caller removeAction RYD_HAS_aID2;
		//[RYD_HAS_Caller,RYD_HAS_aID2] remoteExec ["removeAction",RYD_HAS_Caller];
		[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myTTLAction",-1])] remoteExec ["removeAction",RYD_HAS_Caller];
		[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myTTLActionB",-1])] remoteExec ["removeAction",RYD_HAS_Caller];
		//hint "Unable to complete airlift. Exiting call.";
		"Unable to complete airlift. Exiting call." remoteExec ["hint"];
		[] call RYD_HAS_HeliRTB
		};
		
	if (RYD_HAS_Map) then
		{
		//["RYD_HAS_HeliT","onMapSingleClick","RYD_HAS_MapPoint"] call BIS_fnc_addStackedEventHandler;
		RYD_HAS_canCancel = false; publicVariable "RYD_HAS_canCancel";
		[["RYD_HAS_HeliT","onMapSingleClick","RYD_HAS_MapPoint"],BIS_fnc_addStackedEventHandler] remoteExec ["call",RYD_HAS_Caller];
		//openMap true;
		true remoteExec ["openMap",RYD_HAS_Caller];
		["HelpLayer",["shift+LMB: new route navpoint\nalt+LMB: clear all navpoints\nLMB: final coordinates (ends route planning)","PLAIN DOWN"]] remoteExec ["cutText",RYD_HAS_Caller];
		
		RYD_HAS_clickedPos = [];
		
		waitUntil
			{
			sleep 0.1;
			_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
			if not (_alive) exitWith {true};
			if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};
			
			if (RYD_HAS_AlternativeLanding) then
				{
				[RYD_HAS_Chopper,0.5,0,_pickPos,2,2.5,0] call RYD_HAS_AutoGuideB
				};

			((count RYD_HAS_clickedPos) > 1)						
			};

		//["RYD_HAS_HeliT", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
		[["RYD_HAS_HeliT", "onMapSingleClick"],BIS_fnc_removeStackedEventHandler] remoteExec ["call",RYD_HAS_Caller];
		if not (_alive) exitWith 
			{
			RYD_HAS_DecisionTime = false;
			//RYD_HAS_Caller removeAction RYD_HAS_aID2;
			//[RYD_HAS_Caller,RYD_HAS_aID2] remoteExec ["removeAction",RYD_HAS_Caller];
			[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myTTLAction",-1])] remoteExec ["removeAction",RYD_HAS_Caller];
			[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myTTLActionB",-1])] remoteExec ["removeAction",RYD_HAS_Caller];			
			'Destination choice cancelled.' remoteExec ['hint'];
			};	
			
		if (_unable) exitWith 
			{
			RYD_HAS_DecisionTime = false;
			//RYD_HAS_Caller removeAction RYD_HAS_aID2;
			//[RYD_HAS_Caller,RYD_HAS_aID2] remoteExec ["removeAction",RYD_HAS_Caller];
			[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myTTLAction",-1])] remoteExec ["removeAction",RYD_HAS_Caller];
			[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myTTLActionB",-1])] remoteExec ["removeAction",RYD_HAS_Caller];			
			'Destination choice cancelled.' remoteExec ['hint'];
			};
			
		_i = "DZ_mark";
		_i = createMarker [_i,RYD_HAS_clickedPos];
		_i setMarkerColor "ColorRed";
		_i setMarkerShape "ICON";
		_i setMarkerType "mil_end";
		_i setMarkerSize [0.75,0.75];	
				
		RYD_HAS_done = false;
		
		_rds = 0;
		_helipad = objNull;
		_minLvl = RYD_HAS_FastRopingLvl;
			
		RYD_HAS_clickedPosFR = RYD_HAS_clickedPos;

		if ((RYD_HAS_FastRoping) or {(RYD_HAS_AlternativeLanding)}) then
			{
			if (RYD_HAS_FastRoping) then
				{
				_frPosArray = [RYD_HAS_clickedPos,_i,_minLvl] call RYD_HAS_FindFRpos;
				RYD_HAS_clickedPos = _frPosArray select 0;
				RYD_HAS_clickedPosFR = RYD_HAS_Chopper getPos [(RYD_HAS_Chopper distance2D RYD_HAS_clickedPos) + 80, RYD_HAS_Chopper getDir RYD_HAS_clickedPos];
				_minLvl = _frPosArray select 1;
				_rds = 0;
				}
			else
				{
				_alPosArray = [RYD_HAS_clickedPos,_i,RYD_HAS_Chopper] call RYD_HAS_FindALpos;
				RYD_HAS_clickedPos = _alPosArray select 0;
				RYD_HAS_clickedPosFR = RYD_HAS_Chopper getPos [(RYD_HAS_Chopper distance2D RYD_HAS_clickedPos) + 80, RYD_HAS_Chopper getDir RYD_HAS_clickedPos];
				_minLvl = 1;
				_rds = 0;
				};
			};
		
		_wps = [RYD_HAS_Chopper] call RYD_HAS_ExecuteRoute;
		if ((count _wps) > 0) then
			{
			if ((RYD_HAS_FastRoping) or {(RYD_HAS_AlternativeLanding)}) then
				{
				if (RYD_HAS_FastRoping) then
					{
					_frPosArray = [RYD_HAS_clickedPos,_i,_minLvl] call RYD_HAS_FindFRpos;
					RYD_HAS_clickedPos = _frPosArray select 0;
					_refPos = waypointPosition (_wps select ((count _wps) - 1));
					RYD_HAS_clickedPosFR = _refPos getPos [(_refPos distance2D RYD_HAS_clickedPos) + 80, _refPos getDir RYD_HAS_clickedPos];
					_minLvl = _frPosArray select 1;
					_rds = 0;
					}
				else
					{
					_alPosArray = [RYD_HAS_clickedPos,_i,RYD_HAS_Chopper] call RYD_HAS_FindALpos;
					RYD_HAS_clickedPos = _alPosArray select 0;
					_refPos = waypointPosition (_wps select ((count _wps) - 1));
					RYD_HAS_clickedPosFR = _refPos getPos [(_refPos distance2D RYD_HAS_clickedPos) + 80, _refPos getDir RYD_HAS_clickedPos];
					_minLvl = 1;
					_rds = 0;
					};
				};
			};
		
		_wp1 = group RYD_HAS_Chopper addWaypoint [RYD_HAS_clickedPosFR, _rds];
		_wp1 setWaypointType "MOVE";
		_wp1 setWaypointStatements ["true", "RYD_HAS_done = true;"];	

		_wp2 = group RYD_HAS_Chopper addWaypoint [(waypointPosition _wp1),0];
		_wp2 setWaypointType "MOVE";

		_helipadArr = [_helipad,_i];
		
		if not ((RYD_HAS_FastRoping) or {(RYD_HAS_AlternativeLanding)}) then
			{
			_wp2 setWaypointStatements ["true", "RYD_HAS_Chopper land 'GET OUT';"];		
			_helipadArr = [RYD_HAS_clickedPos,_i,true,RYD_HAS_Chopper] call RYD_HAS_LZ;
			_helipad = _helipadArr select 0
			}
		else
			{
			if (RYD_HAS_FastRoping) then
				{
				_command = format ["RYD_HAS_Chopper flyInHeight %1;RYD_HAS_Chopper setVariable ['RYD_HAS_myLvl',%1];",_minLvl];
				_wp2 setWaypointStatements ["true", _command]
				};
			};
			
		sleep 1;
		//openMap false;
		false remoteExec ["openMap",RYD_HAS_Caller];
		
		if (RYD_HAS_VoiceChat) then
			{
			(driver RYD_HAS_Chopper) kbTell [RYD_HAS_Caller, "BIS_SUPP_protocol", "Transport_LZ_Selected", ""];
			}
		else
			{
			_txt = selectRandom RYD_HAS_sent_LZSelected;
			//(driver RYD_HAS_Chopper) customChat [RYD_HAS_PilotChannel,_txt];
			[(driver RYD_HAS_Chopper),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
			};
		
		if ((isNull RYD_HAS_Chopper) or {not (alive RYD_HAS_Chopper) or {(isNull (driver RYD_HAS_Chopper)) or {not (alive (driver RYD_HAS_Chopper)) or {not (canMove RYD_HAS_Chopper)}}}}) exitWith {};//if not ((alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)}) exitWith {};
		RYD_HAS_Corr = false;
		
		waitUntil
			{
			sleep 0.1;
			_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
			
			if not (_alive) exitWith {true};
			if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};

			if (RYD_HAS_Corr) then
				{
				[] call RYD_HAS_NewDestination;								
				RYD_HAS_Corr = false;				
				};
				
			if not (RYD_HAS_CruisingSpeed < 10) then
				{
				[RYD_HAS_Chopper] call RYD_HAS_TurningSpeed
				};
			
			(RYD_HAS_done)
			};
			
		RYD_HAS_DecisionTime = false;
		//RYD_HAS_Caller removeAction RYD_HAS_aID2;
		//[RYD_HAS_Caller,RYD_HAS_aID2] remoteExec ["removeAction",RYD_HAS_Caller];
		[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myTTLAction",-1])] remoteExec ["removeAction",RYD_HAS_Caller];
		[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myTTLActionB",-1])] remoteExec ["removeAction",RYD_HAS_Caller];
		
		if not (_alive) exitWith 
			{
			deleteVehicle _helipad;
			deleteMarker _i;
			};
			
		if (_unable) exitWith 
			{
			deleteVehicle _helipad;
			deleteMarker _i;
			};	

		if not ((RYD_HAS_FastRoping) or {(RYD_HAS_AlternativeLanding)}) then
			{
			waitUntil 
				{
				sleep 0.1;
				_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
				
				if not (_alive) exitWith {true};
				if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};

				(((getPos RYD_HAS_Chopper) select 2) < _lvl)
				};
			}
		else
			{
			_hG = group RYD_HAS_Chopper;

			 while {(count (waypoints _hG)) > 0} do
				 {
				 deleteWaypoint ((waypoints _hG) select 0);
				 };			
			
			_frc = 0.9;
			waitUntil 
				{
				sleep 0.1;
				_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
				
				if not (_alive) exitWith {true};
				if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};
				
				if (RYD_HAS_FastRoping) then
					{
					[RYD_HAS_Chopper,_minLvl,0,RYD_HAS_clickedPos,2,1] call RYD_HAS_AutoGuide;
					}
				else
					{
					[RYD_HAS_Chopper,0.5,0,RYD_HAS_clickedPos,2,3,_frc] call RYD_HAS_AutoGuideB;
					_frc = (_frc - 0.025) max 0;
					};
				
				((((getPos RYD_HAS_Chopper) select 2) < (_minLvl * 1.1)) and {((RYD_HAS_Chopper distance2D RYD_HAS_clickedPos) < 4)})
				};
				
							
			if not (_alive) exitWith {};	
			if (_unable) exitWith {};
			};
		
		if not (_alive) exitWith 
			{
			deleteVehicle _helipad;
			deleteMarker _i;
			};
			
		if (_unable) exitWith 
			{
			deleteVehicle _helipad;
			deleteMarker _i;
			};
		
		if (RYD_HAS_VoiceChat) then
			{
			(driver RYD_HAS_Chopper) kbTell [RYD_HAS_Caller, "BIS_SUPP_protocol", "Transport_Accomplished", ""]
			};
			
		RYD_HAS_FR_OK = -1;
		if (RYD_HAS_FastRoping) then
			{
			[RYD_HAS_Chopper,RYD_HAS_STT] spawn RYD_HAS_FastRope;
			}
		else
			{
			if ((RYD_HAS_AutoInOut) or {RYD_HAS_AlternativeLanding}) then
				{
				[] call RYD_HAS_AutoDisembark
				};
			};

		_frc = 0.9;
		waitUntil 
			{
			sleep 0.1;
				
			_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper) and {((RYD_HAS_FR_OK == -1) or {(not (RYD_HAS_FR_OK == 2))})}};
			
			if not (_alive) exitWith {true};
			if (not ([] call RYD_HAS_ifChopperReady) or {(RYD_HAS_FR_OK == 3)}) exitWith {_unable = true;true};
			
			if (((toLower (landResult RYD_HAS_Chopper)) in ["found"]) and {not (RYD_HAS_FastRoping)}) then
				{
				[] call RYD_HAS_AscentCounter
				};
				
			if (RYD_HAS_FastRoping) then
				{
				[RYD_HAS_Chopper,_minLvl,0,RYD_HAS_clickedPos,2,1] call RYD_HAS_AutoGuide
				}
			else
				{
				if (RYD_HAS_AlternativeLanding) then
					{
					[RYD_HAS_Chopper,0.5,0,RYD_HAS_clickedPos,2,3,_frc] call RYD_HAS_AutoGuideB;
					_frc = (_frc - 0.025) max 0;
					};
				};

			((({((alive _x) and {_x in RYD_HAS_Chopper})} count RYD_HAS_STT) == 0) and {(not(RYD_HAS_FastRoping) or {(RYD_HAS_FR_OK == 1)})})
			};
			
		deleteVehicle _helipad;
		deleteMarker _i;
				
		_hG = group RYD_HAS_Chopper;
		 while {(count (waypoints _hG)) > 0} do
			 {
			 deleteWaypoint ((waypoints _hG) select 0);
			 };
			
		if not (_alive) exitWith {};
		if (_unable) exitWith {};
		
		if not (RYD_HAS_VoiceChat) then
			{
			_txt = selectRandom RYD_HAS_sent_Accomplished;
			//(driver RYD_HAS_Chopper) customChat [RYD_HAS_PilotChannel,_txt];
			[(driver RYD_HAS_Chopper),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
			if (true) then//if (player in RYD_HAS_STT) then
				{
				//playSound "TacticalPing3";
				"TacticalPing3" remoteExec ["playSound",RYD_HAS_Caller];
				}			
			};		
		}
	else
		{
		RYD_HAS_DecisionTime = false;
		//["RYD_HAS_HeliT","onMapSingleClick","RYD_HAS_MapPoint"] call BIS_fnc_addStackedEventHandler;
		/*RYD_HAS_ForcedPos = _dropPos;
		publicVariable "RYD_HAS_ForcedPos";

		[["RYD_HAS_HeliT","onMapSingleClick","RYD_HAS_MapPoint"],BIS_fnc_addStackedEventHandler] remoteExec ["call",RYD_HAS_Caller];
		//openMap true;
		true remoteExec ["openMap",RYD_HAS_Caller];
		["HelpLayer",["shift+LMB: new route navpoint\nalt+LMB: clear all navpoints\nLMB: ends route planning","PLAIN DOWN"]] remoteExec ["cutText",RYD_HAS_Caller];
		
		RYD_HAS_clickedPos = [];
				
		waitUntil
			{
			sleep 0.1;
			_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
			if not (_alive) exitWith {true};
			if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};
			
			if (RYD_HAS_AlternativeLanding) then
				{
				[RYD_HAS_Chopper,0.5,0,_pickPos,2,2.5,0] call RYD_HAS_AutoGuideB
				};

			((count RYD_HAS_clickedPos) > 1)						
			};

		//["RYD_HAS_HeliT", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
		[["RYD_HAS_HeliT", "onMapSingleClick"],BIS_fnc_removeStackedEventHandler] remoteExec ["call",RYD_HAS_Caller];
		if not (_alive) exitWith 
			{
			RYD_HAS_DecisionTime = false;
			//RYD_HAS_Caller removeAction RYD_HAS_aID2;
			//[RYD_HAS_Caller,RYD_HAS_aID2] remoteExec ["removeAction",RYD_HAS_Caller];
			[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myTTLAction",-1])] remoteExec ["removeAction",RYD_HAS_Caller];
			[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myTTLActionB",-1])] remoteExec ["removeAction",RYD_HAS_Caller];			
			'Route planning cancelled.' remoteExec ['hint'];
			};	
			
		if (_unable) exitWith 
			{
			RYD_HAS_DecisionTime = false;
			//RYD_HAS_Caller removeAction RYD_HAS_aID2;
			//[RYD_HAS_Caller,RYD_HAS_aID2] remoteExec ["removeAction",RYD_HAS_Caller];
			[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myTTLAction",-1])] remoteExec ["removeAction",RYD_HAS_Caller];
			[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myTTLActionB",-1])] remoteExec ["removeAction",RYD_HAS_Caller];			
			'Route planning cancelled.' remoteExec ['hint'];
			};	*/	

		//RYD_HAS_Caller removeAction RYD_HAS_aID2;
		//[RYD_HAS_Caller,RYD_HAS_aID2] remoteExec ["removeAction",RYD_HAS_Caller];
		[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myTTLAction",-1])] remoteExec ["removeAction",RYD_HAS_Caller];
		[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myTTLActionB",-1])] remoteExec ["removeAction",RYD_HAS_Caller];		
		
		if (RYD_HAS_VoiceChat) then
			{
			(driver RYD_HAS_Chopper) kbTell [RYD_HAS_Caller, "BIS_SUPP_protocol", "Transport_LZ_Selected", ""];
			}
		else
			{
			_txt = selectRandom RYD_HAS_sent_LZSelected;
			//(driver RYD_HAS_Chopper) customChat [RYD_HAS_PilotChannel,_txt];
			[(driver RYD_HAS_Chopper),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
			};
		};
		
	if not (_alive) exitWith
		{
		[] call RYD_HAS_atDestroy
		};
		
	if (_unable) exitWith 
		{
		//hint "Unable to complete airlift. Exiting call.";
		"Unable to complete airlift. Exiting call." remoteExec ["hint"];
		[] call RYD_HAS_HeliRTB
		};

	if not (RYD_HAS_FastReady) then
		{
		_wps = [RYD_HAS_Chopper,[(group RYD_HAS_Chopper),-1],true,true] call RYD_HAS_ExecuteRoute;	
		RYD_HAS_done = false;	

		_wp3 = group RYD_HAS_Chopper addWaypoint [_dropPos, 50];
		_wp3 setWaypointType "MOVE";
		_wp3 setWaypointStatements ["true", "RYD_HAS_done = true;"];

		RYD_HAS_Returned = false;
		_wp4 = group RYD_HAS_Chopper addWaypoint [(waypointPosition _wp3),0];
		_wp4 setWaypointType "MOVE";
		_wp4 setWaypointStatements ["true", "RYD_HAS_Chopper land 'land';(group this) setBehaviour RYD_HAS_oldBeh;(group this) setCombatMode RYD_HAS_oldCM;"];
		
		waitUntil
			{
			sleep 0.1;
			_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
			
			if not (_alive) exitWith {true};
			if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};

			if not (RYD_HAS_CruisingSpeed < 10) then
				{
				[RYD_HAS_Chopper] call RYD_HAS_TurningSpeed
				};		
			
			(RYD_HAS_done)
			};
		};
		
	if not (_alive) exitWith
		{
		[] call RYD_HAS_atDestroy
		};
		
	if (_unable) exitWith 
		{
		//hint "Unable to complete airlift. Exiting call.";
		"Unable to complete airlift. Exiting call." remoteExec ["hint"];
		[] call RYD_HAS_HeliRTB
		};
	
	if not (RYD_HAS_FastReady) then
		{
		if not (RYD_HAS_Map) then
			{		
			waitUntil 
				{
				sleep 0.1;
				_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
				
				if not (_alive) exitWith {true};
				if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};
				(((getPos RYD_HAS_Chopper) select 2) < _lvl)
				};
				
			if not (_alive) exitWith {};
			if (_unable) exitWith {};
				
			if (RYD_HAS_VoiceChat) then
				{	
				(driver RYD_HAS_Chopper) kbTell [RYD_HAS_Caller, "BIS_SUPP_protocol", "Transport_Accomplished", ""];
				};
				
			if (RYD_HAS_AutoInOut) then
				{
				[] call RYD_HAS_AutoDisembark
				};			
			};
		};
		
	if not (_alive) exitWith
		{
		[] call RYD_HAS_atDestroy
		};
		
	if (_unable) exitWith 
		{
		//hint "Unable to complete airlift. Exiting call.";
		"Unable to complete airlift. Exiting call." remoteExec ["hint"];
		[] call RYD_HAS_HeliRTB
		};

	if not (RYD_HAS_FastReady) then
		{
		waitUntil 
			{
			sleep 0.1;
			_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
			
			if not (_alive) exitWith {true};
			if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};
			if ((toLower (landResult RYD_HAS_Chopper)) in ["found"]) then
				{
				[] call RYD_HAS_AscentCounter
				};

			((isTouchingGround RYD_HAS_Chopper) and {(({((alive _x) and {_x in RYD_HAS_Chopper})} count RYD_HAS_STT) == 0)})
			};
		};
	
	if not (_alive) exitWith
		{
		[] call RYD_HAS_atDestroy
		};
		
	if (_unable) exitWith 
		{
		//hint "Unable to complete airlift. Exiting call.";
		"Unable to complete airlift. Exiting call." remoteExec ["hint"];
		[] call RYD_HAS_HeliRTB
		};
	
	if not (RYD_HAS_FastReady) then
		{
		RYD_HAS_Chopper engineOn false;
		};
		
	if (not ((RYD_HAS_Map) or {RYD_HAS_VoiceChat})) then
		{
		_txt = selectRandom RYD_HAS_sent_Accomplished;
		//(driver RYD_HAS_Chopper) customChat [RYD_HAS_PilotChannel,_txt];
		[(driver RYD_HAS_Chopper),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
		if (true) then//if (player in RYD_HAS_STT) then
			{
			//playSound "TacticalPing3";
			"TacticalPing3" remoteExec ["playSound",RYD_HAS_Caller];
			}
		};
	
	if (((RYD_HAS_Limit - RYD_HAS_UseCount) > 0) and {not (RYD_HAS_Limit < 0)}) then
		{
		//hint format ["Chopper available, %1 calls left.",(RYD_HAS_Limit - RYD_HAS_UseCount)];
		(format ["Chopper available, %1 calls left.",(RYD_HAS_Limit - RYD_HAS_UseCount)]) remoteExec ["hint"];
		}
	else
		{
		if not (RYD_HAS_Limit < 0) then
			{
			if (RYD_HAS_RemoveAtLimit) then
				{
					{
					//_x removeAction (_x getVariable ["RYD_HAS_myCallAction",-1]);
					[_x,(_x getVariable ["RYD_HAS_myCallAction",-1])] remoteExec ["removeAction",_x];
					//_x removeAction (_x getVariable ["RYD_HAS_myCallAction2",-1]);
					[_x,(_x getVariable ["RYD_HAS_myCallAction2",-1])] remoteExec ["removeAction",_x];
					//_x removeAction (_x getVariable ["RYD_HAS_myCallCancelAction",-1]);
					[_x,(_x getVariable ["RYD_HAS_myCallCancelAction",-1])] remoteExec ["removeAction",_x];
					//_x removeAction (_x getVariable ["RYD_HAS_myCeiligUpAction50",-1]);
					[_x,(_x getVariable ["RYD_HAS_myCeiligUpAction50",-1])] remoteExec ["removeAction",_x];
					//_x removeAction (_x getVariable ["RYD_HAS_myCeiligDownAction50",-1]);
					[_x,(_x getVariable ["RYD_HAS_myCeiligDownAction50",-1])] remoteExec ["removeAction",_x];
					//_x removeAction (_x getVariable ["RYD_HAS_myCeiligUpAction250",-1]);
					[_x,(_x getVariable ["RYD_HAS_myCeiligUpAction250",-1])] remoteExec ["removeAction",_x];
					//_x removeAction (_x getVariable ["RYD_HAS_myCeiligDownAction250",-1]);
					[_x,(_x getVariable ["RYD_HAS_myCeiligDownAction250",-1])] remoteExec ["removeAction",_x];
					}
				foreach RYD_HAS_STT
				};
				
			//hint "Transport support completed. No more calls left!"
			"Transport support completed. No more calls left!" remoteExec ["hint"];
			}
		};
	
	if not (RYD_HAS_FastReady) then
		{
		_hG = group RYD_HAS_Chopper;

		 while {(count (waypoints _hG)) > 0} do
			 {
			 deleteWaypoint ((waypoints _hG) select 0);
			 };
			 
		[] call RYD_HAS_ClearRoute;	
		};
	
	RYD_HAS_Caller removeMPEventHandler ["MPKilled",RYD_HAS_kEHIx];
	removeMissionEventHandler ["HandleDisconnect",RYD_HAS_dEHIx];
	RYD_HAS_wasCalled = false; publicVariable "RYD_HAS_wasCalled";
	RYD_HAS_radioCalled = false; publicVariable "RYD_HAS_radioCalled";
	
	if (RYD_HAS_FastReady) then
		{
		_wps = [RYD_HAS_Chopper,[(group RYD_HAS_Chopper),-1],true,true] call RYD_HAS_ExecuteRoute;	
		RYD_HAS_done = false;	

		_wp3 = group RYD_HAS_Chopper addWaypoint [_dropPos, 50];
		_wp3 setWaypointType "MOVE";
		_wp3 setWaypointStatements ["true", "RYD_HAS_done = true;"];

		RYD_HAS_Returned = false;
		_wp4 = group RYD_HAS_Chopper addWaypoint [(waypointPosition _wp3),0];
		_wp4 setWaypointType "MOVE";
		_wp4 setWaypointStatements ["true", "RYD_HAS_Chopper land 'land';(group this) setBehaviour RYD_HAS_oldBeh;(group this) setCombatMode RYD_HAS_oldCM;"];
		
		waitUntil
			{
			sleep 0.1;
			_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
			
			if not (_alive) exitWith {true};
			if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};

			if not (RYD_HAS_CruisingSpeed < 10) then
				{
				[RYD_HAS_Chopper] call RYD_HAS_TurningSpeed
				};		
			
			((RYD_HAS_done) or {(RYD_HAS_wasCalled)})
			};
	
		if (not (_alive) or {(_unable)}) exitWith {};
		if (RYD_HAS_wasCalled) exitWith {};

		if not (RYD_HAS_Map) then
			{		
			waitUntil 
				{
				sleep 0.1;
				_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
				
				if not (_alive) exitWith {true};
				if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};
				((((getPos RYD_HAS_Chopper) select 2) < _lvl) or {(RYD_HAS_wasCalled)})
				};
	
			if not (_alive) exitWith {};
			if (_unable) exitWith {};
			if (RYD_HAS_wasCalled) exitWith {};
				
			if (RYD_HAS_VoiceChat) then
				{	
				(driver RYD_HAS_Chopper) kbTell [RYD_HAS_Caller, "BIS_SUPP_protocol", "Transport_Accomplished", ""];
				};
				
			if (RYD_HAS_AutoInOut) then
				{
				[] call RYD_HAS_AutoDisembark
				};			
			};	

		waitUntil 
			{
			sleep 0.1;
			_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
			
			if not (_alive) exitWith {true};
			if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};
			if ((toLower (landResult RYD_HAS_Chopper)) in ["found"]) then
				{
				[] call RYD_HAS_AscentCounter
				};

			(((isTouchingGround RYD_HAS_Chopper) and {(({((alive _x) and {_x in RYD_HAS_Chopper})} count RYD_HAS_STT) == 0)}) or {(RYD_HAS_wasCalled)})
			};

		if not (_alive) exitWith {};
		if (_unable) exitWith {};
		if (RYD_HAS_wasCalled) exitWith {};	

		RYD_HAS_Chopper engineOn false;
		
		_hG = group RYD_HAS_Chopper;

		 while {(count (waypoints _hG)) > 0} do
			 {
			 deleteWaypoint ((waypoints _hG) select 0);
			 };
			 
		[] call RYD_HAS_ClearRoute;	
		RYD_HAS_wasCalledFast = false; publicVariable "RYD_HAS_wasCalledFast";
		}
	else
		{
		RYD_HAS_wasCalledFast = false; publicVariable "RYD_HAS_wasCalledFast";
		}
	};
	
publicVariable "RYD_HAS_atCalled";
	
RYD_HAS_SupplyCall = 
	{
	params ["_heli","_dropPos","_box"];
	private ["_lzMark","_manualPos","_cPos","_rds","_gp","_alive","_unable","_nextPos","_wp","_dst1","_dst2","_sl","_bb","_sizeZ","_p1","_l1","_l2","_p2","_cnt","_lvl","_rope","_wpPos","_type"];
	
	RYD_HAS_delivered = false;
	publicVariable "RYD_HAS_delivered";
		
	_uName = if (RYD_HAS_CallerName isEqualTo "") then
		{
		((toLower (rank RYD_HAS_Caller)) + " " + (name RYD_HAS_Caller))
		}
	else
		{
		RYD_HAS_CallerName
		};
		
	_txt = format [(selectRandom RYD_HAS_sent_Request_sc),_uName];
	//RYD_HAS_Caller customChat [RYD_HAS_CallerChannel,_txt];
	[RYD_HAS_Caller,[RYD_HAS_CallerChannel,_txt]] remoteExec ["customChat"];
	if (true) then//if (player in RYD_HAS_STT) then
		{
		//playSound "TacticalPing2";
		"TacticalPing2" remoteExec ["playSound",RYD_HAS_Caller];
		};
			
	_lzMark = "";
	_pos = _heli modelToWorld [0,80,0];
	
	if ((_box getVariable ["RYD_HAS_wasSpawned",false]) or {((_box distance2D _heli) < 80)}) then
		{
		if (isNil {(_heli getVariable "RYD_HAS_myBoxPos")}) then
			{
			_manualPos = false;

				{
				if ((_x select 0) isEqualTo _heli) exitWith
					{
					_pos = (_x select 0) modelToWorld (_x select 1);
					_manualPos = true;
					}
				}
			foreach RYD_HAS_SupplyCall_ContainerPositions;
			
			if not (_manualPos) then
				{
				_cPos = _pos isFlatEmpty [5, -1, 1, 5, 0, false, objNull];
				_rds = 50;
				while {((count _cPos) < 2)} do
					{
					_rds = _rds + 5;
					_cPos = _heli modelToWorld [0,_rds,0];
					//if (surfaceIsWater _cPos) exitWith {};
					_cPos = [_cPos, 0, _rds/5, 5, 0, 0.3, 0,[],[[-1,-1],[-1,-1]]] call BIS_fnc_findSafePos;
					if (_rds > 250) exitWith {};
					};
				
				if (((count _cPos) > 1) and {not (_cPos isEqualTo [-1,-1])}) then
					{
					_pos = _cPos
					}
				};
				
			_pos set [2,0.01];
			_heli setVariable ["RYD_HAS_myBoxPos",_pos];
			}
		else
			{
			_pos = _heli getVariable ["RYD_HAS_myBoxPos",_pos];
			};
			
		_box setPos _pos;
		};
		
	_box hideObjectGlobal false;
	
	if ((_box distance2D _dropPos) < 200) exitWith
		{
		sleep 5;
		RYD_HAS_canCancel = false; publicVariable "RYD_HAS_canCancel";
		RYD_HAS_CallCancelled = false;
		RYD_HAS_box allowDamage true;
		//hintSilent format ["Supplies located %1 meters from you, azimuth: %2",round (_box distance2D _dropPos),round (_dropPos getDir _box)];
		(format ["Supplies located %1 meters from you, azimuth: %2",round (_box distance2D _dropPos),round (_dropPos getDir _box)]) remoteExec ["hint"];
		
		_lzMark = "LZ_mark";
		_lzMark = createMarker [_lzMark,(position RYD_HAS_box)];
		_lzMark setMarkerColor "ColorBlue";
		_lzMark setMarkerShape "ICON";
		_lzMark setMarkerType "mil_end";
		_lzMark setMarkerSize [0.75,0.75];
		
		[_lzMark] spawn
			{
			params ["_lzMark"];
			
			sleep 15;
			deleteMarker _lzMark;
			if (((RYD_HAS_Limit - RYD_HAS_UseCount) > 0) and {not (RYD_HAS_Limit < 0)}) then
				{
				//hint format ["Chopper available, %1 calls left.",(RYD_HAS_Limit - RYD_HAS_UseCount)];
				(format ["Chopper available, %1 calls left.",(RYD_HAS_Limit - RYD_HAS_UseCount)]) remoteExec ["hint"];
				}
			else
				{
				if not (RYD_HAS_Limit < 0) then
					{
					if (RYD_HAS_RemoveAtLimit) then
						{
							{
							//_x removeAction (_x getVariable ["RYD_HAS_myCallAction",-1]);
							[_x,(_x getVariable ["RYD_HAS_myCallAction",-1])] remoteExec ["removeAction",_x];
							//_x removeAction (_x getVariable ["RYD_HAS_myCallAction2",-1]);
							[_x,(_x getVariable ["RYD_HAS_myCallAction2",-1])] remoteExec ["removeAction",_x];
							//_x removeAction (_x getVariable ["RYD_HAS_myCallCancelAction",-1]);
							[_x,(_x getVariable ["RYD_HAS_myCallCancelAction",-1])] remoteExec ["removeAction",_x];
							//_x removeAction (_x getVariable ["RYD_HAS_myCeiligUpAction50",-1]);
							[_x,(_x getVariable ["RYD_HAS_myCeiligUpAction50",-1])] remoteExec ["removeAction",_x];
							//_x removeAction (_x getVariable ["RYD_HAS_myCeiligDownAction50",-1]);
							[_x,(_x getVariable ["RYD_HAS_myCeiligDownAction50",-1])] remoteExec ["removeAction",_x];
							//_x removeAction (_x getVariable ["RYD_HAS_myCeiligUpAction250",-1]);
							[_x,(_x getVariable ["RYD_HAS_myCeiligUpAction250",-1])] remoteExec ["removeAction",_x];
							//_x removeAction (_x getVariable ["RYD_HAS_myCeiligDownAction250",-1]);
							[_x,(_x getVariable ["RYD_HAS_myCeiligDownAction250",-1])] remoteExec ["removeAction",_x];
							}
						foreach RYD_HAS_STT
						};
						
					//hint "Transport support completed. No more calls left!"
					"Transport support completed. No more calls left!" remoteExec ["hint"];
					}
				};
			
			[] call RYD_HAS_ClearRoute;
			RYD_HAS_wasCalled = false; publicVariable "RYD_HAS_wasCalled";
			RYD_HAS_wasCalledFast = false; publicVariable "RYD_HAS_wasCalledFast";
			RYD_HAS_radioCalled = false; publicVariable "RYD_HAS_radioCalled";	
			}
		};
	
	_gp = group _heli;
	_alive = true;
	_unable = false;
	_lvl = 10;
	
	sleep 4;
	if ((isNull RYD_HAS_Chopper) or {not (alive RYD_HAS_Chopper) or {(isNull (driver RYD_HAS_Chopper)) or {not (alive (driver RYD_HAS_Chopper)) or {not (canMove RYD_HAS_Chopper)}}}}) exitWith//if not ((alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)}) exitWith
		{
		[] call RYD_HAS_atDestroy
		};
		
	if (RYD_HAS_CallCancelled) exitWith
		{
		deleteMarker _lzMark;
		//deleteVehicle _helipad;	
		RYD_HAS_canCancel = false; publicVariable "RYD_HAS_canCancel";
		RYD_HAS_CallCancelled = false;

		_uName = if (RYD_HAS_CallerName isEqualTo "") then
			{
			((toLower (rank RYD_HAS_Caller)) + " " + (name RYD_HAS_Caller))
			}
		else
			{
			RYD_HAS_CallerName
			};
			
		_txt = format [(selectRandom RYD_HAS_sent_AirliftCancelled_sc),_uName];
		//RYD_HAS_Caller customChat [RYD_HAS_CallerChannel,_txt];
		[RYD_HAS_Caller,[RYD_HAS_CallerChannel,_txt]] remoteExec ["customChat"];
		if (true) then//if (player in RYD_HAS_STT) then
			{
			//playSound "TacticalPing2";
			"TacticalPing2" remoteExec ["playSound",RYD_HAS_Caller];
			};

		sleep (3 + (random 2));
		
		_txt = selectRandom RYD_HAS_sent_AirliftCancelledConf_sc;
		//(driver _heli) customChat [RYD_HAS_PilotChannel,_txt];
		[(driver _heli),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
		if (true) then//if (player in RYD_HAS_STT) then
			{
			//playSound "TacticalPing3";
			"TacticalPing3" remoteExec ["playSound",RYD_HAS_Caller];
			};
			
		[] call RYD_HAS_HeliRTB
		};
		
	_txt = selectRandom RYD_HAS_sent_Confirmation_sc;
	//RYD_HAS_Base customChat [RYD_HAS_HQChannel,_txt];
	[RYD_HAS_Base,[RYD_HAS_HQChannel,_txt]] remoteExec ["customChat"];
	if (true) then//if (player in RYD_HAS_STT) then
		{
		//playSound "TacticalPing4";
		"TacticalPing4" remoteExec ["playSound",RYD_HAS_Caller];
		};
		
	_signalClasses = if ([] call RYD_HAS_isDaylight) then
		{
		RYD_HAS_SignalClassesDay
		}
	else
		{
		RYD_HAS_SignalClassesNight
		};

	if (not (RYD_HAS_SupplyDrop_onMapClick) and {((count _signalClasses) < 1)}) then
		{
		_lzMark = "LZ_mark";
		_lzMark = createMarker [_lzMark,_dropPos];
		_lzMark setMarkerColor "ColorBlue";
		_lzMark setMarkerShape "ICON";
		_lzMark setMarkerType "mil_end";
		_lzMark setMarkerSize [0.75,0.75];	
		};		

	if not (RYD_HAS_SupplyDrop_SlingLoad) then
		{
		//_box setPosASL [0,0,2500];
		_box hideObjectGlobal true;
		_box enableSimulationGlobal false;
		_dst1 = _heli distance2D _dropPos;

		_heli flyInHeight (100 max RYD_HAS_ChopperLvl);
		_heli setVariable ["RYD_HAS_myLvl",(100 max RYD_HAS_ChopperLvl)];
		
		if not (RYD_HAS_SupplyDrop_onMapClick) then
			{
			_dropPos = [_signalClasses,_dropPos,false,200] call RYD_HAS_Signal;
				
			if not (_alive) exitWith {};
			if (_unable) exitWith {};
			if (RYD_HAS_CallCancelled) exitWith {};
			
			_lzMark = "LZ_mark";
			_lzMark = createMarker [_lzMark,_dropPos];
			_lzMark setMarkerColor "ColorBlue";
			_lzMark setMarkerShape "ICON";
			_lzMark setMarkerType "mil_end";
			_lzMark setMarkerSize [0.75,0.75];
			}
		else
			{
			_wps = [RYD_HAS_Chopper] call RYD_HAS_ExecuteRoute;
			_wp = group RYD_HAS_Chopper addWaypoint [_dropPos, 300];
			_wp setWaypointType "MOVE";
			
			_wp = _gp addWaypoint [(waypointPosition _wp), 0];
			_wp setWaypointType "LOITER";
			_wp setWaypointLoiterType "CIRCLE";
			_wp setWaypointLoiterRadius 200;
					
			waitUntil
				{
				sleep 1;
				_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
				if not (_alive) exitWith {true};	
				if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};	
				if (RYD_HAS_CallCancelled) exitWith {true};
				
				(((RYD_HAS_Chopper distance2D _dropPos) < RYD_HAS_SignReqDst) and {(currentWaypoint _gp) isEqualTo (((waypoints _gp) select (((count (waypoints _gp)) - 1) max 0)) select 1)})
				};
				
			if not (_alive) exitWith {};
			if (_unable) exitWith {};
			if (RYD_HAS_CallCancelled) exitWith {};	
			
			//["RYD_HAS_HeliT","onMapSingleClick","RYD_HAS_MapPoint"] call BIS_fnc_addStackedEventHandler;
			RYD_HAS_noRoute = true;
			publicVariable "RYD_HAS_noRoute";
			[["RYD_HAS_HeliT","onMapSingleClick","RYD_HAS_MapPoint"],BIS_fnc_addStackedEventHandler] remoteExec ["call",RYD_HAS_Caller];
			//openMap true;
			true remoteExec ["openMap",RYD_HAS_Caller];
			//["HelpLayer",["shift+LMB: new route navpoint\nalt+LMB: clear all navpoints\nLMB: final coordinates (ends route planning)","PLAIN DOWN"]] remoteExec ["cutText",RYD_HAS_Caller];
			
			RYD_HAS_clickedPos = [];	
			
			RYD_HAS_tooLong = false;
			
			[] spawn
				{
				_tStamp = time;
				while {not RYD_HAS_tooLong} do
					{
					sleep 0.1;
					_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
					if not (_alive) exitWith {};	
					if not ([] call RYD_HAS_ifChopperReady) exitWith {};
					if (RYD_HAS_CallCancelled) exitWith {};
					
					if (not ((count RYD_HAS_clickedPos) < 2)) exitWith
						{
						RYD_HAS_PickPos = RYD_HAS_clickedPos;
						RYD_HAS_wasSignal = true;
						};
					
					if (RYD_HAS_signalTimeLimit > 0) then
						{
						RYD_HAS_tooLong = ((time - _tStamp) > RYD_HAS_signalTimeLimit)
						}
					};
				};				
			
			if (RYD_HAS_AddHints) then
				{
				//Hint "Chopper is approaching. Mark your position!";
				"Chopper is approaching. Mark your position!" remoteExec ["hint"];
				};

			_txt = selectRandom RYD_HAS_sent_SignalReq_sc;
			
			//(driver RYD_HAS_Chopper) customChat [RYD_HAS_PilotChannel,_txt];
			[(driver _heli),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
			if (true) then//if (player in RYD_HAS_STT) then
				{
				//playSound "TacticalPing3";
				"TacticalPing3" remoteExec ["playSound",RYD_HAS_Caller];
				};
									
			waitUntil
				{
				sleep 0.1;
				_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
				if not (_alive) exitWith {true};
				if (not ([] call RYD_HAS_ifChopperReady) or {RYD_HAS_tooLong}) exitWith {_unable = true;true};
				if (RYD_HAS_CallCancelled) exitWith {true};
				
				(RYD_HAS_wasSignal)
				};
				
			RYD_HAS_wasSignal = false;
			//["RYD_HAS_HeliT", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
			[["RYD_HAS_HeliT", "onMapSingleClick"],BIS_fnc_removeStackedEventHandler] remoteExec ["call",RYD_HAS_Caller];
						
			if not (_alive) exitWith {};	
			if (_unable) exitWith {};
			if (RYD_HAS_CallCancelled) exitWith {};
			
			_dropPos = RYD_HAS_clickedPos;

			_lzMark = "LZ_mark";
			_lzMark = createMarker [_lzMark,_dropPos];
			_lzMark setMarkerColor "ColorBlue";
			_lzMark setMarkerShape "ICON";
			_lzMark setMarkerType "mil_end";
			_lzMark setMarkerSize [0.75,0.75];	

			sleep 2;
			
			//openMap false;
			false remoteExec ["openMap",RYD_HAS_Caller];
			
			sleep (8 + (random 5));
			
			if ((isNull RYD_HAS_Chopper) or {not (alive RYD_HAS_Chopper) or {(isNull (driver RYD_HAS_Chopper)) or {not (alive (driver RYD_HAS_Chopper)) or {not (canMove RYD_HAS_Chopper)}}}}) exitWith//if not ((alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)}) exitWith
				{
				_alive = false;
				};
				
			_unable = not ([] call RYD_HAS_ifChopperReady);
			if (_unable) exitWith {};
			if (RYD_HAS_CallCancelled) exitWith {};
				
			_txt = selectRandom RYD_HAS_sent_SignalSpot_sc;
			//(driver RYD_HAS_Chopper) customChat [RYD_HAS_PilotChannel,_txt];
			[(driver _heli),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
			if (true) then//if (player in RYD_HAS_STT) then
				{
				//playSound "TacticalPing3";
				"TacticalPing3" remoteExec ["playSound",RYD_HAS_Caller];
				};			
			};
			
		if not (_alive) exitWith {};
		if (_unable) exitWith {};
		if (RYD_HAS_CallCancelled) exitWith {};
		
		_nextPos = _heli getPos [((_heli distance2D _dropPos) + 300),_heli getDir _dropPos];
		
		RYD_HAS_done = false;
		_wp = _gp addWaypoint [_nextPos, 50];
		_wp setWaypointType "MOVE";
		_wp setWaypointStatements ["true", "RYD_HAS_done = true;"];
		group _heli setCurrentWaypoint _wp;		
					
		waitUntil
			{
			sleep 1;
			_alive = (alive _heli) and {(canMove _heli)};
			if not (_alive) exitWith {true};
			if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};	
			if (RYD_HAS_CallCancelled) exitWith {true};			
			_dst2 = _heli distance2D _nextPos;
			
			if not (RYD_HAS_CruisingSpeed < 10) then
				{
				[RYD_HAS_Chopper] call RYD_HAS_TurningSpeed
				};
			
			(((_dst2 < 300) and {(((getPos _heli) select 2) > 10)}) or {(RYD_HAS_done)})
			};
			
		if not (_alive) exitWith {};
		if (_unable) exitWith {};
		if (RYD_HAS_CallCancelled) exitWith {};
		RYD_HAS_canCancel = false; publicVariable "RYD_HAS_canCancel";
						
		[_heli,_box,_lzMark] spawn RYD_HAS_SupplyDrop;
		}
	else
		{		
		RYD_HAS_done = false;
		_wp = (group _heli) addWaypoint [(position _box), 0,0];	
		_wp setWaypointType "HOOK";
		_wp waypointAttachObject _box;
		_wp setWaypointStatements ["true", "RYD_HAS_done = true;RYD_HAS_Hooked = true; publicVariable 'RYD_HAS_Hooked';"];

		if not (_heli canSlingLoad _box) then
			{
			_sl = configFile >> "CfgVehicles" >> (typeOf _heli) >> "slingLoadMemoryPoint";
			
			if (isText _sl) then
				{
				_sl = getText _sl
				}
			else
				{
				_sl = [0,0,-2]
				};
				
			_bb = boundingBox _box;
			_sizeZ = (((((_bb select 1) select 2) - ((_bb select 0) select 2)) * 3) max 5) min 12;
			_p1 = (getPosATL _heli);
			_l1 = _p1 select 2;
			_l2 = _p1 select 2; 
			_p2 = (getPosATL _box); 
			_cnt = 0;
				
			waitUntil
				{						
				_alive = (alive _heli) and {(canMove _heli)};
				if not (_alive) exitWith {true};
				if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};	
				if (RYD_HAS_CallCancelled) exitWith {true};					

				if (((velocity _heli) distance [0,0,0]) < 0.1) then
					{
					_cnt = _cnt + 0.01
					};
					
				if (_cnt > 60) exitWith {_unable = true};
				
				_p1 = (getPosATL _heli);
				_l1 = _p1 select 2; 
				sleep 0.1;
				_p1 = (getPosATL _heli);
				_l2 = _p1 select 2; 
				_p2 = (getPosATL _box);
				
				_p1 set [2,0];
				_p2 set [2,0];
							
				(((_p1 distance _p2) < 10) and {(_l2 > 10) and {(_l1 > _l2)}})
				};
				
			deleteWaypoint _wp;	
			if not (_alive) exitWith {};
			if (_unable) exitWith {};
			if (RYD_HAS_CallCancelled) exitWith {};
							
			_heli flyInHeight (_sizeZ max 35);
			_heli setVariable ["RYD_HAS_myLvl",_sizeZ];
			
			_cnt = 0;
				
			waitUntil
				{						
				_alive = (alive _heli) and {(canMove _heli)};
				if not (_alive) exitWith {true};
				if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};	
				if (RYD_HAS_CallCancelled) exitWith {true};

				if (((velocity _heli) distance [0,0,0]) < 0.1) then
					{
					_cnt = _cnt + 0.01
					};
					
				if (_cnt > 60) exitWith {_alive = false};
				
				_l1 = (getPosATL _heli) select 2; 
				sleep 0.01;
				_l2 = (getPosATL _heli) select 2; 
							
				(_l1 < ((_sizeZ + 1) max 15))
				};

			if not (_alive) exitWith {};
			if (_unable) exitWith {};
			if (RYD_HAS_CallCancelled) exitWith {};				

			_lvl = (_heli distance _box) + 1;
			_rope = ropeCreate [_heli, _sl, _box, [0, 0, 0],_lvl];
			
			[_box,[0,0,0.5],[0,0,-1]] ropeAttachTo _rope;
			RYD_HAS_done = true;
			};
			
		if not (_alive) exitWith {};
		if (_unable) exitWith {};
		if (RYD_HAS_CallCancelled) exitWith {};
		
		_heli flyInHeight (35 max RYD_HAS_ChopperLvl);
		_heli setVariable ["RYD_HAS_myLvl",(35 max RYD_HAS_ChopperLvl)];
		
		if not (RYD_HAS_SupplyDrop_onMapClick) then
			{
			_dropPos = [_signalClasses,_dropPos,false,200] call RYD_HAS_Signal;
				
			if not (_alive) exitWith {};
			if (_unable) exitWith {};
			if (RYD_HAS_CallCancelled) exitWith {};
			
			_lzMark = "LZ_mark";
			_lzMark = createMarker [_lzMark,_dropPos];
			_lzMark setMarkerColor "ColorBlue";
			_lzMark setMarkerShape "ICON";
			_lzMark setMarkerType "mil_end";
			_lzMark setMarkerSize [0.75,0.75];
			
			_nextPos = _heli getPos [((_heli distance2D _dropPos) + 300),_heli getDir _dropPos];
			}
		else
			{
			_wps = [RYD_HAS_Chopper] call RYD_HAS_ExecuteRoute;
			_wp = group RYD_HAS_Chopper addWaypoint [_dropPos, 300];
			_wp setWaypointType "MOVE";
			
			_wp = _gp addWaypoint [(waypointPosition _wp), 0];
			_wp setWaypointType "LOITER";
			_wp setWaypointLoiterType "CIRCLE";
			_wp setWaypointLoiterRadius 200;
				

			waitUntil
				{
				sleep 1;
				_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
				if not (_alive) exitWith {true};	
				if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};	
				if (RYD_HAS_CallCancelled) exitWith {true};
				
				(((RYD_HAS_Chopper distance2D _dropPos) < RYD_HAS_SignReqDst) and {(currentWaypoint _gp) isEqualTo (((waypoints _gp) select (((count (waypoints _gp)) - 1) max 0)) select 1)})
				};
				
			if not (_alive) exitWith {};
			if (_unable) exitWith {};
			if (RYD_HAS_CallCancelled) exitWith {};	

			RYD_HAS_noRoute = true;
			publicVariable "RYD_HAS_noRoute";
			//["RYD_HAS_HeliT","onMapSingleClick","RYD_HAS_MapPoint"] call BIS_fnc_addStackedEventHandler;
			[["RYD_HAS_HeliT","onMapSingleClick","RYD_HAS_MapPoint"],BIS_fnc_addStackedEventHandler] remoteExec ["call",RYD_HAS_Caller];
			//openMap true;
			true remoteExec ["openMap",RYD_HAS_Caller];
			//["HelpLayer",["shift+LMB: new route navpoint\nalt+LMB: clear all navpoints\nLMB: final coordinates (ends route planning)","PLAIN DOWN"]] remoteExec ["cutText",RYD_HAS_Caller];
			
			RYD_HAS_clickedPos = [];
			
			RYD_HAS_tooLong = false;
			
			[] spawn
				{
				_tStamp = time;
				while {not RYD_HAS_tooLong} do
					{
					sleep 0.1;
					_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
					if not (_alive) exitWith {};	
					if not ([] call RYD_HAS_ifChopperReady) exitWith {};
					if (RYD_HAS_CallCancelled) exitWith {};
					
					if (not ((count RYD_HAS_clickedPos) < 2)) exitWith
						{
						RYD_HAS_PickPos = RYD_HAS_clickedPos;
						RYD_HAS_wasSignal = true;
						};
					
					if (RYD_HAS_signalTimeLimit > 0) then
						{
						RYD_HAS_tooLong = ((time - _tStamp) > RYD_HAS_signalTimeLimit)
						}
					};
				};				
			
			if (RYD_HAS_AddHints) then
				{
				//Hint "Chopper is approaching. Mark your position!";
				"Chopper is approaching. Mark your position!" remoteExec ["hint"];
				};

			_txt = selectRandom RYD_HAS_sent_SignalReq_sc;
			
			//(driver RYD_HAS_Chopper) customChat [RYD_HAS_PilotChannel,_txt];
			[(driver _heli),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
			if (true) then//if (player in RYD_HAS_STT) then
				{
				//playSound "TacticalPing3";
				"TacticalPing3" remoteExec ["playSound",RYD_HAS_Caller];
				};
									
			waitUntil
				{
				sleep 0.1;
				_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
				if not (_alive) exitWith {true};
				if (not ([] call RYD_HAS_ifChopperReady) or {RYD_HAS_tooLong}) exitWith {_unable = true;true};
				if (RYD_HAS_CallCancelled) exitWith {true};
				
				(RYD_HAS_wasSignal)
				};
				
			RYD_HAS_wasSignal = false;
			//["RYD_HAS_HeliT", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
			[["RYD_HAS_HeliT", "onMapSingleClick"],BIS_fnc_removeStackedEventHandler] remoteExec ["call",RYD_HAS_Caller];
						
			if not (_alive) exitWith {};	
			if (_unable) exitWith {};
			if (RYD_HAS_CallCancelled) exitWith {};
			
			_dropPos = RYD_HAS_clickedPos;

			_lzMark = "LZ_mark";
			_lzMark = createMarker [_lzMark,_dropPos];
			_lzMark setMarkerColor "ColorBlue";
			_lzMark setMarkerShape "ICON";
			_lzMark setMarkerType "mil_end";
			_lzMark setMarkerSize [0.75,0.75];	
			
			_nextPos = _heli getPos [((_heli distance2D _dropPos) + 300),_heli getDir _dropPos];
			
			sleep 2;
						
			//openMap false;
			false remoteExec ["openMap",RYD_HAS_Caller];
			
			sleep (8 + (random 5));
			
			if ((isNull RYD_HAS_Chopper) or {not (alive RYD_HAS_Chopper) or {(isNull (driver RYD_HAS_Chopper)) or {not (alive (driver RYD_HAS_Chopper)) or {not (canMove RYD_HAS_Chopper)}}}}) exitWith//if not ((alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)}) exitWith
				{
				_alive = false;
				};
				
			_unable = not ([] call RYD_HAS_ifChopperReady);
			if (_unable) exitWith {};
			if (RYD_HAS_CallCancelled) exitWith {};
				
			_txt = selectRandom RYD_HAS_sent_SignalSpot_sc;
			//(driver RYD_HAS_Chopper) customChat [RYD_HAS_PilotChannel,_txt];
			[(driver _heli),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
			if (true) then//if (player in RYD_HAS_STT) then
				{
				//playSound "TacticalPing3";
				"TacticalPing3" remoteExec ["playSound",RYD_HAS_Caller];
				};
			};
		
		waitUntil
			{
			sleep 1;
			_alive = (alive _heli) and {(canMove _heli)};
			if not (_alive) exitWith {true};
			if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};	
			if (RYD_HAS_CallCancelled) exitWith {true};	

			if not (RYD_HAS_CruisingSpeed < 10) then
				{
				[RYD_HAS_Chopper] call RYD_HAS_TurningSpeed
				};		
			
			(RYD_HAS_done)
			};
			
		if not (_alive) exitWith {};
		if (_unable) exitWith {};
		if (RYD_HAS_CallCancelled) exitWith {};
		RYD_HAS_done = false;
		_wpPos = _dropPos;//_dropPos getPos [((_heli distance2D _dropPos) + 80),_heli getDir _dropPos];

		_type = if not (_heli canSlingLoad _box) then
			{
			//_wpPos = _dropPos getPos [((_heli distance2D _dropPos) + 80),_heli getDir _dropPos];
			"MOVE"
			}
		else
			{
			"UNHOOK"
			};
		
		private _wps = [_heli] call RYD_HAS_ExecuteRoute;
		_wp = (group _heli) addWaypoint [_wpPos,0];
		_wp setWaypointType _type;
		_wp setWaypointStatements ["true", "RYD_HAS_done = true;RYD_HAS_delivered = true;publicVariable 'RYD_HAS_delivered';"];
		_wps pushBack _wp;
		group _heli setCurrentWaypoint (_wps select 0);		
			
		_cnt = 0;
				
		waitUntil
			{
			sleep 1;
			_alive = (alive _heli) and {(canMove _heli)};
			if not (_alive) exitWith {true};
			if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};	
			if (RYD_HAS_CallCancelled) exitWith {true};
			
			if not (RYD_HAS_CruisingSpeed < 10) then
				{
				[RYD_HAS_Chopper] call RYD_HAS_TurningSpeed
				};
			
			(RYD_HAS_done)
			};
						
		if not (_alive) exitWith 
			{
			RYD_HAS_box allowDamage true;
			};

		if (_unable) exitWith {};
		if (RYD_HAS_CallCancelled) exitWith {};	
		
		if (not (_heli canSlingLoad _box) or {((count (ropes _heli)) > 0) and {(((getPos RYD_HAS_box) select 2) > 1)}}) then
			{
			_frPosArray = [_dropPos,"",(_lvl + 1)] call RYD_HAS_FindFRpos;
			_minLvl = _frPosArray select 1;			
			
			waitUntil 
				{
				sleep 0.1;
					
				_alive = (alive _heli) and {(canMove _heli)};
				
				if not (_alive) exitWith {true};
				if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};	
				if (RYD_HAS_CallCancelled) exitWith {true};	

				[_heli,_minLvl,0,_dropPos,2,1] call RYD_HAS_AutoGuide;

				(((((getPos _heli) select 2) < (_minLvl * 1.1)) and {((_heli distance2D _dropPos) < 4)}) or {(((getPos RYD_HAS_box) select 2) < 0.25)})
				};
			
			RYD_HAS_box allowDamage true;
			if not (_alive) exitWith {};
			if (_unable) exitWith {};
			if (RYD_HAS_CallCancelled) exitWith {};	
			RYD_HAS_canCancel = false; publicVariable "RYD_HAS_canCancel";
			
				{
				_heli ropeDetach _x;
				ropeDestroy _x;
				}
			foreach (ropes _heli);
			};

		_txt = selectRandom RYD_HAS_sent_Accomplished_sc;
		//(driver _heli) customChat [RYD_HAS_PilotChannel,_txt];
		[(driver _heli),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
		if (true) then//if (player in RYD_HAS_STT) then
			{
			//playSound "TacticalPing3";
			"TacticalPing3" remoteExec ["playSound",RYD_HAS_Caller];
			};

		if (RYD_HAS_SupplyDrop_attachFlareAndSmoke) then
			{
			[RYD_HAS_box,_lzMark] spawn
				{
				params ["_box","_mark"]; 
				
				sleep 5;

				/*_maxH = ((boundingBoxReal _box) select 1) select 2;
				_arr = lineIntersectsSurfaces [(ATLtoASL (_box modeltoWorld [0,0,_maxH])),(ATLtoASL (_box modeltoWorld [0,0,0]))];
				_attPos = if ((count _arr) < 1) then
					{
					[0,0,_maxH]
					}
				else
					{
					(_box worldToModel (ASLtoATL ((_arr select 0) select 0)))
					};
					
				_attPos set [2,((_attPos select 2) + 0.01)];*/
				_attPos = _box worldToModel (getPos _box);//[0,0,0];

				_fl = createVehicle ["Chemlight_blue", (position _box), [], 0, "NONE"];
				_fl setVectorDirAndUp [(vectorDir _box),(vectorUp _box)];
				_fl attachTo [_box,_attPos];
				_fl hideObject true;
				
				_attPos set [1,((_attPos select 1) + 0.1)];
				_sm = createVehicle ["SmokeShellBlue", (position _box), [], 0, "NONE"];
				_sm attachTo [_box,_attPos];
				_sm hideObject true;
				
				deleteMarker _mark;
				}
			}
		else
			{
			[_lzMark] spawn
				{
				params ["_Mark"];
				
				sleep 5;
				
				deleteMarker _mark;
				}
			}
		};
	
	if not (_alive) exitWith
		{
		deleteMarker _lzMark;
		//deleteVehicle _helipad;
		RYD_HAS_canCancel = false; publicVariable "RYD_HAS_canCancel";
		[] call RYD_HAS_atDestroy
		};	

	if (_unable) exitWith 
		{
		deleteMarker _lzMark;
		//deleteVehicle _helipad;	
		RYD_HAS_canCancel = false; publicVariable "RYD_HAS_canCancel";
		//hint "Unable to complete airlift. Exiting call.";
		"Unable to complete airlift. Exiting call." remoteExec ["hint"]; 
		[] call RYD_HAS_HeliRTB
		};

	if (RYD_HAS_CallCancelled) exitWith
		{
		deleteMarker _lzMark;
		//deleteVehicle _helipad;	
		RYD_HAS_canCancel = false; publicVariable "RYD_HAS_canCancel";
		RYD_HAS_CallCancelled = false;

		_uName = if (RYD_HAS_CallerName isEqualTo "") then
			{
			((toLower (rank RYD_HAS_Caller)) + " " + (name RYD_HAS_Caller))
			}
		else
			{
			RYD_HAS_CallerName
			};
			
		_txt = format [(selectRandom RYD_HAS_sent_AirliftCancelled_sc),_uName];
		//RYD_HAS_Caller customChat [RYD_HAS_CallerChannel,_txt];
		[RYD_HAS_Caller,[RYD_HAS_CallerChannel,_txt]] remoteExec ["customChat"];
		if (true) then//if (player in RYD_HAS_STT) then
			{
			//playSound "TacticalPing2";
			"TacticalPing2" remoteExec ["playSound",RYD_HAS_Caller];
			};

		sleep (3 + (random 2));
		
		_txt = selectRandom RYD_HAS_sent_AirliftCancelledConf_sc;
		//(driver _heli) customChat [RYD_HAS_PilotChannel,_txt];
		[(driver _heli),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
		if (true) then//if (player in RYD_HAS_STT) then
			{
			//playSound "TacticalPing3";
			"TacticalPing3" remoteExec ["playSound",RYD_HAS_Caller];
			};
			
		[] call RYD_HAS_HeliRTB
		};
		
	
	//deleteVehicle _helipad;	
	RYD_HAS_canCancel = false; publicVariable "RYD_HAS_canCancel";
	RYD_HAS_CallCancelled = false;
	[] call RYD_HAS_HeliRTB;
	};
	
RYD_HAS_RespawnHeliCheck = 
	{
	params ["_oldHeli"];
	
		{
		if ((((_x select 0) select 0) isEqualTo _oldHeli) and {not (((_x select 0) select 0) in (missionNameSpace getVariable ["RYD_HAS_respawnPending",[]]))}) exitWith
			{
			if (RYD_HAS_RespawnHelis > 0) then
				{
				RYD_HAS_RespawnHelis = RYD_HAS_RespawnHelis - 1
				};

			_pending = missionNameSpace getVariable ["RYD_HAS_respawnPending",[]];
			_pending pushbackUnique ((_x select 0) select 0);
			missionNameSpace setVariable ["RYD_HAS_respawnPending",_pending];
			_arr = +_x;
			RYD_HAS_ChopperPool set [_foreachIndex,objNull];
			_arr spawn RYD_HAS_SpawnHeli;
			}
		}
	foreach RYD_HAS_ChopperPool;
	RYD_HAS_ChopperPool = RYD_HAS_ChopperPool - [objNull]
	};
	
RYD_HAS_SpawnHeli = 
	{
	params ["_oldArray","_type","_pos","_dir"];
	
	sleep 60;
	_oldGp = _oldArray select 2;
	_oldCrew = _oldArray select 1;
	_oldHeli = _oldArray select 0;

		{
		deleteVehicle _x
		}
	foreach _oldCrew;
	
	deleteGroup _oldGp;
	deleteVehicle _oldHeli;
	
	sleep 1;
	
	_newHeli = createVehicle [_type,_pos,[],0,"NONE"];
	_newHeli setDir _dir;
	_newGp = createVehicleCrew _newHeli;
	_newGp deleteGroupWhenEmpty true;
	
	_newHeli call RYD_HAS_NewChopper;
	_pending = missionNameSpace getVariable ["RYD_HAS_respawnPending",[]];
	_pending = _pending - [_oldHeli,objNull];
	missionNameSpace setVariable ["RYD_HAS_respawnPending",_pending];
	};
	
RYD_HAS_NewChopper = 
	{
	/*if (RYD_HAS_wasCalled) exitWith 
		{
		//hint "Airlift pending. Exiting"
		"Airlift pending. Exiting" remoteExec ["hint"];
		};*/
		
	RYD_HAS_allChoppers pushBack _this;
	publicVariable "RYD_HAS_allChoppers";
	
	if not (RYD_HAS_RespawnHelis == 0) then
		{
		RYD_HAS_ChopperPool pushBack [[_this,(crew _this),(group _this)],(typeOf _this),getPosATL _this,getDir _this] 
		};
			
	if ([_this] call RYD_HAS_isGunship) then
		{
		if not (_this in RYD_HAS_CASChoppers) then
			{
			RYD_HAS_CASChoppers pushBack _this
			}
		};
	
	private _ix = 1;(RYD_HAS_allChoppers find _this) + 1;//_ix = (count RYD_HAS_allChoppers) + 1;
	
	while {(({((_x getVariable ["RYD_HAS_myEntryIx",-1]) == _ix)} count RYD_HAS_allChoppers) > 0)} do
		{
		_ix = _ix + 1;
		};
		
	_this setVariable ["RYD_HAS_myEntryIx",_ix,true];
	
	private _cfgVeh = configFile >> "CfgVehicles";

	private _name = _cfgVeh >> (typeOf _this) >> "displayName";
	_name = if (isText _name) then
		{
		(getText _name)
		}
	else
		{
		"Vehicle"
		};
	
	private _varName = vehicleVarName _this;
	if (_varName isEqualTo "") then
		{
		_varName = format ["HAS%1",_ix];
		_this setVehicleVarName _varName;
		};
		
	if (isNil {(missionNameSpace getVariable _varName)}) then
		{
		missionNameSpace setVariable [_varName,_this];
		publicVariable _varName
		};
					
	private _name = _name + ": " + _varName;

	if ((_this emptyPositions "cargo") > 0) then
		{
		private _exp = format ["_callerUnit = player;[[_callerUnit,_callerUnit,-1,0,%1],RYD_HAS_atCalled] remoteExec ['spawn',2];",_this];
		private _entry = [_name,[(_ix + 1)],"",-5,[["expression",_exp]], "1", "1"];
		_this setVariable ["RYD_HAS_myEntry",_entry,true];
		RYD_HAS_CT_submenu = [RYD_HAS_CT_submenu, [_entry],_ix] call BIS_fnc_arrayInsert;
		//RYD_HAS_CT_submenu pushBack _entry;
		
		private _exp2 = format ["_callerUnit = player;[[_callerUnit,_callerUnit,-1,1,%1],RYD_HAS_atCalled] remoteExec ['spawn',2];",_this];
		private _entry2 = [_name,[(_ix + 1)],"",-5,[["expression",_exp2]], "1", "1"];
		_this setVariable ["RYD_HAS_myEntry2",_entry2,true];
		RYD_HAS_CS_submenu pushBack _entry2;
		};

		{
		if not (alive _x) then
			{
			RYD_HAS_CASChoppers set [_foreachindex,objNull]
			}
		}
	foreach RYD_HAS_CASChoppers;
	
	RYD_HAS_CASChoppers = RYD_HAS_CASChoppers - [objNull];
	
	if (_this in RYD_HAS_CASChoppers) then
		{
		private _exp3 = format ["_callerUnit = player;[[_callerUnit,_callerUnit,-1,2,%1],RYD_HAS_atCalled] remoteExec ['spawn',2];",_this];
		private _entry3 = [_name,[(_ix + 1)],"",-5,[["expression",_exp3]], "1", "1"];
		_this setVariable ["RYD_HAS_myEntry3",_entry3,true];
		RYD_HAS_CC_submenu pushBack _entry3;
		};
		
	_ix = _this addMPEventHandler ["MPKilled",RYD_HAS_removeHeliEntry];
	_this setVariable ["RYD_HAS_myKEH",_ix,true];
		
	publicVariable "RYD_HAS_CT_submenu";
	publicVariable "RYD_HAS_CS_submenu";
	publicVariable "RYD_HAS_CC_submenu";

	RYD_HAS_PilotChannel radioChannelAdd (crew _this);
	RYD_HAS_CallerChannel radioChannelAdd (crew _this);
	RYD_HAS_HQChannel radioChannelAdd (crew _this);
	
	if not ((driver _this) kbHasTopic "BIS_SUPP_protocol") then
		{
		(driver _this) kbAddtopic ["BIS_SUPP_protocol", "A3\Modules_F\supports\kb\protocol.bikb", "A3\Modules_F\supports\kb\protocol.fsm", {call compile preprocessFileLineNumbers "A3\Modules_F\supports\kb\protocol.sqf"}];
		};
	};
	
RYD_HAS_NewUnits = 
	{
	/*if (RYD_HAS_wasCalled) exitWith 
		{
		//hint "Airlift pending. Exiting"
		"Airlift pending. Exiting" remoteExec ["hint"]; 
		};*/	
	
	if not (_this isEqualTo RYD_HAS_STT) then
		{
		_arr = _this - RYD_HAS_STT;
		RYD_HAS_STT = RYD_HAS_STT + _arr;
		publicVariable "RYD_HAS_STT";
		};
		
	RYD_HAS_UnitsGone = false;
	publicVariableServer "RYD_HAS_UnitsGone";
	RYD_HAS_PilotChannel radioChannelAdd _this;
	RYD_HAS_CallerChannel radioChannelAdd _this;
	RYD_HAS_HQChannel radioChannelAdd _this;
	
		{
		_x setVariable ["RYD_HAS_Access",true,true];
		_x addMPEventHandler ["MPRespawn", RYD_HAS_atRespawn];
		}
	foreach _this;

	if (not (RYD_HAS_UseSupportsMenu) or {RYD_HAS_isInit}) then
		{
		RYD_HAS_isInit = false;
		publicVariable "RYD_HAS_isInit";
		_this call RYD_HAS_GiveActions;
		}
	};
	
publicVariable "RYD_HAS_NewUnits";
	
RYD_HAS_atRespawn = 
	{
	params ["_unit", "_corpse"];
	
	//if not (local _unit) exitWith {diag_log "not local here";};
	
	[_corpse,(_corpse getVariable ["RYD_HAS_myCallAction",-1])] remoteExec ["removeAction",_corpse];
	[_corpse,(_corpse getVariable ["RYD_HAS_myCallAction2",-1])] remoteExec ["removeAction",_corpse];
	[_corpse,(_corpse getVariable ["RYD_HAS_myCallCancelAction",-1])] remoteExec ["removeAction",_corpse];
	[_corpse,(_corpse getVariable ["RYD_HAS_myCeiligUpAction50",-1])] remoteExec ["removeAction",_corpse];
	[_corpse,(_corpse getVariable ["RYD_HAS_myCeiligDownAction50",-1])] remoteExec ["removeAction",_corpse];
	[_corpse,(_corpse getVariable ["RYD_HAS_myCeiligUpAction250",-1])] remoteExec ["removeAction",_corpse];
	[_corpse,(_corpse getVariable ["RYD_HAS_myCeiligDownAction250",-1])] remoteExec ["removeAction",_corpse];

	if (_corpse getVariable ["RYD_HAS_Access",false]) then
		{
		_unit setVariable ["RYD_HAS_Access",true];
		[_unit] spawn
			{
			_this call RYD_HAS_NewUnits;
			};
		
		/*[_unit] spawn
			{
			params ["_unit"];
			
			_alive = true;
			waitUntil
				{
				sleep 0.1;
				
				if ((isNull _unit) or {not (alive _unit)}) exitwith {_alive = false;true};
				if (_unit in RYD_HAS_STT) exitWith {true};
				
				not (RYD_HAS_wasCalled)
				};
				
			if not (_alive) exitWith {};
				
			if ((_unit getVariable ["RYD_HAS_Access",false]) and {not (_unit in RYD_HAS_STT)}) then
				{
				_this call RYD_HAS_NewUnits;
				}
			}*/
		};
	};
	
RYD_HAS_GiveActions = 
	{
	if not (RYD_HAS_UseSupportsMenu) then
		{
		private _cond = "((_originalTarget getVariable ['RYD_HAS_canCall',true]) and {((not (RYD_HAS_wasCalled or {RYD_HAS_radioCalled or {(({_originalTarget in _x} count RYD_HAS_allChoppers) > 0)}}) and {(isPlayer _originalTarget) and {((RYD_HAS_UseCount < RYD_HAS_Limit) or {(RYD_HAS_Limit < 0)}) and {_this == _originalTarget}}}) and {(({((not (isNull _x) and {(alive _x) and {not (isNull (driver _x)) and {(alive (driver _x))}}}))} count RYD_HAS_allChoppers) > 0)})})";

		if not (RYD_HAS_RadioReq isEqualTo "") then
			{
			_cond = "((_originalTarget getVariable ['RYD_HAS_canCall',true]) and {((not (RYD_HAS_wasCalled or 
						{RYD_HAS_radioCalled or 
							{(({_originalTarget in _x} count RYD_HAS_allChoppers) > 0)}}) and 
								{(isPlayer _originalTarget) and 
									{((RYD_HAS_UseCount < RYD_HAS_Limit) or {(RYD_HAS_Limit < 0)}) and 
										{(_this == _originalTarget) and 
											{((({(((toLower _x) find RYD_HAS_RadioReq) >= 0)} count (assignedItems _originalTarget)) > 0) or 
												{(({(((toLower _x) find RYD_HAS_RadioReq) >= 0)} count (weapons _originalTarget)) > 0) or 
													{(({(((toLower _x) find RYD_HAS_RadioReq) >= 0)} count [(uniform _originalTarget),(vest _originalTarget),(backpack _originalTarget)]) > 0)}})}}}}) and
														{(({((not (isNull _x) and {(alive _x) and {not (isNull (driver _x)) and {(alive (driver _x))}}}))} count RYD_HAS_allChoppers) > 0)})})"
			};
				
		private _cond2 = "((_originalTarget getVariable ['RYD_HAS_canCall',true]) and {((RYD_HAS_wasCalled) and {(isPlayer _originalTarget) and {(_this == _originalTarget) and {not (isNil 'RYD_HAS_Chopper') and {not (isNull RYD_HAS_Chopper) and {(alive RYD_HAS_Chopper) and {(RYD_HAS_canCancel)}}}}}})})";
		private _cond3 = "((_originalTarget getVariable ['RYD_HAS_canCall',true]) and {((((RYD_HAS_wasCalled) or {(RYD_HAS_wasCalledFast)}) and {(isPlayer _originalTarget) and {(_this == _originalTarget) and {not (isNil 'RYD_HAS_Chopper') and {not (isNull RYD_HAS_Chopper) and {(alive RYD_HAS_Chopper)}}}}}) and {(not (RYD_HAS_isSupplyRun) or {not (RYD_HAS_SupplyDrop_SlingLoad) or {(RYD_HAS_Hooked) or {(RYD_HAS_delivered)}}})})})";
		
			{
			//_ix = _x addAction ["<t color='#fe8701'>Call for transport</t>", RYD_HAS_atCalled, 0, 1, false, true, "", _cond];
			//_x setVariable ["RYD_HAS_myCallAction",_ix,true];
			//[_x,["<t color='#fe8701'>Call for transport</t>", "[_this,RYD_HAS_atCalled] remoteExec ['spawn',2];(_this select 0) setVariable ['RYD_HAS_myCallAction',(_this select 2),true];", 0, 1, false, true, "", _cond]] remoteExec ["addAction",_x];
			[_x,["<t color='#fe8701'>Call for transport</t>", "[_this,RYD_HAS_atCalled] remoteExec ['spawn',2];", 0, 1, false, true, "",("(((RYD_HAS_Switch_Taxi) and {(_originalTarget getVariable ['RYD_HAS_canCall_Taxi',true])})" + " and {" + _cond + "})")],"RYD_HAS_myCallAction"] remoteExec ["RYD_HAS_AddAction",_x];
			//_ix = _x addAction ["<t color='#fe8701'>Call for supplies</t>", RYD_HAS_atCalled, 1, 1, false, true, "", _cond];
			//_x setVariable ["RYD_HAS_myCallAction2",_ix,true];
			//[_x,["<t color='#fe8701'>Call for supplies</t>", "[_this,RYD_HAS_atCalled] remoteExec ['spawn',2];(_this select 0) setVariable ['RYD_HAS_myCallAction2',(_this select 2),true];", 1, 1, false, true, "", _cond]] remoteExec ["addAction",_x];	
			[_x,["<t color='#fe8701'>Call for supplies</t>", "[_this,RYD_HAS_atCalled] remoteExec ['spawn',2];", 1, 1, false, true, "", ("(((RYD_HAS_Switch_Supply) and {(_originalTarget getVariable ['RYD_HAS_canCall_Supply',true])})" + " and {" + _cond + "})")],"RYD_HAS_myCallAction2"] remoteExec ["RYD_HAS_AddAction",_x];
			//_ix2 = _x addAction ["<t color='#fe8701'>Cancel airlift</t>", "RYD_HAS_CallCancelled = true", 2, 1, false, true, "", _cond2];
			//_x setVariable ["RYD_HAS_myCallCancelAction",_ix2];
			//[_x,["<t color='#fe8701'>Cancel airlift</t>", "RYD_HAS_CallCancelled = true;publicVariableServer 'RYD_HAS_CallCancelled';(_this select 0) setVariable ['RYD_HAS_myCallCancelAction',(_this select 2),true];", 2, 1, false, true, "", _cond2]] remoteExec ["addAction",_x];
			[_x,["<t color='#fe8701'>Call for CAS</t>", "[_this,RYD_HAS_atCalled] remoteExec ['spawn',2];", 2, 1, false, true, "", ("(((RYD_HAS_Switch_CAS) and {(_originalTarget getVariable ['RYD_HAS_canCall_CAS',true])})" + " and {" + _cond + "})")],"RYD_HAS_myCallAction3"] remoteExec ["RYD_HAS_AddAction",_x];
			[_x,["<t color='#fe8701'>Cancel pending HAS support</t>", "RYD_HAS_CallCancelled = true;publicVariableServer 'RYD_HAS_CallCancelled';", 2, 1, false, true, "", _cond2],"RYD_HAS_myCallCancelAction"] remoteExec ["RYD_HAS_AddAction",_x];
			//_ix3 = _x addAction ["<t color='#fe8701'>Flight ceiling: +50m</t>", RYD_HAS_ChangeAltitude, 50, 1, false, true, "", _cond3];
			//_x setVariable ["RYD_HAS_myCeiligUpAction50",_ix3];
			//[_x,["<t color='#fe8701'>Flight ceiling: +50m</t>", "[_this,RYD_HAS_ChangeAltitude] remoteExec ['spawn',2];(_this select 0) setVariable ['RYD_HAS_myCeiligUpAction50',(_this select 2),true];", 50, 1, false, true, "", _cond3]] remoteExec ["addAction",_x];
			[_x,["<t color='#fe8701'>Flight ceiling: +50m</t>", "[_this,RYD_HAS_ChangeAltitude] remoteExec ['spawn',2];", 50, 1, false, true, "", _cond3],"RYD_HAS_myCeiligUpAction50"] remoteExec ["RYD_HAS_AddAction",_x];
			//_ix4 = _x addAction ["<t color='#fe8701'>Flight ceiling: +250m</t>", RYD_HAS_ChangeAltitude, 250, 1, false, true, "", _cond3];
			//_x setVariable ["RYD_HAS_myCeiligUpAction250",_ix4];
			//[_x,["<t color='#fe8701'>Flight ceiling: +250m</t>", "[_this,RYD_HAS_ChangeAltitude] remoteExec ['spawn',2];(_this select 0) setVariable ['RYD_HAS_myCeiligUpAction250',(_this select 2),true];", 250, 1, false, true, "", _cond3]] remoteExec ["addAction",_x];
			[_x,["<t color='#fe8701'>Flight ceiling: +250m</t>", "[_this,RYD_HAS_ChangeAltitude] remoteExec ['spawn',2];", 250, 1, false, true, "", _cond3],"RYD_HAS_myCeiligUpAction250"] remoteExec ["RYD_HAS_AddAction",_x];
			//_ix5 = _x addAction ["<t color='#fe8701'>Flight ceiling: -50m</t>", RYD_HAS_ChangeAltitude, -50, 1, false, true, "", _cond3];
			//_x setVariable ["RYD_HAS_myCeiligDownAction50",_ix5];
			//[_x,["<t color='#fe8701'>Flight ceiling: -50m</t>", "[_this,RYD_HAS_ChangeAltitude] remoteExec ['spawn',2];(_this select 0) setVariable ['RYD_HAS_myCeiligDownAction50',(_this select 2),true];", -50, 1, false, true, "", _cond3]] remoteExec ["addAction",_x];
			[_x,["<t color='#fe8701'>Flight ceiling: -50m</t>", "[_this,RYD_HAS_ChangeAltitude] remoteExec ['spawn',2];", -50, 1, false, true, "", _cond3],"RYD_HAS_myCeiligDownAction50"] remoteExec ["RYD_HAS_AddAction",_x];
			//_ix6 = _x addAction ["<t color='#fe8701'>Flight ceiling: -250m</t>", RYD_HAS_ChangeAltitude, -250, 1, false, true, "", _cond3];
			//_x setVariable ["RYD_HAS_myCeiligDownAction250",_ix6];
			//[_x,["<t color='#fe8701'>Flight ceiling: -250m</t>", "[_this,RYD_HAS_ChangeAltitude] remoteExec ['spawn',2];(_this select 0) setVariable ['RYD_HAS_myCeiligDownAction250',(_this select 2),true];", -250, 1, false, true, "", _cond3]] remoteExec ["addAction",_x];
			[_x,["<t color='#fe8701'>Flight ceiling: -250m</t>", "[_this,RYD_HAS_ChangeAltitude] remoteExec ['spawn',2];", -250, 1, false, true, "", _cond3],"RYD_HAS_myCeiligDownAction250"] remoteExec ["RYD_HAS_AddAction",_x];
			}
		foreach _this;
		}
	else
		{
			{
			[_x,[_x,"HAS_callTransport",nil,nil,""],"RYD_HAS_ActionVisible_callT_id"] remoteExec ["RYD_HAS_AddSupport",_x];
			_x setVariable ["RYD_HAS_ActionVisible_callT",true];
			[_x,[_x,"HAS_callSupply",nil,nil,""],"RYD_HAS_ActionVisible_callS_id"] remoteExec ["RYD_HAS_AddSupport",_x];
			_x setVariable ["RYD_HAS_ActionVisible_callS",true];
			[_x,[_x,"HAS_callCAS",nil,nil,""],"RYD_HAS_ActionVisible_callC_id"] remoteExec ["RYD_HAS_AddSupport",_x];
			_x setVariable ["RYD_HAS_ActionVisible_callC",true];
			//_ct = [_x,"HAS_callTransport"] call BIS_fnc_addCommMenuItem;
			//_cs = [_x,"HAS_callSupply"] call BIS_fnc_addCommMenuItem;
			}
		foreach _this;
		
		if (isNil "RYD_HAS_OptionsLoop") then
			{
			RYD_HAS_OptionsLoop = [] spawn
				{			
				while {true} do
					{
					sleep 0.1;
					if ((RYD_HAS_RemoveAtLimit) and {(not ((RYD_HAS_Limit - RYD_HAS_UseCount) > 0) and {not (RYD_HAS_Limit < 0)})}) exitWith 
						{
							{
							if not (isNull _x) then
								{
								[[_x,(_x getVariable ["RYD_HAS_ActionVisible_callT_id",-1])],RYD_HAS_BIS_fnc_removeCommMenuItem] remoteExec ["call",_x];
								_x setVariable ["RYD_HAS_ActionVisible_callT",false];
								[[_x,(_x getVariable ["RYD_HAS_ActionVisible_callS_id",-1])],RYD_HAS_BIS_fnc_removeCommMenuItem] remoteExec ["call",_x];
								_x setVariable ["RYD_HAS_ActionVisible_callS",false];
								}
							}
						foreach RYD_HAS_STT
						};

						{
						if (not (isNull _x) and {(alive _x)}) then
							{
							_unit = _x;
							_cond = if not (RYD_HAS_RadioReq isEqualTo "") then
								{
								((_x getVariable ['RYD_HAS_canCall',true]) and {((not (RYD_HAS_wasCalled or 
									{RYD_HAS_radioCalled or 
										{(({_unit in _x} count RYD_HAS_allChoppers) > 0)}}) and 
											{((RYD_HAS_UseCount < RYD_HAS_Limit) or {(RYD_HAS_Limit < 0)}) and 
												{((({(((toLower _x) find RYD_HAS_RadioReq) >= 0)} count (assignedItems _x)) > 0) or 
													{(({(((toLower _x) find RYD_HAS_RadioReq) >= 0)} count (weapons _x)) > 0) or 
														{(({(((toLower _x) find RYD_HAS_RadioReq) >= 0)} count [(uniform _x),(vest _x),(backpack _x)]) > 0)}})}}) and
															{(({((not (isNull _x) and {(alive _x) and {not (isNull (driver _x)) and {(alive (driver _x))}}}))} count RYD_HAS_allChoppers) > 0)})})
								}
							else
								{
								((_x getVariable ['RYD_HAS_canCall',true]) and {((not (RYD_HAS_wasCalled or {RYD_HAS_radioCalled or {(({_unit in _x} count RYD_HAS_allChoppers) > 0)}}) and {((RYD_HAS_UseCount < RYD_HAS_Limit) or {(RYD_HAS_Limit < 0)})}) and {(({((not (isNull _x) and {(alive _x) and {not (isNull (driver _x)) and {(alive (driver _x))}}}))} count RYD_HAS_allChoppers) > 0)})})
								};
								
							if ((_cond) and {((RYD_HAS_Switch_Taxi) and {(_x getVariable ["RYD_HAS_canCall_Taxi",true])})}) then
								{
								if not (_x getVariable ["RYD_HAS_ActionVisible_callT",false]) then
									{
									[_x,[_x,"HAS_callTransport",nil,nil,""],"RYD_HAS_ActionVisible_callT_id"] remoteExec ["RYD_HAS_AddSupport",_x];
									_x setVariable ["RYD_HAS_ActionVisible_callT",true];
									};
								}
							else
								{
								if ((_x getVariable ["RYD_HAS_ActionVisible_callT",false]) and {not ((_x getVariable ["RYD_HAS_ActionVisible_callT_id",-1]) < 0)}) then
									{
									[[_x,"RYD_HAS_ActionVisible_callT_id"],RYD_HAS_RemoveSupport] remoteExec ["spawn",_x];
									_x setVariable ["RYD_HAS_ActionVisible_callT",false];
									}
								};

							if ((_cond) and {((RYD_HAS_Switch_Supply) and {(_x getVariable ["RYD_HAS_canCall_Supply",true])})}) then
								{
								 if not (_x getVariable ["RYD_HAS_ActionVisible_callS",false]) then
									{
									[_x,[_x,"HAS_callSupply",nil,nil,""],"RYD_HAS_ActionVisible_callS_id"] remoteExec ["RYD_HAS_AddSupport",_x];
									_x setVariable ["RYD_HAS_ActionVisible_callS",true];
									}
								}
							else
								{
								if ((_x getVariable ["RYD_HAS_ActionVisible_callS",false]) and {not ((_x getVariable ["RYD_HAS_ActionVisible_callS_id",-1]) < 0)}) then
									{
									[[_x,"RYD_HAS_ActionVisible_callS_id"],RYD_HAS_RemoveSupport] remoteExec ["spawn",_x];
									_x setVariable ["RYD_HAS_ActionVisible_callS",false];
									}
								};
								
							if ((_cond) and {((RYD_HAS_Switch_CAS) and {(_x getVariable ["RYD_HAS_canCall_CAS",true])})}) then
								{
								 if not (_x getVariable ["RYD_HAS_ActionVisible_callC",false]) then
									{
									[_x,[_x,"HAS_callCAS",nil,nil,""],"RYD_HAS_ActionVisible_callC_id"] remoteExec ["RYD_HAS_AddSupport",_x];
									_x setVariable ["RYD_HAS_ActionVisible_callC",true];
									}
								}
							else
								{
								if ((_x getVariable ["RYD_HAS_ActionVisible_callC",false]) and {not ((_x getVariable ["RYD_HAS_ActionVisible_callC_id",-1]) < 0)}) then
									{
									[[_x,"RYD_HAS_ActionVisible_callC_id"],RYD_HAS_RemoveSupport] remoteExec ["spawn",_x];
									_x setVariable ["RYD_HAS_ActionVisible_callC",false];
									}
								};							
								
							_cond2 = ((_x getVariable ['RYD_HAS_canCall',true]) and {((RYD_HAS_wasCalled) and {not (isNil 'RYD_HAS_Chopper') and {not (isNull RYD_HAS_Chopper) and {(alive RYD_HAS_Chopper) and {(RYD_HAS_canCancel)}}}})});

							if (_cond2) then
								{
								if not (_x getVariable ["RYD_HAS_ActionVisible_cancel",false]) then
									{
									[_x,[_x,"HAS_callCancel",nil,nil,""],"RYD_HAS_ActionVisible_cancel_id"] remoteExec ["RYD_HAS_AddSupport",_x];
									_x setVariable ["RYD_HAS_ActionVisible_cancel",true];
									};
								}
							else
								{
								if ((_x getVariable ["RYD_HAS_ActionVisible_cancel",false]) and {not ((_x getVariable ["RYD_HAS_ActionVisible_cancel_id",-1]) < 0)}) then
									{
									[[_x,"RYD_HAS_ActionVisible_cancel_id"],RYD_HAS_RemoveSupport] remoteExec ["spawn",_x];
									_x setVariable ["RYD_HAS_ActionVisible_cancel",false];
									}
								};						
													
							_cond3 = ((_x getVariable ['RYD_HAS_canCall',true]) and {((((RYD_HAS_wasCalled) or {(RYD_HAS_wasCalledFast)}) and {not (isNil 'RYD_HAS_Chopper') and {not (isNull RYD_HAS_Chopper) and {(alive RYD_HAS_Chopper)}}}) and {(not (RYD_HAS_isSupplyRun) or {not (RYD_HAS_SupplyDrop_SlingLoad) or {(RYD_HAS_Hooked) or {(RYD_HAS_delivered)}}})})});	

							if (_cond3) then
								{
								if not (_x getVariable ["RYD_HAS_ActionVisible_flightC",false]) then
									{
									[_x,[_x,"HAS_FlightCeiling",nil,nil,""],"RYD_HAS_ActionVisible_flightC_id"] remoteExec ["RYD_HAS_AddSupport",_x];
									_x setVariable ["RYD_HAS_ActionVisible_flightC",true];
									}
								}
							else
								{
								if ((_x getVariable ["RYD_HAS_ActionVisible_flightC",false]) and {not ((_x getVariable ["RYD_HAS_ActionVisible_flightC_id",-1]) < 0)}) then
									{
									[[_x,"RYD_HAS_ActionVisible_flightC_id"],RYD_HAS_RemoveSupport] remoteExec ["spawn",_x];
									_x setVariable ["RYD_HAS_ActionVisible_flightC",false];
									}
								};
							}
						}
					foreach RYD_HAS_STT
					}
				}
			}
		};
	};
	
publicVariable "RYD_HAS_GiveActions";

RYD_HAS_AddSupport =
	{
	params ["_tgt","_pars","_vn"];
	
	private _id = _pars call BIS_fnc_addCommMenuItem;
	_tgt setVariable [_vn,_id,true];
	};
	
publicVariable "RYD_HAS_AddSupport";

RYD_HAS_RemoveSupport =
	{
	params ["_tgt","_vn"];
	
	private _tme = time;
	
	waitUntil
		{
		(not (isNil {BIS_fnc_addCommMenuItem_load}) or {((time - _tme) > 30)})
		};
	
	if (isNil {BIS_fnc_addCommMenuItem_load}) exitWith {};
	[_tgt,(_tgt getVariable [_vn,-1])] call RYD_HAS_BIS_fnc_removeCommMenuItem;
	_tgt setVariable [_vn,-1,true];
	};
	
publicVariable "RYD_HAS_RemoveSupport";

RYD_HAS_isOnMap = 
	{
	private ["_pos","_onMap"];
	
	_pos = _this select 0;
	
	if (isNil "_pos") exitWith {false};
	if not (typeName _pos in [(typeName [])]) exitWith {false};
	
	_pos = +_pos;
	_pos reSize 2;

	if (({not (isNil {_x})} count _pos) < 2) exitWith {false};
	if (({(typeName _x) in [(typeName 0)]} count _pos) < 2) exitWith {false};
		
	_onMap = switch (true) do
		{
		case (({_x < 0} count _pos) > 0) : {false};
		case (({_x > worldSize} count _pos) > 0) : {false};
		default {true}
		};
		
	_onMap
	};
	
publicVariable "RYD_HAS_isOnMap";

RYD_HAS_ClearRoute = 
	{
	private ["_el"];
		
	private _onlyActive = if ((count _this) > 0) then
		{
		(_this select 0)
		}
	else
		{
		false
		};
		
	private _reversed = if ((count _this) > 1) then
		{
		(_this select 1)
		}
	else
		{
		false
		};
		
	private _pathLastIx = (count RYD_HAS_MidWPs) - 1;
		
	private _from = if (_reversed) then
		{
		0
		}
	else
		{
		_pathLastIx
		};
		
	private _to = if (_reversed) then
		{
		_pathLastIx
		}
	else
		{
		0
		};
		
	private _step = if (_reversed) then
		{
		1
		}
	else
		{
		-1
		};

	for "_i" from _from to _to step _step do
		{
		_el = RYD_HAS_MidWPs select _i;

		if (not (_onlyActive) or {((count (_el select 2)) > 0)}) then
			{
				{
				deleteMarker _x
				}
			foreach (_el select 1);
			
			if ((count (_el select 2)) > 0) then
				{
				(_el select 2) setWaypointStatements ["true",""];
				(_el select 2) setWaypointPosition [(position RYD_HAS_Chopper),0];
				deleteWaypoint (_el select 2);
				}
			}
		};
		
	RYD_HAS_MidWPs = [];
	publicVariable "RYD_HAS_MidWPs";
	};
	
publicVariable "RYD_HAS_ClearRoute";
	
RYD_HAS_ExecuteRoute = 
	{
	private ["_heli","_finalIx","_clearSelf","_reversed","_gp","_wp","_wps","_cwp","_firstWP","_currIx","_pathLastIx","_from","_to","_step","_navP","_lastAddedIx"];

	_heli = _this select 0;
	_finalIx = if ((count _this) > 1) then
		{
		((_this select 1) select 1)
		}
	else
		{
		-1
		};
		
	_clearSelf = if ((count _this) > 2) then
		{
		(_this select 2)
		}
	else
		{
		false
		};
		
	_reversed = if ((count _this) > 3) then
		{
		(_this select 3)
		}
	else
		{
		false
		};
	
	_gp = group _heli;
	/*if ((not (_finalIx < 0)) and {not ((currentWaypoint _gp) < _finalIx)}) exitWith
		{
		[]
		};*/
	
	_wps = [];
	_firstWP = [];
	_currIx = currentWaypoint _gp;
	_pathLastIx = (count RYD_HAS_MidWPs) - 1;
	_lastAddedIx = -1;
	
	_from = if (_reversed) then
		{
		_pathLastIx
		}
	else
		{
		0
		};
		
	_to = if (_reversed) then
		{
		0
		}
	else
		{
		_pathLastIx
		};
		
	_step = if (_reversed) then
		{
		-1
		}
	else
		{
		1
		};
	
	for "_i" from _from to _to step _step do
		{
		_navP = RYD_HAS_MidWPs select _i;
		if ((_reversed) or {((count (_navP select 2)) < 2)}) then
			{
			if ((_reversed) and {(((getMarkerPos ((_navP select 1) select 0)) isEqualTo [0,0,0]) or {not ((toLower (getMarkerColor ((_navP select 1) select 0))) isEqualTo "colorgrey")})}) exitWith
				{
					{
					deleteMarker _x
					}
				foreach (_navP select 1);
				};
				
			_wp = if not (_finalIx < 0) then
				{
				(_gp addWaypoint [(_navP select 0), 0, (_finalIx max (_lastAddedIx + 1))])
				}
			else
				{
				(_gp addWaypoint [(_navP select 0), 0])
				};
			
			_lastAddedIx = _wp select 1;
			_wp setWaypointType "MOVE";
			
			_st = "if ((count RYD_HAS_MidWPs) > %1) then {{if not ((toLower (markerColor _x)) isEqualTo 'colorgrey') then {_x setMarkerColorLocal 'ColorGrey'} else {deleteMarker _x}} foreach ((RYD_HAS_MidWPs select %1) select 1);};";
			if ((_clearSelf) and {(_i == _to)}) then
				{
				_st = _st + "[false,%2] call RYD_HAS_ClearRoute;";
				};
				
			_st = format [_st,_i,_reversed];
				
			_wp setWaypointStatements ["true",_st];
			_wps pushBack _wp;
			_navP set [2,_wp];
			
			if ((count _firstWP) < 2) then
				{
				_firstWP = +_wp
				}
			}
		else
			{
			_cwp = _navP select 2;
			_st = "if ((count RYD_HAS_MidWPs) > %1) then {{if not ((toLower (markerColor _x)) isEqualTo 'colorgrey') then {_x setMarkerColorLocal 'ColorGrey'} else {deleteMarker _x}} foreach ((RYD_HAS_MidWPs select %1) select 1);};";
			_st = format [_st,_i];				
			_cwp setWaypointStatements ["true",_st];
			}
		};

	if (((count _firstWP) > 1) and {((_firstWP select 1) < _currIx)}) then
		{
		_gp setCurrentWaypoint _firstWP
		};
		
	publicVariable "RYD_HAS_MidWPs";
	
	_wps
	};

RYD_HAS_MapPoint = 
	{
	if ((_alt) and {isNil "RYD_HAS_noRoute"}) exitWith
		{
		[] call RYD_HAS_ClearRoute;
		true
		};
	
	if ((_shift) and {isNil "RYD_HAS_noRoute"}) exitWith
		{
		_i = "Mid_mark_" + (str _pos);
		_i = createMarker [_i,_pos];
		_i setMarkerColor "ColorBlue";
		_i setMarkerShape "ICON";
		_i setMarkerType "mil_triangle";
		_i setMarkerSize [0.65,0.65];	
		_i setMarkerText ("HAS navpoint " + (str ((count RYD_HAS_MidWPs) + 1)));
		
		_refP = if ((count RYD_HAS_MidWPs) > 0) then
			{
			(markerPos (((RYD_HAS_MidWPs select ((count RYD_HAS_MidWPs) - 1)) select 1) select 0))	
			}
		else
			{
			(position RYD_HAS_Chopper)
			};
			
		_dst = _refP distance2D _pos;
		_dir = _refP getDir _pos;
		_mPos = _refP getPos [_dst/2,_dir];
		
		_i2 = "Mid_line_" + (str _pos);
		_i2 = createMarker [_i2,_mPos];
		_i2 setMarkerColor "ColorBlue";
		_i2 setMarkerShape "RECTANGLE";
		_i2 setMarkerSize [0.5,_dst/2];
		_i2 setMarkerBrush "Solid";
		_i2 setMarkerDir _dir;
		_marks = [_i,_i2];		
		
		RYD_HAS_MidWPs pushBack [_pos,_marks,[]];
		publicVariable "RYD_HAS_MidWPs";
		true
		};
		
	RYD_HAS_noRoute = nil;
	publicVariable "RYD_HAS_noRoute";
		
	if not (isNil "RYD_HAS_ForcedPos") exitWith
		{
		RYD_HAS_clickedPos = RYD_HAS_ForcedPos;
		RYD_HAS_ForcedPos = nil;
		publicVariable "RYD_HAS_ForcedPos";
		true
		};
	
	if ((surfaceIsWater _pos) or {not([_pos] call RYD_HAS_isOnMap)}) exitWith 
		{
		//hint 'Destination must be on land.'
		'Destination must be on land.' remoteExec ['hint']; 
		};
			
	RYD_HAS_clickedPos = _pos;	
	publicVariableServer "RYD_HAS_clickedPos";
	true
	};
	
publicVariable "RYD_HAS_MapPoint";

RYD_HAS_MapPoint2 = 
	{
	if ((_alt) and {isNil "RYD_HAS_noRoute"}) exitWith
		{
		[] call RYD_HAS_ClearRoute;
		true
		};
	
	if ((_shift) and {isNil "RYD_HAS_noRoute"}) exitWith
		{
		_i = "Mid_mark_" + (str _pos);
		_i = createMarker [_i,_pos];
		_i setMarkerColor "ColorBlue";
		_i setMarkerShape "ICON";
		_i setMarkerType "mil_triangle";
		_i setMarkerSize [0.65,0.65];	
		_i setMarkerText ("HAS navpoint " + (str ((count RYD_HAS_MidWPs) + 1)));
		
		_refP = if ((count RYD_HAS_MidWPs) > 0) then
			{
			(markerPos (((RYD_HAS_MidWPs select ((count RYD_HAS_MidWPs) - 1)) select 1) select 0))	
			}
		else
			{
			(position RYD_HAS_Chopper)
			};
			
		_dst = _refP distance2D _pos;
		_dir = _refP getDir _pos;
		_mPos = _refP getPos [_dst/2,_dir];
		
		_i2 = "Mid_line_" + (str _pos);
		_i2 = createMarker [_i2,_mPos];
		_i2 setMarkerColor "ColorBlue";
		_i2 setMarkerShape "RECTANGLE";
		_i2 setMarkerSize [0.5,_dst/2];
		_i2 setMarkerBrush "Solid";
		_i2 setMarkerDir _dir;
		_marks = [_i,_i2];		
		
		RYD_HAS_MidWPs pushBack [_pos,_marks,[]];
		publicVariable "RYD_HAS_MidWPs";
		true
		};
		
	RYD_HAS_noRoute = nil;
	publicVariable "RYD_HAS_noRoute";
		
	if not (isNil "RYD_HAS_ForcedPos") exitWith
		{
		RYD_HAS_clickedPos2 = RYD_HAS_ForcedPos;
		RYD_HAS_ForcedPos = nil;
		publicVariable "RYD_HAS_ForcedPos";
		publicVariableServer "RYD_HAS_clickedPos2";
		true
		};	
	
	if ((surfaceIsWater _pos) or {not([_pos] call RYD_HAS_isOnMap)}) exitWith 
		{
		//hint 'Destination must be on land.'
		'Destination must be on land.' remoteExec ['hint'];
		RYD_HAS_clickedPos2 = [-1000,-1000];
		publicVariableServer "RYD_HAS_clickedPos2";
		};
	
	RYD_HAS_clickedPos2 = _pos;	
	publicVariableServer "RYD_HAS_clickedPos2";
	true
	};
	
publicVariable "RYD_HAS_MapPoint2";

RYD_HAS_MapPointCAS = 
	{
	if ((_alt) and {isNil "RYD_HAS_noRoute"}) exitWith
		{
		RYD_HAS_clickedPos2 = [-1000,-1000];
		publicVariableServer "RYD_HAS_clickedPos2";

		//[[],RYD_HAS_ClearRoute] remoteExec ["call",0];
		[] call RYD_HAS_ClearRoute;
		true
		};
	
	if ((_shift) and {isNil "RYD_HAS_noRoute"}) exitWith
		{
		_i = "Mid_mark_" + (str _pos);
		_i = createMarker [_i,_pos];
		_i setMarkerColor "ColorBlue";
		_i setMarkerShape "ICON";
		_i setMarkerType "mil_triangle";
		_i setMarkerSize [0.65,0.65];	
		_i setMarkerText ("HAS navpoint " + (str ((count RYD_HAS_MidWPs) + 1)));
		
		_refP = if ((count RYD_HAS_MidWPs) > 0) then
			{
			(markerPos (((RYD_HAS_MidWPs select ((count RYD_HAS_MidWPs) - 1)) select 1) select 0))	
			}
		else
			{
			(position RYD_HAS_Chopper)
			};
			
		_dst = _refP distance2D _pos;
		_dir = _refP getDir _pos;
		_mPos = _refP getPos [_dst/2,_dir];
		
		_i2 = "Mid_line_" + (str _pos);
		_i2 = createMarker [_i2,_mPos];
		_i2 setMarkerColor "ColorBlue";
		_i2 setMarkerShape "RECTANGLE";
		_i2 setMarkerSize [0.5,_dst/2];
		_i2 setMarkerBrush "Solid";
		_i2 setMarkerDir _dir;
		_marks = [_i,_i2];		
		
		RYD_HAS_MidWPs pushBack [_pos,_marks,[]];
		publicVariable "RYD_HAS_MidWPs";
		true
		};
		
	RYD_HAS_noRoute = nil;
	publicVariable "RYD_HAS_noRoute";
		
	if not (isNil "RYD_HAS_ForcedPos") exitWith
		{
		RYD_HAS_clickedPos = RYD_HAS_ForcedPos;
		RYD_HAS_ForcedPos = nil;
		publicVariable "RYD_HAS_ForcedPos";
		RYD_HAS_clickedPos2 = [-1000,-1000];
		publicVariableServer "RYD_HAS_clickedPos2";
		true
		};	
	
	if not ([_pos] call RYD_HAS_isOnMap) exitWith 
		{
		//hint 'Destination must be on land.'
		'Destination must be within map area.' remoteExec ['hint']; 
		RYD_HAS_clickedPos2 = [-1000,-1000];
		publicVariableServer "RYD_HAS_clickedPos2";
		};
	
	RYD_HAS_clickedPos = _pos;	
	publicVariableServer "RYD_HAS_clickedPos";
	RYD_HAS_clickedPos2 = [-1000,-1000];
	publicVariableServer "RYD_HAS_clickedPos2";
	
	true
	};
	
publicVariable "RYD_HAS_MapPointCAS";
	
RYD_HAS_FindFRpos = 
	{
	private ["_pos","_mark","_minLvl","_rad","_rds","_checkPos","_maxH","_lz","_found"];

	_pos = _this select 0;
	_mark = _this select 1;
	_minLvl = _this select 2;

	_rds = 0;
	_rad = if (RYD_HAS_FastRoping) then
		{
		RYD_HAS_FastRopingOSrad
		}
	else
		{
		25
		};
		
	_found = false;

	while {_rds < 250} do
		{
		_checkPos = _pos getPos [_rds,(random 360)];
		_nO = if not (_rad > 0) then
			{
			[]
			}
		else
			{
			(nearestObjects [_checkPos, [], _rad, true])
			//(nearestObjects [_checkPos, ["House", "Building"], _rad, true])
			};

		if ((count _nO) < 1) exitWith
			{
			_found = true;
			_nO = nearestObjects [_checkPos, [], 30, true];//nearestObjects [_checkPos, ["House", "Building"], 30, true];
			
				{
				_maxH = (_x modelToWorld [0,0,(((boundingBoxReal _x) select 1) select 2)]) select 2;
				_minLvl = _minLvl max (_maxH + 5);
				}
			foreach _nO;			
			
			_pos = _checkPos;
			_pos set [2,0];
			if (_mark isEqualTo "") then
				{
				_mark = "LZ_mark";
				_mark = createMarker [_mark,_pos];
				_mark setMarkerColor "ColorGreen";
				_mark setMarkerShape "ICON";
				_mark setMarkerType "mil_pickup";
				_mark setMarkerSize [0.75,0.75];
				}
			else
				{
				_mark setMarkerPos _pos
				}
			};

		_rds = _rds + 1;
		};
		
	if not (_found) then
		{
		"WARNING!\nNo safe spot found in 250m radius. Fast roping risky." remoteExec ["hint"];	
		
		_nO = nearestObjects [_pos, [], 30, true];//nearestObjects [_checkPos, ["House", "Building"], 30, true];
		
			{
			_maxH = (_x modelToWorld [0,0,(((boundingBoxReal _x) select 1) select 2)]) select 2;
			_minLvl = _minLvl max (_maxH + 5);
			}
		foreach _nO;			

		_pos set [2,0];
		if (_mark isEqualTo "") then
			{
			_mark = "LZ_mark";
			_mark = createMarker [_mark,_pos];
			_mark setMarkerColor "ColorGreen";
			_mark setMarkerShape "ICON";
			_mark setMarkerType "mil_pickup";
			_mark setMarkerSize [0.75,0.75];
			}
		else
			{
			_mark setMarkerPos _pos
			}		
		};
		
	//_lz = createVehicle ["Land_HelipadEmpty_F", _pos, [], 0, "NONE"];

	[_pos,_minLvl]
	};
	
RYD_HAS_FindALPos = 
	{
	private ["_pos","_mark","_heli","_rds","_isFlat","_posX","_posY","_i","_bbr","_mSize","_found"];

	_pos = _this select 0;
	_mark = _this select 1;
	_heli = _this select 2;
	
	_bbr = boundingBoxReal _heli;
	_mSize = ((_bbr select 0) distance2D (_bbr select 1))/2;
	
	_posX = -1;
	_posY = -1;
	_rds = 1;

	_i = "";
	_found = false;

	while {_rds < 300} do
		{
		//_isFlat = _pos isFlatEmpty [30,_rds,1.5,30,0,false,objNull];
		_isFlat = [_pos, 0, _rds, ((RYD_HAS_SafetyMargin + _mSize) max 0), 0, 0.3, 0,[],[[-1,-1],[-1,-1]]] call BIS_fnc_findSafePos;

		if (({not (_x <= 0)} count _isFlat) == 2) exitWith
			{
			_found = true;
			_posX = _isFlat select 0;
			_posY = _isFlat select 1;
			
			if (_mark isEqualTo "") then
				{
				_mark = "LZ_mark";
				_mark = createMarker [_mark,[_posX,_posY]];
				_mark setMarkerColor "ColorGreen";
				_mark setMarkerShape "ICON";
				_mark setMarkerType "mil_pickup";
				_mark setMarkerSize [0.75,0.75];
				}
			else
				{
				_mark setMarkerPos [_posX,_posY]
				}
			};

		_rds = _rds + 25;
		};
		
	if not (_found) then
		{
		"WARNING!\nNo clear LZ found in 300m radius. Landing risky." remoteExec ["hint"];
		_posX = _pos select 0;
		_posY = _pos select 1;		
		
		if (_mark isEqualTo "") then
			{
			_mark = "LZ_mark";
			_mark = createMarker [_mark,[_posX,_posY]];
			_mark setMarkerColor "ColorGreen";
			_mark setMarkerShape "ICON";
			_mark setMarkerType "mil_pickup";
			_mark setMarkerSize [0.75,0.75];
			}
		else
			{
			_mark setMarkerPos [_posX,_posY]
			}		
		};

	[[_posX,_posY,0],_mark]
	};
	
RYD_HAS_LZ = 
	{
	private ["_pos","_mark","_makeLZ","_heli","_lz","_rds","_isFlat","_posX","_posY","_i","_bbr","_mSize","_found"];

	_pos = _this select 0;
	_mark = _this select 1;
	_makeLZ = _this select 2;
	_heli = _this select 3;
	
	_bbr = boundingBoxReal _heli;
	_mSize = ((_bbr select 0) distance2D (_bbr select 1))/2;

	_posX = -1;
	_posY = -1;
	_rds = 1;

	_lz = objNull;
	_i = "";
	_found = false;

	while {_rds < 300} do
		{
		//_isFlat = _pos isFlatEmpty [30,_rds,1.5,30,0,false,objNull];
		_isFlat = [_pos, 0, _rds, ((RYD_HAS_SafetyMargin + _mSize) max 0), 0, 0.3, 0,[],[[-1,-1],[-1,-1]]] call BIS_fnc_findSafePos;

		if (({not (_x < 0)} count _isFlat) == 2) exitWith
			{
			_found = true;
			_posX = _isFlat select 0;
			_posY = _isFlat select 1;
			
			if (_makeLZ) then
				{
				_lz = createVehicle ["Land_HelipadEmpty_F", [_posX,_posY,0], [], 0, "NONE"]
				};
			
			if (_mark isEqualTo "") then
				{
				_mark = "LZ_mark";
				_mark = createMarker [_mark,[_posX,_posY]];
				_mark setMarkerColor "ColorGreen";
				_mark setMarkerShape "ICON";
				_mark setMarkerType "mil_pickup";
				_mark setMarkerSize [0.75,0.75];
				}
			else
				{
				_mark setMarkerPos [_posX,_posY]
				}
			};

		_rds = _rds + 25;
		};
		
	if not (_found) then
		{
		"WARNING!\nNo clear LZ found in 300m radius. Landing risky." remoteExec ["hint"];
		_posX = _pos select 0;
		_posY = _pos select 1;		
		
		if (_makeLZ) then
			{
			_lz = createVehicle ["Land_HelipadEmpty_F", [_posX,_posY,0], [], 0, "NONE"]
			};
		
		if (_mark isEqualTo "") then
			{
			_mark = "LZ_mark";
			_mark = createMarker [_mark,[_posX,_posY]];
			_mark setMarkerColor "ColorGreen";
			_mark setMarkerShape "ICON";
			_mark setMarkerType "mil_pickup";
			_mark setMarkerSize [0.75,0.75];
			}
		else
			{
			_mark setMarkerPos [_posX,_posY]
			}		
		};

	[_lz,_mark]
	};
	
RYD_HAS_isDaylight =
	{
	private _arr = date call BIS_fnc_sunriseSunsetTime;
	((((_arr select 0) - 0.4 + (overcast/10)) < (dayTime)) and {(((_arr select 1) + 0.5 - (overcast/30)) > (dayTime))})
	};
	
RYD_HAS_atFired = 
	{
	_ammotype = _this select 4;
	if not (RYD_HAS_wasCalled) exitWith {};
	
	_signalClasses = if ([] call RYD_HAS_isDaylight) then
		{
		RYD_HAS_SignalClassesDay
		}
	else
		{
		RYD_HAS_SignalClassesNight
		};
	
	_proper = false;
	
		{
		_proper = _ammotype isKindOf _x;
		if (_proper) exitWith {};
		}
	foreach _signalClasses;
	if not (_proper) exitWith {};
	
	RYD_HAS_wasSignal = true;
	};
	
RYD_HAS_ClearUnits = 
	{
		{
		if ((isNull _x) or {not (alive _x)}) then
			{
			RYD_HAS_STT set [_foreachIndex,objNull];
			}
		}
	foreach RYD_HAS_STT;
	RYD_HAS_STT = RYD_HAS_STT - [objNull];
	publicVariable "RYD_HAS_STT";
	};
	
RYD_HAS_ClearHelis = 
	{	
		{
		if ((isNull _x) or {not (alive _x)}) then
			{
			if (not (isNull _x) and {not (RYD_HAS_RespawnHelis == 0)}) then
				{
				[_x] call RYD_HAS_RespawnHeliCheck
				};
			
			RYD_HAS_allChoppers set [_foreachIndex,objNull];
			}
		}
	foreach RYD_HAS_allChoppers;
	RYD_HAS_allChoppers = RYD_HAS_allChoppers - [objNull];
	publicVariable "RYD_HAS_allChoppers";
	};
	
RYD_HAS_DetectSignal = 
	{
	private ["_pos","_radius","_classes","_nO","_clO","_obj"];
	
	_pos = _this select 0;
	_radius = _this select 1;
	_classes = _this select 2;

	_nO = nearestObjects [_pos, [], _radius,true];
	_clO = objNull;
		
		{
		_obj = _x;
		if (({_obj isKindOf _x} count _classes) > 0) exitWith
			{
			_clO = _obj
			}
		}
	foreach _nO;

	_clO
	};
	
RYD_HAS_FindClosestAbleHeli = 
	{
	private ["_pos","_helis","_cl","_first","_dstMin","_dstAct","_box","_varName","_maxPriority","_actPriority"];
	
	_pos = _this select 0;
	_helis = +(_this select 1);
	_box = _this select 2;
	
	_varName = if (isNull _box) then
		{
		"RYD_HAS_TransportPriority"
		}
	else
		{
		"RYD_HAS_SupplyPriority"
		};
		
		{
		if ((_x getVariable [_varName,0]) < 0) then
			{
			_helis set [_foreachindex,objNull]
			}
		}
	foreach _helis;
	
	_helis = _helis - [objNull];
	
	if ((count _helis) < 1) exitWith
		{
		objNull
		};
	
	_cl = objNull;
	_first = _helis select 0;
	_maxPriority = 0;

	_dstMin = 1000000;

		{		
		_dstAct = _pos distance _x;

		if (not (isNull _x) and {(alive _x) and {(canMove _x) and {((fuel _x) > 0) and {not (isNull (driver _x)) and {(alive (driver _x))}}}}}) then
			{
			if (((((_x emptyPositions "cargo") >= (count RYD_HAS_STT)) or {not (RYD_HAS_radioCalled)}) and {(isNull _box)}) or {not (isNull _box) and {(_x canSlingLoad _box) or {(RYD_HAS_IgnoreAbilityCheck)}}}) then		
				{
				_actPriority = _x getVariable [_varName,0];
				if (_actPriority > 0) then
					{
					if (_actPriority > _maxPriority) then
						{
						_cl = _x;
						_dstMin = _dstAct;
						_maxPriority = _actPriority
						}
					else
						{
						if (_actPriority == _maxPriority) then
							{
							if (_dstAct < _dstMin) then
								{
								_cl = _x;
								_dstMin = _dstAct
								}
							}
						}
					}
				else
					{				
					if ((_dstAct < _dstMin) and {(_maxPriority == 0)}) then
						{
						_cl = _x;
						_dstMin = _dstAct
						}
					}
				}
			}
		}
	foreach _helis;

	_cl
	};
	
RYD_HAS_FindCASAbleHeli = 
	{
	private ["_pos","_helis","_AT","_cl","_first","_dstMin","_dstAct","_maxPriority","_actPriority","_isAT","_gunner"];

	_pos = _this select 0;
	_helis = +(_this select 1);
	_AT = _this select 2;

		{
		if (((_x getVariable ["RYD_HAS_CASPriority",0]) < 0) or {not (alive _x)}) then
			{
			_helis set [_foreachindex,objNull]
			}
		}
	foreach _helis;
	
	_helis = _helis - [objNull];
	
	if ((count _helis) < 1) exitWith
		{
		objNull
		};
	
	_cl = objNull;
	_first = _helis select 0;
	_maxPriority = 0;

	_dstMin = 1000000;

		{
		_gunner = gunner _x;
		if ((count (fullCrew [_x,"gunner",true])) < 1) then
			{
			_gunner = driver _x
			};
			
		_dstAct = _pos distance _x;

		if (not (isNull _x) and {(alive _x) and {(canMove _x) and {((fuel _x) > 0) and {not (isNull (driver _x)) and {(alive (driver _x)) and not (isNull _gunner) and {(alive _gunner)}}}}}}) then
			{
			_actPriority = _x getVariable ["RYD_HAS_CASPriority",0];
			_isAT = _x getVariable ["RYD_HAS_isAT",false];

			if ((_AT) and {_isAT}) then
				{
				_actPriority = _actPriority + 1000
				};
	
			if (_actPriority > 0) then
				{
				if (_actPriority > _maxPriority) then
					{
					_cl = _x;
					_dstMin = _dstAct;
					_maxPriority = _actPriority
					}
				else
					{
					if (_actPriority == _maxPriority) then
						{
						if (_dstAct < _dstMin) then
							{
							_cl = _x;
							_dstMin = _dstAct
							}
						}
					}
				}
			else
				{
				if ((_dstAct < _dstMin) and {(_maxPriority == 0)}) then
					{
					_cl = _x;
					_dstMin = _dstAct
					}
				}
			};
		}
	foreach _helis;

	_cl
	};
	
RYD_HAS_Signal = 
	{
	params ["_signalClasses","_pickPos","_isLanding","_rds"];

	_wps = [RYD_HAS_Chopper] call RYD_HAS_ExecuteRoute;
	if ((count _signalClasses) > 0) then
		{
		private _gp = group RYD_HAS_Chopper;
		_wp = _gp addWaypoint [_pickPos, 300];
		_wp setWaypointType "MOVE";
		
		_wp = _gp addWaypoint [(waypointPosition _wp), 0];
		_wp setWaypointType "LOITER";
		_wp setWaypointLoiterType "CIRCLE";
		_wp setWaypointLoiterRadius _rds;
				
		waitUntil
			{
			sleep 1;
			_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
			if not (_alive) exitWith {true};	
			if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};	
			if (RYD_HAS_CallCancelled) exitWith {true};
			
			if not (RYD_HAS_CruisingSpeed < 10) then
				{
				[RYD_HAS_Chopper] call RYD_HAS_TurningSpeed
				};
			
			(((RYD_HAS_Chopper distance2D _pickPos) < RYD_HAS_SignReqDst) and {(currentWaypoint _gp) isEqualTo (((waypoints _gp) select (((count (waypoints _gp)) - 1) max 0)) select 1)})
			};
			
		if not (_alive) exitWith {};
		if (_unable) exitWith {};
		if (RYD_HAS_CallCancelled) exitWith {};
		
		_sgn = [_pickPos,RYD_HAS_SignalSearchRadius,_signalClasses] call RYD_HAS_DetectSignal;
		_wasSgn = not (isNull _sgn);
		_ehIx = -1;
		RYD_HAS_PickPos = _pickPos;
		
		if not (_wasSgn) then
			{
			//_ehIx = RYD_HAS_Caller addEventHandler ["Fired",{_this spawn RYD_HAS_atFired}];
			RYD_HAS_tooLong = false;
			
			[_signalClasses] spawn
				{
				_signalClasses = _this select 0;
				_tStamp = time;
				while {not RYD_HAS_tooLong} do
					{
					sleep 2;
					_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
					if not (_alive) exitWith {};	
					if not ([] call RYD_HAS_ifChopperReady) exitWith {};
					if (RYD_HAS_CallCancelled) exitWith {};
					
					_sgn = [RYD_HAS_PickPos,RYD_HAS_SignalSearchRadius,_signalClasses] call RYD_HAS_DetectSignal;
					
					if not (isNull _sgn) exitWith
						{
						RYD_HAS_PickPos = position _sgn;
						RYD_HAS_wasSignal = true;
						};
					
					if (RYD_HAS_signalTimeLimit > 0) then
						{
						RYD_HAS_tooLong = ((time - _tStamp) > RYD_HAS_signalTimeLimit)
						}
					};
				};				
			
			if (RYD_HAS_AddHints) then
				{
				//Hint "Chopper is approaching. Mark your position!";
				"Chopper is approaching. Mark your position!" remoteExec ["hint"]; 
				};
				
			if (not (RYD_HAS_VoiceChat) or {not (_isLanding)}) then
				{
				_txt = if (_isLanding) then
					{
					(selectRandom RYD_HAS_sent_SignalReq)
					}
				else
					{
					(selectRandom RYD_HAS_sent_SignalReq_sc)
					};
				
				if ([] call RYD_HAS_isDaylight) then
					{
					_txt = _txt + " Use daylight signal."
					}
				else
					{
					_txt = _txt + " Use night signal."
					};					
				
				//(driver RYD_HAS_Chopper) customChat [RYD_HAS_PilotChannel,_txt];
				[(driver RYD_HAS_Chopper),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
				if (true) then//if (player in RYD_HAS_STT) then
					{
					//playSound "TacticalPing3";
					"TacticalPing3" remoteExec ["playSound",RYD_HAS_Caller];
					}
				}
			else
				{
				if ([] call RYD_HAS_isDaylight) then
					{
					//hint "Use daylight signal."
					"Use daylight signal." remoteExec ["hint"]; 
					}
				else
					{
					//hint "Use night signal."
					"Use night signal." remoteExec ["hint"]; 
					};					
				};
									
			waitUntil
				{
				sleep 1;
				_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
				if not (_alive) exitWith {true};
				if (not ([] call RYD_HAS_ifChopperReady) or {RYD_HAS_tooLong}) exitWith {_unable = true;true};
				if (RYD_HAS_CallCancelled) exitWith {true};
				
				(RYD_HAS_wasSignal)
				};
				
			RYD_HAS_wasSignal = false;
			_pickPos = RYD_HAS_PickPos;
			//RYD_HAS_Caller removeEventHandler ["Fired",_ehIx];					
			}
		else
			{
			_pickPos = position _sgn
			};
					
		if not (_alive) exitWith {};
		if (_unable) exitWith {};
		if (RYD_HAS_CallCancelled) exitWith {};
			
		sleep (10 + (random 5));	
		if ((isNull RYD_HAS_Chopper) or {not (alive RYD_HAS_Chopper) or {(isNull (driver RYD_HAS_Chopper)) or {not (alive (driver RYD_HAS_Chopper)) or {not (canMove RYD_HAS_Chopper)}}}}) exitWith//if not ((alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)}) exitWith
			{
			_alive = false;
			};
			
		_unable = not ([] call RYD_HAS_ifChopperReady);
		if (_unable) exitWith {};
		if (RYD_HAS_CallCancelled) exitWith {};
		
		RYD_HAS_AltLZ = false;
		
		if (_isLanding) then
			{
			_helipadArr = [_pickPos,"",true,RYD_HAS_Chopper] call RYD_HAS_LZ;
			while {isNull (_helipadArr select 0)} do
				{
				RYD_HAS_AltLZ = true;
				if not (RYD_HAS_VoiceChat) then
					{
					_txt = selectRandom RYD_HAS_sent_noLZ;
				
					//(driver RYD_HAS_Chopper) customChat [RYD_HAS_PilotChannel,_txt];
					[(driver RYD_HAS_Chopper),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
					if (true) then//if (player in RYD_HAS_STT) then
						{
						//playSound "TacticalPing3";
						"TacticalPing3" remoteExec ["playSound",RYD_HAS_Caller];
						}
					}
				else
					{
					//hint "No suitable LZ. Point new coords on the map."
					"No suitable LZ. Point new coords on the map." remoteExec ["hint"]; 
					};	

				RYD_HAS_noRoute = true;
				publicVariable "RYD_HAS_noRoute";				
				RYD_HAS_clickedPos = [];	
				//["RYD_HAS_HeliTnoLZ","onMapSingleClick","RYD_HAS_MapPoint"] call BIS_fnc_addStackedEventHandler;
				[["RYD_HAS_HeliTnoLZ","onMapSingleClick","RYD_HAS_MapPoint"],BIS_fnc_addStackedEventHandler] remoteExec ["call",RYD_HAS_Caller];
								
				waitUntil
					{
					sleep 0.1;
					_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
					if not (_alive) exitWith {true};
					if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};
					if (RYD_HAS_CallCancelled) exitWith {true};

					((count RYD_HAS_clickedPos) > 1)						
					};	
				
				//["RYD_HAS_HeliTnoLZ", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
				[["RYD_HAS_HeliTnoLZ", "onMapSingleClick"],BIS_fnc_removeStackedEventHandler] remoteExec ["call",RYD_HAS_Caller];
				if not (_alive) exitWith {};
				if (_unable) exitWith {};
				if (RYD_HAS_CallCancelled) exitWith {};
				
				_helipadArr = [RYD_HAS_clickedPos,"",true,RYD_HAS_Chopper] call RYD_HAS_LZ;
				
				sleep (2 + (random 2))
				};

			_heliPad = _helipadArr select 0;
			_lzMark = _helipadArr select 1;
			_pickPos = position _helipad;
			};
		
		if (RYD_HAS_AddHints) then
			{
			//Hint "Signal spotted!";
			"Signal spotted!" remoteExec ["hint"]; 
			};
			
		if (not (RYD_HAS_VoiceChat) or {not (_isLanding)}) then
			{
			_sentArr = if not (RYD_HAS_AltLZ) then
				{
				if (_isLanding) then
					{
					RYD_HAS_sent_SignalSpot
					}
				else
					{
					RYD_HAS_sent_SignalSpot_sc
					}
				}
			else
				{
				RYD_HAS_sent_AltCoordsConfirmed
				};
				
			_txt = selectRandom _sentArr;
			//(driver RYD_HAS_Chopper) customChat [RYD_HAS_PilotChannel,_txt];
			[(driver RYD_HAS_Chopper),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
			if (true) then//if (player in RYD_HAS_STT) then
				{
				//playSound "TacticalPing3";
				"TacticalPing3" remoteExec ["playSound",RYD_HAS_Caller];
				}
			};				
		};
		
	_pickPos
	};

RYD_HAS_AscentCounter = 
	{
	if not (RYD_HAS_ForceDescent) exitWith {};//disabled
	private _vel = velocity RYD_HAS_Chopper;
	private _lvl2 = (position RYD_HAS_Chopper) select 2;

	if (((_vel select 2) > 0) and {(([0,0,0] distance2D _vel) < 10)}) then
		{
		RYD_HAS_Chopper setVelocity [(_vel select 0),(_vel select 1),(-(_vel select 2) max (-(_lvl2/1.1)))]
		};	
	};
	
RYD_HAS_AutoGuide = 
	{
	if (RYD_TI_ControlTI) exitWith {};
	
	params ["_heli","_lvl","_var","_refPos","_tol","_vMpl"];
	
	private _vel = velocity RYD_HAS_Chopper;
	private _lvl2 = (getPos RYD_HAS_Chopper) select 2;

	private _vel0 = random ((random (2 * _var)) - _var);
	private _vel1 = random ((random (2 * _var)) - _var);
	private _vel2 = random ((random (2 * _var)) - _var);
	
	private _dst = _heli distance2D _refPos;
	
	if (_dst > _tol) then
		{
		private _vect = (position _heli) vectorFromTo _refPos;
		private _spd = ((_dst - 1) max 1) min 10;
		_vel0 = _vel0 + ((_vect select 0) * _spd);
		_vel1 = _vel1 + ((_vect select 1) * _spd);
		};
		
	_heli setVelocity [_vel0,_vel1,_vel2 + ((((_lvl - _lvl2) max (-(_lvl2 * 0.1) max (-2 min -((_lvl2^0.6)/3)))) min (((_vel select 2) max 0) * 1.1)) * _vMpl)]	
	};
	
RYD_HAS_AutoGuideB = 
	{
	if (RYD_TI_ControlTI) exitWith {};
	
	params ["_heli","_lvl","_var","_refPos","_tol","_vMpl","_frc"];
		
	private _vel = velocity RYD_HAS_Chopper;
	private _lvl2 = (getPos RYD_HAS_Chopper) select 2;

	private _vel0 = random ((random (2 * _var)) - _var);
	private _vel1 = random ((random (2 * _var)) - _var);
	private _vel2 = random ((random (2 * _var)) - _var);
	
	private _dst = _heli distance2D _refPos;
	
	if (_dst > _tol) then
		{
		private _vect = (position _heli) vectorFromTo _refPos;
		private _spd = ((_dst - 1) max 1) min 10;
		_vel0 = _vel0 + ((_vect select 0) * _spd * _vMpl);
		_vel1 = _vel1 + ((_vect select 1) * _spd * _vMpl);
		};
		
	_heli setVelocity [((_vel select 0) * _frc) + (_vel0 * (1 - _frc)),((_vel select 1) * _frc) + (_vel1 * (1 - _frc)),((_vel select 2) * _frc) + ((_vel2 + ((((_lvl - _lvl2) max (-(_lvl2 * 0.5) max (-2 min -((_lvl2^0.6)/3)))) min (((_vel select 2) max 0) * 1.1)) * _vMpl)) * (1 - _frc))]	
	};
	
RYD_HAS_HeliRTB = 
	{
	RYD_HAS_Hooked = false; publicVariable "RYD_HAS_Hooked";
	
		{
		deleteWaypoint _x
		}
	foreach RYD_HAS_wps;	
	
	_hG = group RYD_HAS_Chopper;

	 while {(count (waypoints _hG)) > 0} do
		 {
		 deleteWaypoint ((waypoints _hG) select 0);
		 };
		 
	detach RYD_HAS_box;

		{
		RYD_HAS_box ropeDetach _x;
		ropeDestroy _x;						
		}
	foreach (ropes RYD_HAS_Chopper);

	RYD_HAS_box allowDamage true;
	RYD_HAS_box = objNull;
	
	RYD_HAS_done = false;
	RYD_HAS_Chopper land "NONE";
	RYD_HAS_Chopper flyInHeight RYD_HAS_ChopperLvl;
	_alive = true;
	_unable = false;
	
	if not (RYD_HAS_FastReady) then
		{	
		private _wps = [RYD_HAS_Chopper,[(group RYD_HAS_Chopper),-1],true,true] call RYD_HAS_ExecuteRoute;
		private _wp = group RYD_HAS_Chopper addWaypoint [(position RYD_HAS_Base), 50];
		_wp setWaypointType "MOVE";
		_wp setWaypointStatements ["true", "RYD_HAS_Chopper land 'land';(group this) setBehaviour RYD_HAS_oldBeh;(group this) setCombatMode RYD_HAS_oldCM;RYD_HAS_done = true;"];
		_wps pushBack _wp;
		group RYD_HAS_Chopper setCurrentWaypoint (_wps select 0);	
		
		if ((count _this) > 0) then
			{
			_this spawn
				{
				params ["_mark"];
				
				sleep 15;
				
				deleteMarker _mark;
				}
			};
		
		waitUntil
			{
			sleep 0.1;
			_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
			
			if not (_alive) exitWith {true};

			if not (RYD_HAS_CruisingSpeed < 10) then
				{
				[RYD_HAS_Chopper] call RYD_HAS_TurningSpeed
				};		
			
			((RYD_HAS_done) and {(((getPos RYD_HAS_Chopper) select 2) < 4)})
			};
		};
		
	if not (_alive) exitWith
		{
		[] call RYD_HAS_atDestroy
		};

	if not (RYD_HAS_FastReady) then
		{		
		if (RYD_HAS_AutoInOut) then
			{
			[] call RYD_HAS_AutoDisembark
			};
		
		waitUntil 
			{
			sleep 1;
			_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
			
			if not (_alive) exitWith {true};
			if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};
			if ((toLower (landResult RYD_HAS_Chopper)) in ["found"]) then
				{
				[] call RYD_HAS_AscentCounter
				};		

			((isTouchingGround RYD_HAS_Chopper) and {(({((alive _x) and {_x in RYD_HAS_Chopper})} count RYD_HAS_STT) == 0)})
			};
		};

	RYD_HAS_delivered = false;
	publicVariable "RYD_HAS_delivered";		
		
	if not (_alive) exitWith
		{
		[] call RYD_HAS_atDestroy
		};
	
	if not (RYD_HAS_FastReady) then
		{
		RYD_HAS_Chopper engineOn false;
		};
			
	if (((RYD_HAS_Limit - RYD_HAS_UseCount) > 0) and {not (RYD_HAS_Limit < 0)}) then
		{
		//hint format ["Chopper available, %1 calls left.",(RYD_HAS_Limit - RYD_HAS_UseCount)];
		(format ["Chopper available, %1 calls left.",(RYD_HAS_Limit - RYD_HAS_UseCount)]) remoteExec ["hint"]; 
		}
	else
		{
		if not (RYD_HAS_Limit < 0) then
			{
			if (RYD_HAS_RemoveAtLimit) then
				{
					{
					//_x removeAction (_x getVariable ["RYD_HAS_myCallAction",-1]);
					[_x,(_x getVariable ["RYD_HAS_myCallAction",-1])] remoteExec ["removeAction",_x];
					//_x removeAction (_x getVariable ["RYD_HAS_myCallAction2",-1]);
					[_x,(_x getVariable ["RYD_HAS_myCallAction2",-1])] remoteExec ["removeAction",_x];
					//_x removeAction (_x getVariable ["RYD_HAS_myCallCancelAction",-1]);
					[_x,(_x getVariable ["RYD_HAS_myCallCancelAction",-1])] remoteExec ["removeAction",_x];
					//_x removeAction (_x getVariable ["RYD_HAS_myCeiligUpAction50",-1]);
					[_x,(_x getVariable ["RYD_HAS_myCeiligUpAction50",-1])] remoteExec ["removeAction",_x];
					//_x removeAction (_x getVariable ["RYD_HAS_myCeiligDownAction50",-1]);
					[_x,(_x getVariable ["RYD_HAS_myCeiligDownAction50",-1])] remoteExec ["removeAction",_x];
					//_x removeAction (_x getVariable ["RYD_HAS_myCeiligUpAction250",-1]);
					[_x,(_x getVariable ["RYD_HAS_myCeiligUpAction250",-1])] remoteExec ["removeAction",_x];
					//_x removeAction (_x getVariable ["RYD_HAS_myCeiligDownAction250",-1]);
					[_x,(_x getVariable ["RYD_HAS_myCeiligDownAction250",-1])] remoteExec ["removeAction",_x];
					}
				foreach RYD_HAS_STT
				};
				
			//hint "Transport support completed. No more calls left!"
			"Transport support completed. No more calls left!" remoteExec ["hint"]; 
			}
		};
	
	if not (RYD_HAS_FastReady) then
		{
		_hG = group RYD_HAS_Chopper;

		 while {(count (waypoints _hG)) > 0} do
			 {
			 deleteWaypoint ((waypoints _hG) select 0);
			 };

		[] call RYD_HAS_ClearRoute;
		};
	
	RYD_HAS_Caller removeMPEventHandler ["MPKilled",RYD_HAS_kEHIx];
	removeMissionEventHandler ["HandleDisconnect",RYD_HAS_dEHIx];
	RYD_HAS_wasCalled = false; publicVariable "RYD_HAS_wasCalled";
	RYD_HAS_radioCalled = false; publicVariable "RYD_HAS_radioCalled";
	
	if (RYD_HAS_FastReady) then
		{	
		private _wps = [RYD_HAS_Chopper,[(group RYD_HAS_Chopper),-1],true,true] call RYD_HAS_ExecuteRoute;
		private _wp = group RYD_HAS_Chopper addWaypoint [(position RYD_HAS_Base), 50];
		_wp setWaypointType "MOVE";
		_wp setWaypointStatements ["true", "RYD_HAS_Chopper land 'land';(group this) setBehaviour RYD_HAS_oldBeh;(group this) setCombatMode RYD_HAS_oldCM;RYD_HAS_done = true;"];
		_wps pushBack _wp;
		group RYD_HAS_Chopper setCurrentWaypoint (_wps select 0);	
		
		if ((count _this) > 0) then
			{
			_this spawn
				{
				params ["_mark"];
				
				sleep 15;
				
				deleteMarker _mark;
				}
			};
		
		waitUntil
			{
			sleep 0.1;
			_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
			
			if not (_alive) exitWith {true};

			if not (RYD_HAS_CruisingSpeed < 10) then
				{
				[RYD_HAS_Chopper] call RYD_HAS_TurningSpeed
				};		
			
			(((RYD_HAS_done) and {(((getPos RYD_HAS_Chopper) select 2) < 4)}) or {(RYD_HAS_wasCalled)})
			};
			
		if not (_alive) exitWith
			{
			[] call RYD_HAS_atDestroy
			};
			
		if (RYD_HAS_wasCalled) exitWith {};
			
		if (RYD_HAS_AutoInOut) then
			{
			[] call RYD_HAS_AutoDisembark
			};
		
		waitUntil 
			{
			sleep 1;
			_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
			
			if not (_alive) exitWith {true};
			if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};
			if ((toLower (landResult RYD_HAS_Chopper)) in ["found"]) then
				{
				[] call RYD_HAS_AscentCounter
				};		

			(((isTouchingGround RYD_HAS_Chopper) and {(({((alive _x) and {_x in RYD_HAS_Chopper})} count RYD_HAS_STT) == 0)}) or {(RYD_HAS_wasCalled)})
			};
			
		if not (_alive) exitWith
			{
			[] call RYD_HAS_atDestroy
			};
			
		if ((RYD_HAS_wasCalled) and {not (_unable)}) exitWith {};

		RYD_HAS_Chopper engineOn false;	
		
		_hG = group RYD_HAS_Chopper;

		 while {(count (waypoints _hG)) > 0} do
			 {
			 deleteWaypoint ((waypoints _hG) select 0);
			 };
			 
		[] call RYD_HAS_ClearRoute;	
		
		RYD_HAS_wasCalledFast = false; publicVariable "RYD_HAS_wasCalledFast";
		}
	else
		{
		RYD_HAS_wasCalledFast = false; publicVariable "RYD_HAS_wasCalledFast";
		};
	};
	
RYD_HAS_atDestroy = 
	{
	RYD_HAS_Hooked = false; publicVariable "RYD_HAS_Hooked";
	
		{
		deleteWaypoint _x
		}
	foreach RYD_HAS_wps;
	
	[] call RYD_HAS_ClearRoute;
	RYD_HAS_wasCalled = false; publicVariable "RYD_HAS_wasCalled";
	RYD_HAS_wasCalledFast = false; publicVariable "RYD_HAS_wasCalledFast";
	RYD_HAS_radioCalled = false; publicVariable "RYD_HAS_radioCalled";
	
	if (RYD_HAS_AddHints) then
		{
		//hint "Chopper is down!";
		"Chopper is down!" remoteExec ["hint"]; 
		};
		
	if (RYD_HAS_VoiceChat) then
		{
		RYD_HAS_Base kbTell [RYD_HAS_Caller, "BIS_SUPP_protocol", "Transport_Destroyed", ""];
		}
	else
		{
		_txt = selectRandom RYD_HAS_sent_Destroyed;
		//RYD_HAS_Base customChat [RYD_HAS_HQChannel,_txt];
		[RYD_HAS_Base,[RYD_HAS_HQChannel,_txt]] remoteExec ["customChat"];
		if (true) then//if (player in RYD_HAS_STT) then
			{
			//playSound "TacticalPing4";
			"TacticalPing4" remoteExec ["playSound",RYD_HAS_Caller];
			}
		};
	};
	
RYD_HAS_ifChopperReady = 
	{
	private ["_mags","_gunner","_isAmmo","_cm","_vehMags","_ammo"];
	
	_gunner = gunner RYD_HAS_Chopper;
	if ((count (fullCrew [RYD_HAS_Chopper,"gunner",true])) < 1) then
		{
		_gunner = driver RYD_HAS_Chopper
		};
		
	_isAmmo = false;
	if not (isNull _gunner) then
		{
		_cm = currentMuzzle _gunner;			
		_vehMags = magazines RYD_HAS_Chopper;
		if not ((typeName _cm) isEqualTo (typeName "")) then
			{
			_cm = currentWeapon RYD_HAS_Chopper
			};
			
		_ammo = RYD_HAS_Chopper ammo _cm;

			{
			_mags = getArray (configFile >> "CfgWeapons" >> _x >> "magazines");
			_isAmmo = not ((_ammo < 1) and {(({(_x in _vehMags)} count _mags) < 1)});
			if (_isAmmo) exitWith {};
			}
		foreach (RYD_HAS_Chopper getVariable ["RYD_HAS_myWeapons",[]]);
		};
		
	(not (isNull RYD_HAS_Chopper) and {(alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper) and {((fuel RYD_HAS_Chopper) > 0) and {not (isNull (driver RYD_HAS_Chopper)) and {(alive (driver RYD_HAS_Chopper)) and {not (RYD_HAS_UnitsGone) and {(not (RYD_HAS_isCASRun) or {(_isAmmo) and {not (isNull _gunner) and {(alive _gunner)}}})}}}}}}})
	};
	
RYD_HAS_allIn = 
	{
	private _heli = objNull;
	
		{
		private _chopper = _x;
		if ((not (isNull _chopper) and {(alive _chopper) and {not (isNull (driver _chopper)) and {(alive (driver _chopper))}}})) then
			{
			if (({((_x in _chopper) and {((_x getVariable ["RYD_HAS_canCall",true]))})} count RYD_HAS_STT) > 0) then
				{
				_heli = _chopper
				};
			};
			
		if not (isNull _heli) exitWith {};
		}
	foreach RYD_HAS_allChoppers;
	
	_heli
	};

RYD_HAS_atEnterLoop = 
	{
	while {RYD_HAS_whenInside} do
		{
		sleep 1;
		if not (RYD_HAS_whenInside) exitWith {};
		
		if ((RYD_HAS_UseCount < RYD_HAS_Limit) or {(RYD_HAS_Limit < 0)}) then
			{
			[] call RYD_HAS_ClearUnits;
			[] call RYD_HAS_ClearHelis;
			if (not ((RYD_HAS_wasCalled) or {(RYD_HAS_wasCalledFast)}) and 
				{(({(not (isNull _x) and {(alive _x) and {not (isNull (driver _x)) and {(alive (driver _x)) and {not (RYD_HAS_UnitsGone)}}}})} count RYD_HAS_allChoppers) > 0)}) then
				{
				_heli = [] call RYD_HAS_allIn;
				if not (isNull _heli) then
					{
					[_heli] call RYD_HAS_atCalled
					}
				}
			}
		}
	};
	
RYD_HAS_atDisconnect = 
	{
	params ["_unit", "_id", "_uid", "_name"];

	if not (_unit isEqualTo RYD_HAS_Caller) exitWith {};

	RYD_HAS_Caller removeMPEventHandler ["MPKilled",RYD_HAS_kEHIx];
	//removeMissionEventHandler ["HandleDisconnect",RYD_HAS_dEHIx];
	[] call RYD_HAS_ClearUnits;
	if ((count RYD_HAS_STT) < 1) exitWith {RYD_HAS_UnitsGone = true;publicVariableServer "RYD_HAS_UnitsGone"};
	private _found = false;
	
		{
		if (not (isNull _x) and {(alive _x) and {(isPlayer _x)}}) exitWith
			{
			RYD_HAS_Caller = _x;
			_found = true;
			};
		}
	foreach RYD_HAS_STT;
	
	if not (_found) then 
		{
		RYD_HAS_Caller = RYD_HAS_STT select 0;
		};

	publicVariable "RYD_HAS_Caller";
	//hint format ["New caller unit: %1",((toLower (rank RYD_HAS_Caller)) + " " + (name RYD_HAS_Caller))];
	(format ["New caller unit: %1",((toLower (rank RYD_HAS_Caller)) + " " + (name RYD_HAS_Caller))]) remoteExec ["hint"]; 
	RYD_HAS_kEHIx = RYD_HAS_Caller addMPEventHandler ["MPKilled",RYD_HAS_atKilled];
	publicVariable "RYD_HAS_kEHIx";
	//RYD_HAS_dEHIx = addMissionEventHandler ["HandleDisconnect",{nul = _this spawn RYD_HAS_atDisconnect}];
	//publicVariable "RYD_HAS_dEHIx";
	
	if (RYD_HAS_DecisionTime) then
		{
		//RYD_HAS_aID2 = RYD_HAS_Caller addAction ["<t color='#fe8701'>Transport to another location</t>", "RYD_HAS_Map = true", true, 1, true, true, "", ""];
		//[RYD_HAS_Caller,["<t color='#fe8701'>Transport to another location</t>", "RYD_HAS_Map = true;publicVariableServer 'RYD_HAS_Map';RYD_HAS_aID2 = _this select 2;publicVariableServer 'RYD_HAS_aID2';", true, 1, true, true, "", ""]] remoteExec ["addAction",RYD_HAS_Caller];
		[RYD_HAS_Caller,["<t color='#fe8701'>Transport to another location (touchdown)</t>", "RYD_HAS_Map = true;publicVariableServer 'RYD_HAS_Map';RYD_HAS_Corr = true;publicVariableServer 'RYD_HAS_Corr';RYD_HAS_wasFastRoping = RYD_HAS_FastRoping;publicVariableServer 'RYD_HAS_wasFastRoping';RYD_HAS_FastRoping = false;publicVariable 'RYD_HAS_FastRoping';", true, 1, true, true, "", "not RYD_HAS_NewDestinationPending"],"RYD_HAS_myTTLAction"] remoteExec ["RYD_HAS_AddAction",RYD_HAS_Caller];
		[RYD_HAS_Caller,["<t color='#fe8701'>Transport to another location (fast rope)</t>", "RYD_HAS_Map = true;publicVariableServer 'RYD_HAS_Map';RYD_HAS_Corr = true;publicVariableServer 'RYD_HAS_Corr';RYD_HAS_wasFastRoping = RYD_HAS_FastRoping;publicVariableServer 'RYD_HAS_wasFastRoping';RYD_HAS_FastRoping = true;publicVariable 'RYD_HAS_FastRoping';", true, 1, true, true, "", "not RYD_HAS_NewDestinationPending"],"RYD_HAS_myTTLActionB"] remoteExec ["RYD_HAS_AddAction",RYD_HAS_Caller];
		if (RYD_HAS_RadioCalled) then
			{
			//RYD_HAS_aID = RYD_HAS_Caller addAction ["<t color='#fe8701'>RTB</t>", "RYD_HAS_RTB = true", true, 1, true, true, "", ""];
			//[RYD_HAS_Caller,["<t color='#fe8701'>RTB</t>", "RYD_HAS_RTB = true;publicVariableServer 'RYD_HAS_RTB';RYD_HAS_aID = _this select 2;publicVariableServer 'RYD_HAS_aID';", true, 1, true, true, "", ""]] remoteExec ["addAction",RYD_HAS_Caller]; 
			[RYD_HAS_Caller,["<t color='#fe8701'>RTB</t>", "RYD_HAS_RTB = true;publicVariableServer 'RYD_HAS_RTB';", true, 1, true, true, "", ""],"RYD_HAS_myRTBAction"] remoteExec ["RYD_HAS_AddAction",RYD_HAS_Caller];
			};
		};
		
	if (RYD_HAS_CASPatternChoice) then
		{
		[RYD_HAS_Caller,["<t color='#fe8701'>CAS pattern: HOVER</t>", "RYD_HAS_CAS_isHover = true;publicVariableServer 'RYD_HAS_CAS_isHover';", true, 1, true, true, "", "not RYD_HAS_CAS_isHover"],"RYD_HAS_myTTLAction"] remoteExec ["RYD_HAS_AddAction",RYD_HAS_Caller];
		[RYD_HAS_Caller,["<t color='#fe8701'>CAS pattern: SAD</t>", "RYD_HAS_CAS_isSAD = true;publicVariableServer 'RYD_HAS_CAS_isSAD';", true, 1, true, true, "", "not RYD_HAS_CAS_isSAD"],"RYD_HAS_myTTLActionB"] remoteExec ["RYD_HAS_AddAction",RYD_HAS_Caller];		
		}
	};
	
publicVariable "RYD_HAS_atDisconnect";

RYD_HAS_atKilled = 
	{
	if not (local RYD_HAS_Caller) exitWith {};
	
	RYD_HAS_Caller removeMPEventHandler ["MPKilled",RYD_HAS_kEHIx];
	//removeMissionEventHandler ["HandleDisconnect",RYD_HAS_dEHIx];
	[] call RYD_HAS_ClearUnits;
	if ((count RYD_HAS_STT) < 1) exitWith {RYD_HAS_UnitsGone = true;publicVariableServer "RYD_HAS_UnitsGone"};
	private _found = false;
	
		{
		if (not (isNull _x) and {(alive _x) and {(isPlayer _x)}}) exitWith
			{
			RYD_HAS_Caller = _x;
			_found = true;
			};
		}
	foreach RYD_HAS_STT;
	
	if not (_found) then 
		{
		RYD_HAS_Caller = RYD_HAS_STT select 0;
		};

	publicVariable "RYD_HAS_Caller";
	//hint format ["New caller unit: %1",((toLower (rank RYD_HAS_Caller)) + " " + (name RYD_HAS_Caller))];
	(format ["New caller unit: %1",((toLower (rank RYD_HAS_Caller)) + " " + (name RYD_HAS_Caller))]) remoteExec ["hint"]; 
	RYD_HAS_kEHIx = RYD_HAS_Caller addMPEventHandler ["MPKilled",RYD_HAS_atKilled];
	publicVariable "RYD_HAS_kEHIx";
	//RYD_HAS_dEHIx = addMissionEventHandler ["HandleDisconnect",{nul = _this spawn RYD_HAS_atDisconnect}];
	//publicVariable "RYD_HAS_dEHIx";
	
	if (RYD_HAS_DecisionTime) then
		{
		//RYD_HAS_aID2 = RYD_HAS_Caller addAction ["<t color='#fe8701'>Transport to another location</t>", "RYD_HAS_Map = true", true, 1, true, true, "", ""];
		//[RYD_HAS_Caller,["<t color='#fe8701'>Transport to another location</t>", "RYD_HAS_Map = true;publicVariableServer 'RYD_HAS_Map';RYD_HAS_aID2 = _this select 2;publicVariableServer 'RYD_HAS_aID2';", true, 1, true, true, "", ""]] remoteExec ["addAction",RYD_HAS_Caller];
		[RYD_HAS_Caller,["<t color='#fe8701'>Transport to another location (touchdown)</t>", "RYD_HAS_Map = true;publicVariableServer 'RYD_HAS_Map';RYD_HAS_Corr = true;publicVariableServer 'RYD_HAS_Corr';RYD_HAS_wasFastRoping = RYD_HAS_FastRoping;publicVariableServer 'RYD_HAS_wasFastRoping';RYD_HAS_FastRoping = false;publicVariable 'RYD_HAS_FastRoping';", true, 1, true, true, "", "not RYD_HAS_NewDestinationPending"],"RYD_HAS_myTTLAction"] remoteExec ["RYD_HAS_AddAction",RYD_HAS_Caller];
		[RYD_HAS_Caller,["<t color='#fe8701'>Transport to another location (fast rope)</t>", "RYD_HAS_Map = true;publicVariableServer 'RYD_HAS_Map';RYD_HAS_Corr = true;publicVariableServer 'RYD_HAS_Corr';RYD_HAS_wasFastRoping = RYD_HAS_FastRoping;publicVariableServer 'RYD_HAS_wasFastRoping';RYD_HAS_FastRoping = true;publicVariable 'RYD_HAS_FastRoping';", true, 1, true, true, "", "not RYD_HAS_NewDestinationPending"],"RYD_HAS_myTTLActionB"] remoteExec ["RYD_HAS_AddAction",RYD_HAS_Caller];
		if (RYD_HAS_RadioCalled) then
			{
			//RYD_HAS_aID = RYD_HAS_Caller addAction ["<t color='#fe8701'>RTB</t>", "RYD_HAS_RTB = true", true, 1, true, true, "", ""];
			//[RYD_HAS_Caller,["<t color='#fe8701'>RTB</t>", "RYD_HAS_RTB = true;publicVariableServer 'RYD_HAS_RTB';RYD_HAS_aID = _this select 2;publicVariableServer 'RYD_HAS_aID';", true, 1, true, true, "", ""]] remoteExec ["addAction",RYD_HAS_Caller]; 
			[RYD_HAS_Caller,["<t color='#fe8701'>RTB</t>", "RYD_HAS_RTB = true;publicVariableServer 'RYD_HAS_RTB';", true, 1, true, true, "", ""],"RYD_HAS_myRTBAction"] remoteExec ["RYD_HAS_AddAction",RYD_HAS_Caller];
			};
		};
		
	if (RYD_HAS_CASPatternChoice) then
		{
		[RYD_HAS_Caller,["<t color='#fe8701'>CAS pattern: HOVER</t>", "RYD_HAS_CAS_isHover = true;publicVariableServer 'RYD_HAS_CAS_isHover';", true, 1, true, true, "", "not RYD_HAS_CAS_isHover"],"RYD_HAS_myTTLAction"] remoteExec ["RYD_HAS_AddAction",RYD_HAS_Caller];
		[RYD_HAS_Caller,["<t color='#fe8701'>CAS pattern: SAD</t>", "RYD_HAS_CAS_isSAD = true;publicVariableServer 'RYD_HAS_CAS_isSAD';", true, 1, true, true, "", "not RYD_HAS_CAS_isSAD"],"RYD_HAS_myTTLActionB"] remoteExec ["RYD_HAS_AddAction",RYD_HAS_Caller];		
		}
	};
	
publicVariable "RYD_HAS_atKilled";
	
RYD_HAS_AutoEmbark = 
	{
		{
		if (_x isEqualTo (leader (group _x))) then
			{
			private _wp = (group _x) addWaypoint [(position RYD_HAS_Chopper), 0];
			_wp setWaypointType "GETIN";			
			_wp waypointAttachVehicle RYD_HAS_Chopper;
			(group _x) setCurrentWaypoint _wp;
			_wp setWaypointStatements ["true","deletewaypoint [(group this), 0];"];
			RYD_HAS_wps pushBack _wp;
			}
		else
			{
			_x assignAsCargo RYD_HAS_Chopper;
			[_x] orderGetIn true;
			}
		}
	foreach RYD_HAS_STT;
	};
	
RYD_HAS_AutoDisembark = 
	{
	if (({((isPlayer _x) and {(_x isEqualTo (leader (group _x)))})} count RYD_HAS_STT) > 0) then
	//if ((player in RYD_HAS_STT) and {(player isEqualTo (leader (group player)))}) then
		{
			{
			[_x] orderGetIn false;
			unassignVehicle _x;			
			[_x,_foreachindex] spawn
				{
				_unit = _this select 0;
				_wait = _this select 1;
				
				_alive = true;
				
				waitUntil
					{
					sleep 0.2;
					_alive = not (isNull _unit) and {(alive _unit)};
					
					(not (_alive) or {(((getPos (vehicle _unit)) select 2) < 1)})
					};
					
				if not (_alive) exitWith {};
				sleep (_wait + 0.5);
				
				_unit action ["Eject", vehicle _unit];
				}
			}
		foreach RYD_HAS_STT;
		}
	};
	
RYD_HAS_FastRope = 
	{
	params ["_heli","_units"];
	private ["_anims","_selections","_alive","_aliveU","_existingAnimS","_asClass","_class","_selP","_frCount","_animCount","_cnt","_ropes","_unit","_dst1","_lvl1","_ix"];
	
	_units = +_units;
	
		{
		if ((isNull _x) or {not (alive _x) or {not (_x in _heli)}}) then
			{
			_units set [_foreachIndex,objNull]
			}
		}
	foreach _units;
	_units = _units - [objNull];
	
	_anims = [];
	
		{
		if ((toLower (typeOf _heli)) isEqualTo (toLower (typeOf (_x select 0)))) exitWith
			{
			_anims = _x select 1;
			}
		}
	foreach RYD_HAS_DoorsToOpen;
	
	_selections = [];
	
		{
		if ((_x select 0) isEqualTo _heli) exitWith 
			{
			_selections = _x select 1;
			}
		}
	foreach RYD_HAS_RopeAttachPoints;
	
	if ((count _selections) < 1) then
		{
			{
			if not (((toLower _x) find "door") < 0) then
				{
				_selP = _heli selectionPosition _x;			
				if (({((_selP distance (_heli selectionPosition _x)) < 1)} count _selections) < 1) then
					{
					_selections pushBack _x;
					}				
				}
			}
		foreach (selectionNames _heli);
		};
	
	if ((count _selections) < 1) then
		{
		_selections pushBack [0,0,0]
		};

	_existingAnimS = [];

	_asClass = configFile >> "CfgVehicles" >> (typeOf _heli) >> "AnimationSources";

	for "_i" from 0 to ((count _asClass) - 1) do
		{
		_class = _asClass select _i;
		
		if (isClass _class) then
			{
			_class = configName _class;
			_existingAnimS pushBack (toLower _class)
			}
		};
	
	_frCount = (count _units) min (count _selections);
	_animCount = (count _anims) - 1;
	RYD_HAS_waitFor = [];
	_alive = true;			
	_aliveU = true;
	
	for "_i" from 0 to (_frCount - 1) do
		{
		if (not (_animCount < _i) and {((toLower (_anims select _i)) in _existingAnimS)}) then
			{
			RYD_HAS_waitFor pushBack _i;
			[_heli,(_anims select _i),_i] spawn
				{
				params ["_heli","_anim","_i"];
				
				_heli animateDoor [_anim, 1];
				_heli animateSource [_anim, 1];

				waitUntil
					{
					sleep 1;
					_alive = (alive _heli) and {(canMove _heli)};		
					if not (_alive) exitWith {true};

					(((_heli animationPhase _anim) > 0.99) or {((_heli animationSourcePhase _anim) > 0.99)});
					};
				
				RYD_HAS_waitFor = RYD_HAS_waitFor - [_i];
				}
			};

		[_heli,(_selections select _i),_i,_units] spawn
			{
			params ["_heli","_sel","_i","_units"];
			_alive = true;

			waitUntil
				{
				sleep 1;
				
				_alive = (alive _heli) and {(canMove _heli) and {(({(alive _x)} count _units) > 0)}};		
				if not (_alive) exitWith {true};	
				
				not (_i in RYD_HAS_waitFor)
				};
				
			if not (_alive) exitWith {};

			_attP = if ((typeName _sel) isEqualTo (typeName "")) then
				{
				(_heli selectionPosition _sel)
				}
			else
				{
				_sel
				};

			_rope = ropeCreate [_heli, _attP, (((position _heli) select 2) + 5 + (round (random 2)))];
			};
		};
				
	waitUntil
		{
		sleep 1;
		
		_alive = (alive _heli) and {(canMove _heli)};	
		if not (_alive) exitWith {true};	
		_aliveU = ({(alive _x)} count _units) > 0;
		if not (_aliveU) exitWith {true};
		
		((count (ropes _heli)) == _frCount)
		};
		
	if not (_alive) exitWith 
		{
			{
			ropeDestroy _x;						
			}
		foreach (ropes _heli);	
		RYD_HAS_FR_OK = 2;
		};
		
	sleep (1.5 + (random 1));
	
	if not ((alive _heli) and {(canMove _heli)}) exitWith
		{
			{
			ropeDestroy _x;						
			}
		foreach (ropes _heli);
		RYD_HAS_FR_OK = 2;
		};
		
	if not (_aliveU) exitWith 
		{
		for "_i" from 0 to (_frCount - 1) do
			{
			if (not (_animCount < _i) and {((toLower (_anims select _i)) in _existingAnimS)}) then
				{
				RYD_HAS_waitFor pushBack _i;
				[_heli,(_anims select _i),_i] spawn
					{
					params ["_heli","_anim","_i"];
					_heli animateDoor [_anim, 0];
					_heli animateSource [_anim, 0];
					
					waitUntil
						{
						sleep 1;
						
						_alive = (alive _heli) and {(canMove _heli)};		
						if not (_alive) exitWith {true};	
						
						(((_heli animationPhase _anim) < 0.1) or {((_heli animationSourcePhase _anim) < 0.1)});
						};
						
					RYD_HAS_waitFor = RYD_HAS_waitFor - [_i];
					}
				};
			};

		RYD_HAS_FR_OK = 3;
		};

	_ropes = ropes _heli;
	_cnt = count _ropes;
	if (_cnt < 1) exitWith
		{
		//hint "Fast roping impossible.";
		"Fast roping impossible." remoteExec ["hint"]; 
		RYD_HAS_FR_OK = 2;
		};
		
	_segments = (position _heli) nearObjects ["RopeSegment",((getPosATL _heli) select 2)];

		{
		_unit = _x;
		_dst1 = _unit distance _heli;
		_lvl1 = (position _unit) select 2;
		_ix = _foreachIndex;
		while {(_ix >= _cnt)} do
			{
			_ix = _ix - _cnt
			};

		waitUntil
			{
			sleep (0.25 + (random 1));
			
			_alive = (alive _heli) and {(canMove _heli)};		
			if not (_alive) exitWith {true};				
			
			(({(((_x getVariable ["RYD_HAS_myRope",-1]) == _ix) and {(((position _x) select 2) > ((_lvl1/3) max 1))})} count _units) < 1)
			};	

		if not (_alive) exitWith {};
		
		if (alive _unit) then
			{
			[_unit,_heli,_ropes,_ix,_segments] spawn
				{
				params ["_unit","_heli","_ropes","_ix","_segments"];
				_rope = _ropes select _ix;
				_unit setVariable ["RYD_HAS_myRope",_ix];
							
				[_unit,_heli] remoteExecCall ["disableCollisionWith", 0,_unit];
				[_unit] remoteExec ["unassignVehicle",_unit];
				[_unit,["GetOut",_heli]] remoteExec ["action",_unit];				 
				waitUntil
					{
					sleep 0.1;
					(isNull (assignedVehicle _unit))
					};
					
				[_unit] orderGetIn false;
				
				waitUntil
					{
					sleep 0.1;
					(_unit == (vehicle _unit))
					};
				
				[_unit,(_rope modelToWorld [0,-0.1,-2])] remoteExec ["setPosATL", _unit];

				_attPos = [0,-0.1,-2];
				_unit disableAI "ANIM";
				//[_unit, "AcinPercMstpSrasWrflDnon"] remoteExec ["switchMove", 0];
				[_unit, "gunner_standup01"] remoteExec ["switchMove", 0];
				//[_unit, [0.5,0.5,-0.5]] remoteExec ["setVectorDir", 0];
				//_unit switchMove "gunner_standup01";
				_unit attachTo [_rope,_attPos];
				_unit setDir ((_unit getDir _heli) - (20 + (random 10)));
				_speed = 0.125 + (random 0.075);
				_speedAdd = 0;
				_collEn = false;
				
				while {((getPos _unit) select 2) > 0.25} do
					{
					if not (isMultiplayer) then
						{
						_uPos = getPosASL _unit;
						_lvlU = _uPos select 2;
						_closeV = [];
						_horCoord = [0,0,0];
						
							{
							_lvl = (getPosASL _x) select 2;
							_dstV = _lvlU - _lvl;
							if (((abs _dstV) < 1) and {(_dstV < 0)}) then
								{
								_closeV pushBack _x;
								}
							}
						foreach _segments;
						
						if ((count _closeV) > 0) then
							{
							_clSeg = [_unit,_closeV] call RYD_HAS_FindClosest;
							
							if not (isNull _clSeg) then
								{
								_sPos = getPosASL _clSeg;
								
								_horCoord = _clSeg modelToWorld [0,-0.0,0];
								_horCoord = _rope worldToModel _horCoord;
								
								if (((getPos _unit) select 2) > 2) then
									{
									_vU = vectorDir _unit;
									_vS = vectorDir _clSeg;
									
									[_unit,[_uPos, _uPos, (velocity _unit), (velocity _unit), _vU,_vS,[0,0,1],[0,0,1], 1]] remoteExec ["setVelocityTransformation",_unit];
									}
								};
							};

						_attPos set [0,(_horCoord select 0)];
						_attPos set [1,(_horCoord select 1)];
						};
					
					_attPos set [2,((_attPos select 2) - (_speed * (0.8 + (random 0.4))))];
					_unit attachTo [_rope,_attPos];
					if ((not (_collEn)) and {((((getPos _heli) select 2) - ((getPos _unit) select 2)) > 4)}) then
						{
						_collEn = true;
						[_unit,_heli] remoteExecCall ["enableCollisionWith", 0,_unit];
						};
						
					sleep 0.05;
					if not (alive _unit) exitWith {};
					};
					
				if not (_collEn) then
					{
					[_unit,_heli] remoteExecCall ["enableCollisionWith", 0,_unit];
					};				
					
				_unit enableAI "ANIM";
				detach _unit;
				sleep (0.5 + (random 0.5));
				if not (alive _unit) exitWith {};
				[_unit, ""] remoteExec ["switchMove", 0];
				if (((getPosATL _unit) select 2) < 1) then				
					{
					[_unit,(_unit getPos [(10 + (random 5)),(random 360)])] remoteExec ["doMove", _unit];
					if (_unit isEqualTo (leader (group _unit))) then
						{
						//_unit doMove (_unit getPos [(10 + (random 5)),(random 360)]);
						}
					}
				else
					{
					doStop _unit
					}
				};
			}
		}
	foreach _units;

	waitUntil
		{
		sleep 1;
		if (({(alive _x)} count _units) < 1) exitWith {true};
		
		(({((alive _x) and {(((getPos _x) select 2) > 1)})} count _units) < 1)
		};
		
	if not (_alive) exitWith
		{
			{
			ropeDestroy _x;						
			}
		foreach (ropes _heli);
		RYD_HAS_FR_OK = 2;
		};

	sleep (1 + (random 0.5));
	
	[_units] spawn
		{
		params ["_units"];
		
		sleep (5 + (random 2));
		
			{
			if ((isNull _x) or {not (alive _x)}) then
				{
				_units set [_foreachIndex,objNull]
				}
			}
		foreach _units;
		_units = _units - [objNull];

			{
			[_x,(leader (group _x))] remoteExec ["doFollow",_x];
			//_x doFollow (leader (group _x))
			}
		foreach _units;
		};

		{
		[_heli,_x] spawn
			{
			params ["_heli","_rope"];
			
			ropeUnwind [_rope, (4.75 + (random 0.5)), 0];
			_alive = true;
			
			waitUntil
				{
				sleep 0.1;
				_alive = (alive _heli) and {(canMove _heli)};		
				if not (_alive) exitWith {true};	
				not (ropeUnwound _rope)
				};
				
			waitUntil
				{
				sleep 1;
				_alive = (alive _heli) and {(canMove _heli)};		
				if not (_alive) exitWith {true};	
				(ropeUnwound _rope)
				};

			ropeDestroy _rope;

			if not (_alive) exitWith {};
			}
		}
	foreach (ropes _heli);
	
	waitUntil
		{
		sleep 1;

		_alive = (alive _heli) and {(canMove _heli)};		
		if not (_alive) exitWith {true};		
		
		((count (ropes _heli)) == 0)
		};
		
	if not (_alive) exitWith
		{		
			{
			ropeDestroy _x;						
			}
		foreach (ropes _heli);	
		RYD_HAS_FR_OK = 2;
		};

	for "_i" from 0 to (_frCount - 1) do
		{
		if (not (_animCount < _i) and {((toLower (_anims select _i)) in _existingAnimS)}) then
			{
			RYD_HAS_waitFor pushBack _i;
			[_heli,(_anims select _i),_i] spawn
				{
				params ["_heli","_anim","_i"];
				_heli animateDoor [_anim, 0];
				_heli animateSource [_anim, 0];
				
				waitUntil
					{
					sleep 1;
					
					_alive = (alive _heli) and {(canMove _heli)};		
					if not (_alive) exitWith {true};	
					
					(((_heli animationPhase _anim) < 0.75) or {((_heli animationSourcePhase _anim) < 0.75)});
					};
					
				RYD_HAS_waitFor = RYD_HAS_waitFor - [_i];
				}
			};
		};
		
	waitUntil
		{
		sleep 1;
		
		_alive = (alive _heli) and {(canMove _heli)};		
		if not (_alive) exitWith {true};
		
		((count RYD_HAS_waitFor) == 0)
		};
	
	RYD_HAS_Chopper flyInHeight RYD_HAS_ChopperLvl;	
	RYD_HAS_Chopper setVariable ["RYD_HAS_myLvl",RYD_HAS_ChopperLvl];
	RYD_HAS_FR_OK = 1;
	};
	
RYD_HAS_prepareSupplyBox = 
	{
	params ["_pos"];
	private ["_box","_weaponry","_magazines","_class","_mags","_muzzles","_mMags"];
	
	_box = createVehicle [RYD_HAS_SupplyCall_ContainerClass, [0,0,1410], [], 0, "NONE"];
	_box hideObjectGlobal true;
	_box allowDamage false;
	_box setPos _pos;

	clearItemCargoGlobal _box;
	clearBackpackCargoGlobal _box;
	clearWeaponCargoGlobal _box;
	clearMagazineCargoGlobal _box;

	_weaponry = ["Throw"];

		{
		_weaponry appEnd (weapons _x)
		}
	foreach RYD_HAS_STT;


		{
		_weaponry set [_foreachIndex,(toLower _x)]
		}
	foreach _weaponry;

	_magazines = [];

		{
		_class = configFile >> "CfgWeapons" >> _x;
		_mags = _class >> "magazines";
		if (isArray _mags) then
			{
			_magazines appEnd (getArray _mags);
			};
		
		_muzzles = _class >> "muzzles";
		if (isArray _muzzles) then
			{
			_muzzles = getArray _muzzles;
			
				{
				_mMags = _class >> _x >> "magazines";
				if (isArray _mMags) then
					{
					_magazines appEnd (getArray _mMags);
					}
				}
			foreach _muzzles;
			};
		}
	foreach _weaponry;

		{
		_magazines set [_foreachIndex,(toLower _x)]
		}
	foreach _magazines;

	_magazines = _magazines - RYD_HAS_SupplyCall_MagBlacklist;
	
		{
		if (_x select 2) then
			{
			_x set [1,(floor (random ((_x select 1) + 1)))]
			};
			
		_x reSize 2;

		_box addBackpackCargoGlobal _x;
		}
	foreach RYD_HAS_SupplyCall_AddBackPack;
	

		{
		if (_x select 2) then
			{
			_x set [1,(floor (random ((_x select 1) + 1)))]
			};	
			
		_x reSize 2;
		
		_box addWeaponCargoGlobal _x;
		}
	foreach RYD_HAS_SupplyCall_AddWeapon;

		{
		if (_x select 2) then
			{
			_x set [1,(floor (random ((_x select 1) + 1)))]
			};	
			
		_x reSize 2;	
		
		_box addMagazineCargoGlobal _x;
		}
	foreach RYD_HAS_SupplyCall_AddMagazine;

		{
		_amnt = if (RYD_HAS_SupplyCall_MagCount < 0) then
			{
			floor (random ((-RYD_HAS_SupplyCall_MagCount + 1)))
			}
		else
			{
			RYD_HAS_SupplyCall_MagCount
			};
			
		_box addMagazineCargoGlobal [_x,_amnt];
		}
	foreach _magazines;

		{
		if (_x select 2) then
			{
			_x set [1,(floor (random ((_x select 1) + 1)))]
			};	
			
		_x reSize 2;
		
		_box addItemCargoGlobal _x;
		}
	foreach RYD_HAS_SupplyCall_AddItem;

	_box	
	};
	
RYD_HAS_doBox = 
	{
	params ["_base"];
	private ["_pos","_box","_mBox","_wasSpawned"];
	
	_pos = position _base;
	_wasSpawned = false;
	
 	_box = if ((count RYD_HAS_SupplyDrop_Prepared) > 0) then
		{
		_mBox = RYD_HAS_SupplyDrop_Prepared select 0;
		RYD_HAS_SupplyDrop_Prepared = RYD_HAS_SupplyDrop_Prepared - [_mBox];
		_mBox
		}
	else
		{
		_wasSpawned = true;
		([_pos] call RYD_HAS_prepareSupplyBox)
		};

	_box setVariable ["RYD_HAS_wasSpawned",_wasSpawned];
	RYD_HAS_box = _box;
	if (RYD_HAS_SupplyDrop_Arsenal) then
		{
		["AmmoboxInit",[ RYD_HAS_box,true,{(_this distance _originalTarget) < 10}]] call BIS_fnc_arsenal;
		};
	
	_box
	};
	
RYD_HAS_SupplyDrop = 
	{
	params ["_heli","_box","_mark"];
	private ["_cargo","_ammoBox","_spawnPos","_parachute","_parachutePos","_height1","_height2","_height3","_speed","_dir","_vel","_pos","_off","_type","_fl","_sm","_maxH","_arr","_attPos","_txt"];
	
	RYD_HAS_delivered = true;
	publicVariable "RYD_HAS_delivered";	
	
	_type = typeOf _box;

	_dir = getDir _heli;

	_parachutePos = _heli modelToWorld [(random 10) - 5,-10,-10];

	_parachute = createVehicle ["B_Parachute_02_F", [_parachutePos select 0,_parachutePos select 1,2000], [], 0.5, "NONE"];
	_parachute setPos _parachutePos;
	_parachute setDir _dir;

	_vel = velocity _heli;

	_parachute setVelocity [(_vel select 0)/2,(_vel select 1)/2,(_vel select 2)/2];

	_box setDir _dir;
	_box hideObjectGlobal false;
	_box enableSimulationGlobal true;
	_box allowDamage true;

	_box attachTo [_parachute,[0,0,0]];

	sleep 2;
	
	_txt = selectRandom RYD_HAS_sent_Accomplished_sc;
	//(driver _heli) customChat [RYD_HAS_PilotChannel,_txt];
	[(driver _heli),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
	if (true) then//if (player in RYD_HAS_STT) then
		{
		//playSound "TacticalPing3";
		"TacticalPing3" remoteExec ["playSound",RYD_HAS_Caller];
		};
		
	waitUntil
		{
		_height1 = (getPosATL _box) select 2;
		sleep 0.005;
		_height2 = (getPosATL _box) select 2;
		_speed = abs ((velocity _box) select 2);
		if (_height2 > _height1) then {_parachute setVelocity [0,0,-20]};
		sleep 0.005;
		_height3 = (getPosATL _box) select 2;

		((_height2 < 0.05) or {(_height2 < 2) and {(_height3 > _height2) or {(_speed < 0.001) or {(isNull _parachute)}}}})
		};

	detach _box;

	_pos = getPosATL _box;

	//deleteVehicle _box;

	//_box = createVehicle [_type, _pos, [], 0, "NONE"];

	_off = _box modelToWorld [0,0,0] select 2;
	if (_off < 2) then 
		{
		_box setPos [_pos select 0,_pos select 1,0];
		} 
	else 
		{
		_off = getPos _box select 2;
		_box setPosATL [_pos select 0,_pos select 1,(_pos select 2)-_off];
		};

	if not (isNull _parachute) then 
		{
		_parachute setVelocity [0,0,0]
		};

	sleep 5;
	
	if (RYD_HAS_SupplyDrop_attachFlareAndSmoke) then
		{
		/*_maxH = ((boundingBoxReal _box) select 1) select 2;
		_arr = lineIntersectsSurfaces [(ATLtoASL (_box modeltoWorld [0,0,_maxH])),(ATLtoASL (_box modeltoWorld [0,0,0]))];
		_attPos = if ((count _arr) < 1) then
			{
			[0,0,_maxH]
			}
		else
			{
			(_box worldToModel (ASLtoATL ((_arr select 0) select 0)))
			};
			
		_attPos set [2,((_attPos select 2) + 0.01)];*/
		_attPos = _box worldToModel (getPos _box);//[0,0,0];

		_fl = createVehicle ["Chemlight_blue", (position _box), [], 0, "NONE"];
		_fl setVectorDirAndUp [(vectorDir _box),(vectorUp _box)];
		_fl attachTo [_box,_attPos];
		_fl hideObject true;
		
		_attPos set [1,((_attPos select 1) + 0.1)];
		_sm = createVehicle ["SmokeShellBlue", (position _box), [], 0, "NONE"];
		_sm attachTo [_box,_attPos];
		_sm hideObject true;
		};
		
	deleteMarker _mark;

	if not (isNull _parachute) then 
		{
		deleteVehicle _parachute
		}
	};
	
RYD_HAS_ChangeAltitude = 
	{
	if (isNull RYD_HAS_Chopper) exitWith {};
	_diff = _this select 3;
	_lvl = RYD_HAS_Chopper getVariable ["RYD_HAS_myLvl",RYD_HAS_ChopperLvl];
	_lvl = _lvl + _diff;
	if (_lvl < 1) exitWith 
		{
		if ((RYD_HAS_ContourFlightMode) and {not ((RYD_HAS_isSupplyRun) and {(RYD_HAS_SupplyDrop_SlingLoad)})}) then
			{
			if (RYD_TI_EFEH < 0) then
				{
				RYD_HAS_Chopper flyInHeight 35;
				RYD_HAS_Chopper setVariable ["RYD_HAS_myLvl",35];
				RYD_HAS_ChopperLvl = 35;				
								
				("Contour flight") remoteExec ["hint"];
				[RYD_HAS_Chopper,((getNumber (configFile >> "CfgVehicles" >> (typeOf RYD_HAS_Chopper) >> "maxSpeed"))/3.6),10,2,0,1,true,0.2,false] call RYD_TI_TimidIcarus;
				};
			}
		else
			{
			//hint "Chosen flight ceiling too low."
			"Chosen flight ceiling too low." remoteExec ["hint"]; 
			};
		};
		
	if not (RYD_TI_EFEH < 0) then
		{
		removeMissionEventHandler ["EachFrame",RYD_TI_EFEH];
		RYD_TI_EFEH = -1;
		publicVariable "RYD_TI_EFEH";
		};
		
	_txt = "";
	if (_lvl > 5500) then 
		{
		_lvl = 5500;
		_txt = "Maximum reached."
		};
		
	RYD_HAS_Chopper flyInHeight _lvl;
	RYD_HAS_Chopper setVariable ["RYD_HAS_myLvl",_lvl];
	RYD_HAS_ChopperLvl = _lvl;
	//hint format ["New flight ceiling: %1 meters. %2",_lvl,_txt];
	(format ["New flight ceiling: %1 meters. %2",_lvl,_txt]) remoteExec ["hint"]; 
	};
	
publicVariable "RYD_HAS_ChangeAltitude";

RYD_TI_TimidIcarus = 
	{
	private _heli = param [0,objNull,[objNull]];//helicopter to be controlled. Default : objNull (code exits)
	if (isNull _heli) exitWith {};
	
	private _desiredSpeed = param [1,((getNumber (configFile >> "CfgVehicles" >> (typeOf _heli) >> "maxSpeed"))/3.6),[0]];//speed in m/s, that heli will try to maintain most of the time. Default: max config speed. The faster, the more risky flight.
	private _desiredAltitude = param [2,10,[0]];//AGL ceiling in meters: controlled heli will strive to maintain that height abouve the ground as much, as possible. Default: 10. Values below 10 not recommended. 
	private _overflyBuffer = param [3,2,[0]];//additional buffer in meters added to calculated minimal height necessary to fly over an obstacle (map object etc.). Default: 2. Values below 2 not recommended. 
	private _obstacleDetectMode = param [4,0,[0]];//setting for obstacles detection method. 0 - less CPU hungry, pays attention only to the map objects, ignores editor-placed objects and very few exceptions amongst map objects. 1 - detects non-map objects as well, may cause a bit more bumpy ride, than necessary and recognize as an obstacle also objects, that should be ignored, can be more CPU-hungry. Default: 0 (recommended unless insuffice in certain scenarios)
	private _obstacleDetectRange = param [5,1,[0]];//a multiplier of obstacles detection radius. Default: 1, which translates to the bigger of the two: (heli full length + 10) OR 20 meters. Too big will eat FPS fast, too low will tend to ignore big objects, that still can be collided with.
	private _safetyPush = param [6,true,[true]];//if this is enabled and code would detect, that heli gets dangerously close to the ground, emergency "pull up!" vertical velocity will be added, which often may help to avoid collision. In such situation it will override sharpness setting. Default: true.
	private _sharpness = param [7,0.2,[0]];//sharpness factor. The lower value, the more smoothed flight, but also more sluggish reactions which increase collision risk. Default: 0.2. Values 0.1-0.2 are risky. Values below 0.1 not recommended. Maximum: 1. Values above 1 may cause crazy behavior.  
	private _debug = param [8,false,[true]];//Debug mode adding 3D visualisation markers and some numerical data on the screen. Default: false. 
	
	RYD_TI_Params = [_heli,_desiredSpeed,_desiredAltitude,_overflyBuffer,_obstacleDetectMode,_obstacleDetectRange,_safetyPush,_sharpness,_debug];
	
	RYD_TI_ContourFlight = 
		{
		if (isGamePaused) exitWith {};
		params ["_heli","_desiredSpeed","_desiredAltitude","_overflyBuffer","_obstacleDetectMode","_obstacleDetectRange","_safetyPush","_sharpness","_debug"];
		if (isNull _heli) exitWith {};

		RYD_TI_Control = false;
		if (_debug) then
			{			
			if (isNil "RYD_TI_a1") then
				{
				RYD_TI_a1 = createvehicle ["Sign_Arrow_Large_F",(_heli modelToWorld [0,0,10]),[],0,"CAN_COLLIDE"];
				RYD_TI_a2 = createvehicle ["Sign_Arrow_Large_Blue_F",(_heli modelToWorld [0,0,10]),[],0,"CAN_COLLIDE"];
				RYD_TI_a3 = createvehicle ["Sign_Arrow_Large_Green_F",(_heli modelToWorld [0,0,10]),[],0,"CAN_COLLIDE"];
				};			
			};
		
		_gp = group _heli;
		_bbH = boundingBoxReal _heli;
		_size = ((_bbH select 1) select 0) - ((_bbH select 0) select 0);
		_sizeL = ((_bbH select 1) select 1) - ((_bbH select 0) select 1);

		_addH = abs ((_bbH select 0) select 2);
		_overflyBuffer = _overflyBuffer + _addH;
		_finish = 0;
		_vel = _desiredSpeed;
		_desiredAlt = _desiredAltitude;

		if ((isNull _heli) or {not (alive _heli) or {(isNull _gp)}}) exitWith {true};

		_cP = currentPilot _heli;
		
		if (not (isTouchingGround _heli) and {(canMove _heli) and {((fuel _heli) > 0) and {not (isNull _cP) and {(alive _cP) and {not (isPlayer _cP) and {((count (waypoints _gp)) > 0)}}}}}}) then
			{
			_cw = currentWaypoint _gp;
			_cw = [_gp,_cw];
			_wPos = waypointPosition _cw;
			if (_wPos isEqualTo [0,0,0]) exitWith {};
			
			
		
			_hPos = getPosASL _heli;
			
			_cAlt = _hPos select 2;	
			_cVel = velocity _heli;
			_dst = _hPos distance2D _wPos;
			
			if ((toUpper (waypointType _cw)) isEqualTo "LOITER") exitWith {};
			
			_cVelH = _cVel distance2D [0,0,0];
			
			_rAlt = (_heli modelToWorld [0,((_bbH select 1) select 1),((_bbH select 0) select 2)]) select 2;
			_rAlt2 = (_heli modelToWorldWorld [0,((_bbH select 1) select 1),((_bbH select 0) select 2)]) select 2;
			
			_rAltFront = _rAlt min _rAlt2;
			
			_rAlt3 = (_heli modelToWorld [0,((_bbH select 0) select 1),((_bbH select 0) select 2)]) select 2;
			_rAlt4 = (_heli modelToWorldWorld [0,((_bbH select 0) select 1),((_bbH select 0) select 2)]) select 2;
			
			_rAltRear = _rAlt3 min _rAlt4;
			
			_cAltATL = _rAltFront min _rAltRear;

			if ((_dst > 100) and {(_cAltATL > 5) or {(_cVelH > 10)}}) then
				{
				RYD_TI_ControlTI = true;publicVariable "RYD_TI_ControlTI";
				_dirH = getDir _heli;
				_dir = _heli getDir _wPos;
				_diff0 = _dirH - _dir;
				_diff0 = (sin _diff0) atan2 (cos _diff0);
				_diff = abs _diff0;
				
				if ((_diff < 1) or {(_cVelH > 5) and {(_diff < 10)}}) then
					{
					RYD_TI_Control = true;
					if not (RYD_TI_wasControl) then
						{
						_heli setVariable ["RYD_TI_lastWP",_hPos]
						};
											
					_myLastWP = _heli getVariable ["RYD_TI_lastWP",[-1000,-1000,-1000]];
					_finish = (linearConversion [100,200,_dst,1,0,true]) max (linearConversion [0,100,(_heli distance2D _myLastWP),1,0,true]);
					
					_cVelN = _cVel distance [0,0,0];
					
					_range = _size + _cVelN + 10;
					_rad = ((_size + 10) max 20) * _obstacleDetectRange;
					_mplOH = 1;
					
					_passingO = _heli getVariable ["RYD_TI_PassingO",objNull];
					if not (isNull _passingO) then
						{
						_dirPO = _heli getDir _passingO;
						_diffPO = _dirH - _dirPO;
						_diffP0 = abs ((sin _diffPO) atan2 (cos _diffPO));
						
						if (_diffPO > 90) then
							{
							_bhd = _heli distance2D _passingO;
							if (_bhd > ((_sizeL/2) + 10)) then
								{
								_passingO = objNull;
								_heli setVariable ["RYD_TI_PassingO",objNull]
								}
							else
								{
								_mplOH = (1 - ((_bhd - (_sizeL/2))/((_sizeL/2) + 10))) min 1
								}
							}
						};
					
					_topPC = _passingO modelToWorld [0,0,(((boundingBoxReal _passingO) select 1) select 2)];				
					_obstacleHASL = (ATLtoASL _topPC) select 2;
					if ("bridgesea" in (toLower (str _passingO))) then
						{
						_obstacleHASL = _obstacleHASL + 5
						};	
						
					_obstacleHASL = _obstacleHASL * _mplOH;
					_corr = 0;
					_moDst = _range + _rad;
					_obstacle = objNull;
					_altASL = ((getTerrainHeightASL _hPos) max 0) + _desiredAltitude;

					for "_i" from (_size/2) to (_range + 50) step (_size/2) do
						{
						_pingPos = _heli getPos [_i,_dir];
						
						_objects = if (_obstacleDetectMode == 0) then
							{
							(nearestTerrainObjects [_pingPos, [], _rad, false, true])
							}
						else
							{
							_rem = [_heli];
							_rem appEnd (crew _heli);
							_birds = _pingPos nearObjects ["Bird",(_rad * 1.5)];
							_rem appEnd _birds;
							
							if (_debug) then
								{
								_rem appEnd [RYD_TI_a1,RYD_TI_a2,RYD_TI_a3]
								};
							
							((nearestObjects [_pingPos,[],_rad,true]) - _rem)
							};
						
							{
							_bbr = boundingBoxReal _x;
							_topC = _x modelToWorld [0,0,((_bbr select 1) select 2)];
							_top = _topC select 2;
							_topASL = (ATLtoASL _topC) select 2;
							
							if ("bridgesea" in (toLower (str _x))) then
								{
								_topASL = _topASL + 5
								};
							
							_aDst = (_heli distance2D _x) max 1;
													
							if ((_topASL > (_altASL - _overflyBuffer)) and {((_top * 4.5) > _aDst) or {(_aDst < _range)}}) then
								{
								if (_debug) then
									{
									drawIcon3D ["#(argb,8,8,3)color(0,0,0,0)",[1,1,1,1],(_x modelToWorld [0,0,((_bbr select 1) select 2)]),1,1,0,(str (round _topASL)),1,0.035,"PuristaSemibold"];
									};
								
								if (_topASL > _obstacleHASL) then
									{
									_obstacleHASL = _topASL;
									_obstacle = _x;
									_moDst = _moDst min _aDst;
									
									if (_debug) then
										{
										RYD_TI_a1 setPosATL (_x modelToWorld [0,0,((_bbr select 1) select 2)]);
										};
									};
								}
							}
						foreach _objects;
						};
						
					_heli setVariable ["RYD_TI_PassingO",_obstacle];
					_obsDst = _moDst;
					
					_desiredAlt = _altASL max (_obstacleHASL + _overflyBuffer);
					
					if (_finish > 0) then
						{
						_desiredAlt = linearConversion [0,1,_finish,_desiredAlt,((((getTerrainHeightASL _hPos) max 0) + 30) max _desiredAlt),true];
						};
															
					_diffAlt = _desiredAlt - _cAlt;
					_rPingPos = _hPos;
					_corrM = (_obstacleHASL + _diffAlt)/(sqrt _obsDst);
					
					for "_i" from (_size/2) to (_size + _cVelN) step (_size/8) do
						{
						_pingPos = _heli getPos [_i,_dir];
						_pingPos set [2,0];
						
						_corr = ((getTerrainHeightASL _pingPos) max 0) - ((getTerrainHeightASL _hPos) max 0) + _diffAlt;
						if (((abs _corr) > 0) and {(isNull _obstacle) or {(_corr > (_corrM * (sqrt _obsDst)))}}) then
							{
							_rPingPos = _pingPos;
							
							if (_debug) then
								{
								RYD_TI_a2 setPosATL _pingPos;
								};
								
							if ((_corr/(sqrt _i)) > _corrM) then
								{
								if (_debug) then
									{
									drawIcon3D ["#(argb,8,8,3)color(0,0,0,0)",[1,0.5,0,1],_pingPos,1,1,0,(str (round _corr)),1,0.035,"PuristaSemibold"];
									};
									
								_moDst = _moDst min (_heli distance2D _pingPos);
								_corrM = _corr/(sqrt _i)
								};
							};
						};

					_cAlt = _cAlt - (((getTerrainHeightASL _rPingPos) max 0) - ((getTerrainHeightASL _hPos) max 0));
					_diffAlt = _desiredAlt - _cAlt;
					
					_halfSpeed = (getNumber (configFile >> "CfgVehicles" >> (typeOf _heli) >> "maxSpeed"))/7.2;
					_vel = linearConversion [0,1,_finish,_desiredSpeed,(_halfSpeed min _vel),true];
													
					if ((_cVelN < _vel) or {((abs _diffAlt) > (10/(_cVelN max 10)))}) then
						{
						_altAm = (_diffAlt max 0)/(sqrt (_moDst max 1));
						_fPos = _hPos getPos [(_moDst max (_altAm * 3)),_dir];
						_fPos set [2,(_desiredAlt + _altAm)];

						if (_debug) then
							{
							RYD_TI_a3 setPosASL _fPos;
							};

						_safety = if (_safetyPush) then
							{
							(sqrt ((((_desiredAltitude/2) max 5) - _cAltATL) max 1))
							}
						else
							{
							1
							};
							
						_sharpnessF = if (_safety > 1) then
							{
							1
							}
						else
							{
							_sharpness
							};
						
						_vel2 = (_vel * (1 - _sharpnessF)) + (_vel * ((((_moDst max 1))/((_diffAlt max 1)^0.75)) min 1) * _sharpnessF);
						_vel = (_vel * (1 - _sharpnessF)) + (_vel * ((((_moDst max 1))/((_diffAlt max 1)^0.75)) min 1) * _sharpnessF);
						
						_dirV = _hPos vectorFromTo _fPos;
						_velV = [((((_dirV select 0) * _vel2) * _sharpnessF) + ((_cVel select 0) * (1 - _sharpnessF))),((((_dirV select 1) * _vel2) * _sharpnessF) + ((_cVel select 1) * (1 - _sharpnessF))),(((_dirV select 2) * (_vel * _safety * _sharpnessF)) + ((_cVel select 2) * (1 - _sharpnessF)))];
						_velF = _velV distance [0,0,0];

						_heli addTorque (_heli vectorModelToWorld [(((getMass _heli)^1.3)/16) * (sqrt (_velF/100)),0,0]);
						_heli setVelocity _velV;
						}
					}
				else
					{
					if (not (_diff < 5) and {(_cAlt > 1)}) then
						{
						if (_diff0 > 0) then
							{
							_heli addTorque (_heli vectorModelToWorld [0,0,-((((getMass _heli)^1.35)/25) * 3)]);
							}
						else
							{
							_heli addTorque (_heli vectorModelToWorld [0,0,((((getMass _heli)^1.35)/25) * 3)]);
							}
						};
					}
				}
			else
				{
				RYD_TI_ControlTI = false;publicVariable "RYD_TI_ControlTI";
				}
			}
		else
			{
			RYD_TI_ControlTI = false;publicVariable "RYD_TI_ControlTI";
			};
			
		RYD_TI_wasControl = RYD_TI_Control;
			
		if (_debug) then
			{
			hintSilent format ["spd: %1\nalt: %2\nfps: %3\nfn: %4\nctrl: %5",((velocity _heli) distance [0,0,0]),(((getPosATL _heli) select 2) min ((getPosASL _heli) select 2)),diag_fps,_finish,RYD_TI_Control];
			};
		};	

	if (_debug) then
		{
		systemChat format ["Params: %1",RYD_TI_Params];
		};

	RYD_TI_wasControl = false;	
	RYD_TI_Control = false;
	RYD_TI_EFEH = addMissionEventHandler ["EachFrame",{RYD_TI_Params call RYD_TI_ContourFlight}];
	publicVariable "RYD_TI_EFEH";
	};
	
publicVariable "RYD_TI_TimidIcarus";

RYD_HAS_NewDestination = 
	{
	private ["_wps","_cntPath","_pathDone"];
	
	RYD_HAS_NewDestinationPending = true;
	publicVariable "RYD_HAS_NewDestinationPending";
	RYD_HAS_clickedPos2 = [];
	_gp = group RYD_HAS_Chopper;
	//[] call RYD_HAS_ClearRoute;
	//["RYD_HAS_HeliT","onMapSingleClick","RYD_HAS_MapPoint"] call BIS_fnc_addStackedEventHandler;

	[["RYD_HAS_HeliT","onMapSingleClick","RYD_HAS_MapPoint2"],BIS_fnc_addStackedEventHandler] remoteExec ["call",RYD_HAS_Caller];
	//openMap true;
	true remoteExec ["openMap",RYD_HAS_Caller];	
	["HelpLayer",["shift+LMB: new route navpoint\nalt+LMB: clear all navpoints\nLMB: final coordinates (ends route planning)","PLAIN DOWN"]] remoteExec ["cutText",RYD_HAS_Caller];
	_cntPath = +RYD_HAS_MidWPs;
	
	waitUntil
		{
		sleep 0.1;
		_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
		if not (_alive) exitWith {true};
		if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};
		
		if not (RYD_HAS_CruisingSpeed < 10) then
			{
			[RYD_HAS_Chopper] call RYD_HAS_TurningSpeed
			};

		(((count RYD_HAS_clickedPos2) > 1) or {(RYD_HAS_done)})				
		};

	//["RYD_HAS_HeliT", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
	[["RYD_HAS_HeliT", "onMapSingleClick"],BIS_fnc_removeStackedEventHandler] remoteExec ["call",RYD_HAS_Caller];
		
	RYD_HAS_NewDestinationPending = false;
	publicVariable "RYD_HAS_NewDestinationPending";	
	
	if not (_alive) exitWith {'Destination choice cancelled.' remoteExec ['hint'];};	
	if (_unable) exitWith {'Destination choice cancelled.' remoteExec ['hint'];};
	
	if (((count RYD_HAS_clickedPos2) < 1) or {((RYD_HAS_clickedPos2 select 0) isEqualTo -1000) or {(RYD_HAS_done)}}) exitWith 
		{
		if (RYD_HAS_done) then
			{
			//[] call RYD_HAS_ClearRoute;
			}
		else
			{
			if not (_cntPath isEqualTo RYD_HAS_MidWPs) then
				{
				_cntPath = +RYD_HAS_MidWPs;
				_cltWP = count (waypoints _gp);
				_wps = [RYD_HAS_Chopper,((waypoints _gp) select ((_cltWP - 2) max 0))] call RYD_HAS_ExecuteRoute;
				
				if ((count _wps) > 0) then
					{
					_refPos = waypointPosition (_wps select ((count _wps) - 1));
					RYD_HAS_clickedPosFR = _refPos getPos [(_refPos distance2D RYD_HAS_clickedPos) + 80, _refPos getDir RYD_HAS_clickedPos];
					_cltWP = count (waypoints _gp);
					if (_cltWP > 1) then
						{
						_wp1 = [_gp,(_cltWP - 2)];
						_wp2 = [_gp,(_cltWP - 1)];

						_wp1 setWaypointPosition [RYD_HAS_clickedPosFR,_rds];
						_wp2 setWaypointPosition [RYD_HAS_clickedPosFR,0];
						}
					};
				};
			};
			
		RYD_HAS_FastRoping = RYD_HAS_wasFastRoping;
		'Destination choice cancelled.' remoteExec ['hint'];
		RYD_HAS_clickedPos2 = [];
		false remoteExec ["openMap",RYD_HAS_Caller];
		};
			
	/*_i = "DZ_mark";
	_i = createMarker [_i,RYD_HAS_clickedPos];
	_i setMarkerColor "ColorRed";
	_i setMarkerShape "ICON";
	_i setMarkerType "mil_end";
	_i setMarkerSize [0.75,0.75];*/
			
	RYD_HAS_done = false;
	
	_rds = 50;
	deleteVehicle _helipad;
	_helipad = objNull;
	_minLvl = RYD_HAS_FastRopingLvl;
	
	RYD_HAS_clickedPos = RYD_HAS_clickedPos2;
	RYD_HAS_clickedPosFR = RYD_HAS_clickedPos;

	if ((RYD_HAS_FastRoping) or {(RYD_HAS_AlternativeLanding)}) then
		{
		if (RYD_HAS_FastRoping) then
			{
			_frPosArray = [RYD_HAS_clickedPos,_i,_minLvl] call RYD_HAS_FindFRpos;
			RYD_HAS_clickedPos = _frPosArray select 0;
			RYD_HAS_clickedPosFR = RYD_HAS_Chopper getPos [(RYD_HAS_Chopper distance2D RYD_HAS_clickedPos) + 80, RYD_HAS_Chopper getDir RYD_HAS_clickedPos];
			_minLvl = _frPosArray select 1;
			_rds = 0;
			}
		else
			{
			_alPosArray = [RYD_HAS_clickedPos,_i,RYD_HAS_Chopper] call RYD_HAS_FindALpos;
			RYD_HAS_clickedPos = _alPosArray select 0;
			RYD_HAS_clickedPosFR = RYD_HAS_Chopper getPos [(RYD_HAS_Chopper distance2D RYD_HAS_clickedPos) + 80, RYD_HAS_Chopper getDir RYD_HAS_clickedPos];
			_minLvl = 1;
			_rds = 0;
			};
		};
		
	_cltWP = count (waypoints _gp);

	[_gp,(_cltWP - 1)] setWaypointStatements ["true", ""];
	[_gp,(_cltWP - 2)] setWaypointStatements ["true", ""];

	deleteWaypoint [_gp,(_cltWP - 1)];
	deleteWaypoint [_gp,(_cltWP - 2)];
	
	_pathDone = ({(({((toLower (markerColor _x)) isEqualTo 'colorblue')} count (_x select 1)) > 0)} count RYD_HAS_MidWPs) < 1;
	
	if (_pathDone) then
		{
		RYD_HAS_Chopper doMove (position RYD_HAS_Chopper)
		};
		
	/*RYD_HAS_done2 = false;
		
	_wp0 = _gp addWaypoint [(position RYD_HAS_Chopper),0,0];
	_wp0 setWaypointType "MOVE";
	_wp0 setWaypointStatements ["true","RYD_HAS_done2 = true;deletewaypoint [(group this), 0];"];
	group RYD_HAS_Chopper setCurrentWaypoint _wp0;
	
	waitUntil
		{
		sleep 0.1;
		
		_alive = (alive RYD_HAS_Chopper) and {(canMove RYD_HAS_Chopper)};
		
		if not (_alive) exitWith {true};
		if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};
		
		RYD_HAS_done2
		};
	
	if not (_alive) exitWith {};
	if (_unable) exitWith {};*/
		
	_wps = [RYD_HAS_Chopper] call RYD_HAS_ExecuteRoute;
	
	//[RYD_HAS_MidWPs,true] call RYD_HAS_ClearRoute;
	
	if ((count _wps) > 0) then
		{
		if ((RYD_HAS_FastRoping) or {(RYD_HAS_AlternativeLanding)}) then
			{
			if (RYD_HAS_FastRoping) then
				{
				_frPosArray = [RYD_HAS_clickedPos,_i,_minLvl] call RYD_HAS_FindFRpos;
				RYD_HAS_clickedPos = _frPosArray select 0;
				_refPos = waypointPosition (_wps select ((count _wps) - 1));
				RYD_HAS_clickedPosFR = _refPos getPos [(_refPos distance2D RYD_HAS_clickedPos) + 80, _refPos getDir RYD_HAS_clickedPos];
				_minLvl = _frPosArray select 1;
				_rds = 0;
				}
			else
				{
				_alPosArray = [RYD_HAS_clickedPos,_i,RYD_HAS_Chopper] call RYD_HAS_FindALpos;
				RYD_HAS_clickedPos = _alPosArray select 0;
				_refPos = waypointPosition (_wps select ((count _wps) - 1));
				RYD_HAS_clickedPosFR = _refPos getPos [(_refPos distance2D RYD_HAS_clickedPos) + 80, _refPos getDir RYD_HAS_clickedPos];
				_minLvl = 1;
				_rds = 0;
				};
			};		
		}
	else
		{
		_wps = waypoints _gp;
		if ((count _wps) > 0) then
			{
			if ((RYD_HAS_FastRoping) or {(RYD_HAS_AlternativeLanding)}) then
				{
				if (RYD_HAS_FastRoping) then
					{
					_frPosArray = [RYD_HAS_clickedPos,_i,_minLvl] call RYD_HAS_FindFRpos;
					RYD_HAS_clickedPos = _frPosArray select 0;
					_refPos = waypointPosition (_wps select ((count _wps) - 1));
					RYD_HAS_clickedPosFR = _refPos getPos [(_refPos distance2D RYD_HAS_clickedPos) + 80, _refPos getDir RYD_HAS_clickedPos];
					_minLvl = _frPosArray select 1;
					_rds = 0;
					}
				else
					{
					_alPosArray = [RYD_HAS_clickedPos,_i,RYD_HAS_Chopper] call RYD_HAS_FindALpos;
					RYD_HAS_clickedPos = _alPosArray select 0;
					_refPos = waypointPosition (_wps select ((count _wps) - 1));
					RYD_HAS_clickedPosFR = _refPos getPos [(_refPos distance2D RYD_HAS_clickedPos) + 80, _refPos getDir RYD_HAS_clickedPos];
					_minLvl = 1;
					_rds = 0;
					};
				};
			}
		};
			
	_wp1 = _gp addWaypoint [RYD_HAS_clickedPosFR, _rds];
	_wp1 setWaypointType "MOVE";
	_wp1 setWaypointStatements ["true", "RYD_HAS_done = true;"];	

	_wp2 = _gp addWaypoint [(waypointPosition _wp1),0];
	_wp2 setWaypointType "MOVE";

	_helipadArr = [_helipad,_i];
	
	if not ((RYD_HAS_FastRoping) or {(RYD_HAS_AlternativeLanding)}) then
		{
		_wp2 setWaypointStatements ["true", "RYD_HAS_Chopper land 'GET OUT';"];		
		_helipadArr = [RYD_HAS_clickedPos,_i,true,RYD_HAS_Chopper] call RYD_HAS_LZ;
		_helipad = _helipadArr select 0
		}
	else
		{
		if (RYD_HAS_FastRoping) then
			{
			_command = format ["RYD_HAS_Chopper flyInHeight %1;RYD_HAS_Chopper setVariable ['RYD_HAS_myLvl',%1];",_minLvl];
			_wp2 setWaypointStatements ["true", _command]
			};
		};
			
	sleep 1;
	//openMap false;
	false remoteExec ["openMap",RYD_HAS_Caller];
	
	if (RYD_HAS_VoiceChat) then
		{
		(driver RYD_HAS_Chopper) kbTell [RYD_HAS_Caller, "BIS_SUPP_protocol", "Transport_LZ_Selected", ""];
		}
	else
		{
		_txt = selectRandom RYD_HAS_sent_LZSelected;
		//(driver RYD_HAS_Chopper) customChat [RYD_HAS_PilotChannel,_txt];
		[(driver RYD_HAS_Chopper),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
		};
	};
	
RYD_HAS_FindClosest = 
	{
	private ["_ref","_objects","_closest","_dstMin","_dstAct","_obj"];

	_ref = _this select 0;
	_objects = _this select 1;

	_closest = objNull;

	if ((count _objects) > 0) then 
		{
		_closest = _objects select 0;
		_obj = _closest;
	
		_dstMin = _ref distance _obj;

			{
			_obj = _x;			
			_dstAct = _ref distance _obj;

			if (_dstAct < _dstMin) then
				{
				_closest = _x;
				_dstMin = _dstAct
				}
			}
		foreach _objects
		};

	_closest
	};
	
RYD_HAS_ManualTarget = 
	{
	params ["_veh","_tPos"];
	
	RYD_HAS_EF_veh = _veh;
	RYD_HAS_EF_myPos = _veh getVariable ["RYD_HAS_myFiringPos",(getPosASL _veh)];
	_veh setVariable ["RYD_HAS_myFiringPos",RYD_HAS_EF_myPos];
	RYD_HAS_EF_tVec = RYD_HAS_EF_myPos vectorFromTo ATLtoASL _tPos;

	RYD_HAS_EF_tV0 = RYD_HAS_EF_tVec select 0;
	RYD_HAS_EF_tV1 = RYD_HAS_EF_tVec select 1;
	RYD_HAS_EF_tV2 = RYD_HAS_EF_tVec select 2;
	
	RYD_HAS_EF_t1 = time; 
	RYD_HAS_EF_t2 = RYD_HAS_EF_t1 + 5;

	private _id = addMissionEventHandler 
		[
		"EachFrame", 
		
			{
			if (isGamePaused) exitWith {};
			if (isNil "RYD_HAS_Chopper") exitwith {removeMissionEventHandler ["EachFrame",_thisEventHandler];};
			if ((isNull RYD_HAS_Chopper) or {not (alive RYD_HAS_Chopper) or {(isNull (driver RYD_HAS_Chopper)) or {not (alive (driver RYD_HAS_Chopper))}}}) exitwith {removeMissionEventHandler ["EachFrame",_thisEventHandler];};
			if ((RYD_HAS_wasHit) and {(({_x > 0.5} count ((getAllHitPointsDamage RYD_HAS_Chopper) select 2)) > 0)}) exitWith {removeMissionEventHandler ["EachFrame",_thisEventHandler];};
			_actVec = vectorDir RYD_HAS_EF_veh;

			if ((abs((_actVec select 0) - RYD_HAS_EF_tV0)) < 0.01) then
				{
				_actVec set [0,RYD_HAS_EF_tV0]
				};			

			if ((abs((_actVec select 1) - RYD_HAS_EF_tV1)) < 0.01) then
				{
				_actVec set [1,RYD_HAS_EF_tV1]
				};				
			
			if ((abs((_actVec select 2) - RYD_HAS_EF_tV2)) < 0.01) then
				{
				_actVec set [2,RYD_HAS_EF_tV2]
				};
				 
			RYD_HAS_EF_veh setVelocityTransformation 
				[
				RYD_HAS_EF_myPos, 
				RYD_HAS_EF_myPos, 
				[0,0,0], 
				[0,0,0], 
				_actVec, 
				RYD_HAS_EF_tVec, 
				[0,0,1], 
				[0,0,1],
				(linearConversion [RYD_HAS_EF_t1, RYD_HAS_EF_t2, time, 0, 1])
				];
			}
		];
		
	waitUntil
		{
		_vc1 = vectorDir _veh;
		sleep 0.1;
		if ((isNull RYD_HAS_Chopper) or {not (alive RYD_HAS_Chopper) or {(isNull (driver RYD_HAS_Chopper)) or {not (alive (driver RYD_HAS_Chopper))}}}) exitwith {_alive = false;true};
		if (((RYD_HAS_wasHit) and {(({_x > 0.5} count ((getAllHitPointsDamage RYD_HAS_Chopper) select 2)) > 0)}) or {RYD_HAS_CallCancelled}) exitWith {_cancelled = true;true};
		
		_vc2 = vectorDir _veh;
		
		((_vc1 distance _vc2) < 0.01)
		};
		
	if (not (_alive) or {_cancelled}) exitWith {removeMissionEventHandler ["EachFrame",_id];-1};

	_id
	};

RYD_HAS_Fire = 
	{
	params ["_veh","_tPos","_weaponsAll","_duration","_targets","_homing","_modeAI"];
	
	private _weaponsHoming = _weaponsAll select 0;
	private _rockets = _weaponsAll select 1;
	private _guns = _weaponsAll select 2;
	
	if (((count _weaponsHoming) < 1) and {((count _rockets) < 1) and {((count _guns) < 1)}}) exitWith {};
	
	if (_modeAI) then//not working
		{
		_allTargets = _homing + (_targets - _homing);
		_gp = group _veh;
		_gunner = gunner _veh;
		if (isNull _gunner) then
			{
			_gunner = driver _veh
			};
			
		_lTgts = [];
		_targetType = if (((side _veh) getFriend west) > 0.6) then {"LaserTargetW"} else {"LaserTargetE"};
			
			{
			_tPos = getPosATL _x;
			_tPos set [2,1];
			_target = createvehicle [_targetType,_tPos,[],0,"CAN_COLLIDE"];
			_veh reveal _target;
			_gunner reveal _target;
			_lTgts pushBack _target
			}
		foreach _homing;
		
		_gp setCombatMode "YELLOW";
		
			{
			_veh reveal _x;
			_gunner reveal _x;
			}
		foreach _allTargets;
		
			{
			_veh doTarget _x;
			_gunner doTarget _x;
			
			sleep _duration
			}
		foreach _lTgts;

		sleep (_duration * ((count _allTargets) - (count _lTgts)));
		
		_gp setCombatMode "BLUE";
		
			{
			deleteVehicle _x
			}
		foreach _lTgts;
		
			{
			_veh forgetTarget _x;
			_gunner forgetTarget _x;
			}
		foreach _allTargets;
		}
	else
		{
		private _id = [_veh,_tPos] call RYD_HAS_ManualTarget;	
		if ((isNull RYD_HAS_Chopper) or {not (alive RYD_HAS_Chopper) or {(isNull (driver RYD_HAS_Chopper)) or {not (alive (driver RYD_HAS_Chopper))}}}) exitwith {_alive = false;removeMissionEventHandler ["EachFrame",_id];};
		if (((RYD_HAS_wasHit) and {(({_x > 0.5} count ((getAllHitPointsDamage RYD_HAS_Chopper) select 2)) > 0)}) or {RYD_HAS_CallCancelled}) exitWith {_cancelled = true;removeMissionEventHandler ["EachFrame",_id];};
		
		[_veh,_weaponsAll,_duration,_targets,_homing,_id,_tPos] call RYD_HAS_doFire;

		_veh setVariable ["RYD_HAS_myFiringPos",nil];
		}
	};
	
RYD_HAS_doFire = 
	{
	private ["_tme","_tPos3"];
	params ["_veh","_weaponsAll","_duration","_targets","_homing","_id","_tPos"];

	private _weaponsH = _weaponsAll select 0;
	private _rockets = _weaponsAll select 1;
	private _guns = _weaponsAll select 2;
	
	if (((count _weaponsHoming) < 1) and {((count _rockets) < 1) and {((count _guns) < 1)}}) exitWith {};
	
	private _weapons = _rockets + _guns;
	
	private _gunner = gunner _veh;
	if (isNull _gunner) then
		{
		_gunner = driver _veh
		};

	private _gp = group _veh;
	private _vehPos = getPosATL _veh;
	RYD_HAS_noAmmoWeapons = [];
	
	private _wasFired = false;
	private _areaPos = +_tPos;
	
	RYD_HAS_HitArray = [];
	RYD_HAS_RTF = false;
	
	private _fEH = _veh addEventHandler ["Fired",
		{
		RYD_HAS_Done = true;
		RYD_HAS_Proj = (_this select 6);
		if (RYD_HAS_RTF) then
			{
			RYD_HAS_HitPosition = position RYD_HAS_Proj;
			
			[] spawn
				{
				waitUntil
					{
					if not (isNull RYD_HAS_Proj) then
						{
						RYD_HAS_HitPosition = position RYD_HAS_Proj;
						if ((RYD_HAS_HitPosition select 2) < 0.05) then 
							{
							RYD_HAS_Proj = objNull
							};
						};
						
					(isNull RYD_HAS_Proj)
					};
					
				RYD_HAS_HitArray pushBack RYD_HAS_HitPosition
				};
			};
		}];

	if not ((({(alive _x)} count _homing) == 0) and {(({(alive _x)} count _targets) == 0)}) then
		{	
		if ((({(alive _x)} count _homing) > 0) and {((count _weaponsH) > 0)}) then
			{			
			while {(({(not(isNull _x) and {(alive _x)})} count _homing) > 0)} do
				{
				_hasAmmo = ({not ((_x select 0) in RYD_HAS_noAmmoWeapons)} count _weaponsH) > 0;
				if not (_hasAmmo) exitWith {};
				
					{
					_wh = _x;
					_weap = _wh select 0;
					if not (_weap in RYD_HAS_noAmmoWeapons) then
						{
						_mags = getArray (configFile >> "CfgWeapons" >> _weap >> "magazines");
						_vehMags = [];//magazines _veh;
						_vehAmmo = [];
						_ammo = 0;
						
							{
							if ((_x select 2) > 0) then
								{
								_class = toLower (_x select 0);
								_isBL = false;
								
									{
									if not ((_class find _x) < 0) exitWith
										{
										_isBL = true;
										}
									}
								foreach ["fake","dummy","designator","laserbatteries","flare"];
								
								if not (_isBL) then
									{
									if ((_x select 0) in _mags) then
										{
										//_vehMags pushBack (_x select 0);
										//_vehAmmo pushBack (_x select 2);
										_ammo = _ammo + (_x select 2);
										};
									}
								};
							}
						foreach (magazinesAllTurrets _veh);
						
						if (_ammo < 1) then
							{
							RYD_HAS_noAmmoWeapons pushBack _weap
							}
						else
							{
								{
								_ix = _foreachindex;

								if (alive _x) then
									{
									_cw = currentWeapon _veh;
									
									RYD_HAS_Proj = objNull;
									_tPos = getPosATL _x;
									_tPos set [2,1.5];
									_tPos1 = +_tPos;
									_tPos1 set [2,1];
									_tPos2 = +_tPos;
									_tPos2 set [2,0.5];
									/*_toDir = _vehPos getDir _tPos;
									_tPosA = _tPos getPos [1,_toDir + 90];
									_tPosB = _tPos getPos [1,_toDir - 90];
									_tPos1A = +_tPosA;
									_tPos1A set [2,1];
									_tPos2A = +_tPosA;
									_tPos2A set [2,0.5];
									_tPos1B = +_tPosB;
									_tPos1B set [2,1];
									_tPos2B = +_tPosB;
									_tPos2B set [2,0.5];*/

									//diag_log format ["LOS2: %1",[(terrainIntersect [_vehPos,_tPos1A]),(lineIntersects [ATLtoASL _vehPos, ATLtoASL _tPos2A, _veh, _x])]];
									//diag_log format ["LOS3: %1",[(terrainIntersect [_vehPos,_tPos1B]),(lineIntersects [ATLtoASL _vehPos, ATLtoASL _tPos2B, _veh, _x])]];
									
									if (not (terrainIntersect [_vehPos,_tPos1]) and {not (lineIntersects [ATLtoASL _vehPos, ATLtoASL _tPos2, _veh, _x])}) then 
										//{not (terrainIntersect [_vehPos,_tPos1A]) and {not (lineIntersects [ATLtoASL _vehPos, ATLtoASL _tPos2A, _veh, _x])} or 
											//{not (terrainIntersect [_vehPos,_tPos1B]) and {not (lineIntersects [ATLtoASL _vehPos, ATLtoASL _tPos2B, _veh, _x])}}}) then
										{
										//_gp setCombatMode "YELLOW";
									
										removeMissionEventHandler ["EachFrame",_id];
										_id = [_veh,_tPos] call RYD_HAS_ManualTarget;
										sleep 0.5;
										_veh reveal _x;
										_gunner reveal _x;
										_veh doTarget _x;
										_gunner doTarget _x;

										RYD_HAS_Done = false;
										_tme = time;

										_targetType = if (((side _veh) getFriend west) > 0.6) then {"LaserTargetW"} else {"LaserTargetE"};
										_target = createvehicle [_targetType,_tPos,[],0,"CAN_COLLIDE"];
										sleep 0.1;
										waitUntil
											{															
											_mags = getArray (configFile >> "CfgWeapons" >> _weap >> "magazines");
											_vehMags = [];//magazines _veh;
											_vehAmmo = [];
											_ammo = 0;
											
												{
												if ((_x select 2) > 0) then
													{
													_class = toLower (_x select 0);
													_isBL = false;
													
														{
														if not ((_class find _x) < 0) exitWith
															{
															_isBL = true;
															}
														}
													foreach ["fake","dummy","designator","laserbatteries","flare"];
													
													if not (_isBL) then
														{
														if ((_x select 0) in _mags) then
															{
															//_vehMags pushBack (_x select 0);
															//_vehAmmo pushBack (_x select 2);
															_ammo = _ammo + (_x select 2);
															};
														}
													};
												}
											foreach (magazinesAllTurrets _veh);
											
											if (_ammo < 1) then
												{
												RYD_HAS_noAmmoWeapons pushBack _weap
												}
											else
												{
													/*{
													_veh selectWeaponTurret [_weap,(_x select 3)];
													(_x select 0) fireAtTarget [_target,_weap]
													}
												foreach (fullCrew _veh);*/
												_gunner fireAtTarget [_target,_weap];
												_wasFired = true;
												sleep 0.5;
												if ((isNull RYD_HAS_Chopper) or {not (alive RYD_HAS_Chopper) or {(isNull (driver RYD_HAS_Chopper)) or {not (alive (driver RYD_HAS_Chopper))}}}) exitwith {_alive = false};
												if ((isNull _gunner) or {not (alive _gunner)}) exitWith {_alive = false};
												if (((RYD_HAS_wasHit) and {(({_x > 0.5} count ((getAllHitPointsDamage RYD_HAS_Chopper) select 2)) > 0)}) or {RYD_HAS_CallCancelled}) exitWith {_cancelled = true;};
												};

											if (not (_alive) or {_cancelled}) exitWith {true};
											_hasAmmo = ({not ((_x select 0) in RYD_HAS_noAmmoWeapons)} count _weaponsH) > 0;
											
											((RYD_HAS_Done) or {((time - _tme) > 15) or {not (_hasAmmo)}})
											};
										
										if (not (_alive) or {_cancelled}) exitWith {true};
										//_gp setCombatMode "BLUE";
										
										waitUntil
											{
											sleep 0.1;
											if ((isNull RYD_HAS_Chopper) or {not (alive RYD_HAS_Chopper) or {(isNull (driver RYD_HAS_Chopper)) or {not (alive (driver RYD_HAS_Chopper))}}}) exitwith {_alive = false;true};
											if (((RYD_HAS_wasHit) and {(({_x > 0.5} count ((getAllHitPointsDamage RYD_HAS_Chopper) select 2)) > 0)}) or {RYD_HAS_CallCancelled}) exitWith {_cancelled = true;true};
											
											(isNull RYD_HAS_Proj)
											};
										
										deleteVehicle _target;
										if (not (_alive) or {_cancelled}) exitWith {} 
										}
									else
										{				
										_homing set [_ix,objNull];
										}
									}
								}
							foreach _homing;
							if (not (_alive) or {_cancelled}) exitWith {};
							
							_homing = _homing - [objNull];
							}
						};
						
					if (not (_alive) or {_cancelled}) exitWith {};
					}
				foreach _weaponsH;
				
				if (not (_alive) or {_cancelled}) exitWith {};
				};
		
			if (not (_alive) or {_cancelled}) exitWith {};
			_veh doWatch objNull;
			_gunner doWatch objNull;		
			};
	
		if ((({(alive _x)} count _targets) > 0) and {((count _weapons) > 0)}) then
			{
			_tol = 0;
			while {(({(not(isNull _x) and {(alive _x)})} count _targets) > 0)} do
				{
				_hasAmmo = ({not ((_x select 0) in RYD_HAS_noAmmoWeapons)} count _weapons) > 0;
				if not (_hasAmmo) exitWith {};
				
					{
					_tgt = _x;
					_ix = _foreachIndex;
					if (alive _x) then
						{
						_tPos = getPosATL _x;
						_tPos set [2,1];		
						
						_tme = time + _duration;
						_exitNow = false;
						
						waituntil 
							{
								{
								_isGun = _foreachIndex == 1;
								
									{
									_weap = _x select 0;
									if not (_weap in RYD_HAS_noAmmoWeapons) then
										{									
										_mags = getArray (configFile >> "CfgWeapons" >> (_x select 0) >> "magazines");
										_vehMags = [];//magazines _veh;
										_vehAmmo = [];
										_ammo = 0;
										
											{
											if ((_x select 2) > 0) then
												{
												_class = toLower (_x select 0);
												_isBL = false;
												
													{
													if not ((_class find _x) < 0) exitWith
														{
														_isBL = true;
														}
													}
												foreach ["fake","dummy","designator","laserbatteries","flare"];
												
												if not (_isBL) then
													{
													if ((_x select 0) in _mags) then
														{
														//_vehMags pushBack (_x select 0);
														//_vehAmmo pushBack (_x select 2);
														_ammo = _ammo + (_x select 2);
														};
													}
												};
											}
										foreach (magazinesAllTurrets _veh);

										_ihr = 1;

										if (_ammo < 1) then
											{
											RYD_HAS_noAmmoWeapons pushBack _weap
											}
										else
											{
											_dst1 = _veh distance2D _tPos;
											_bracket = (((4 * (_dst1/600)) max 2) min 12);
											_wasFar = 0;
											_noShot = false;
											_wasMiss = true;
											
											while {(not _exitNow)} do
												{
												_exitNow = not _wasMiss;
												_hit = 0;
												_iHit = 0;
												RYD_HAS_HitArray = [];
												_am = _veh getVariable [("RYD_HAS_FireAm_" + _weap),0];
												
												if (isArray (configfile >> "CfgWeapons" >> _weap >> "magazines")) then
													{
													_mags = (getArray (configfile >> "CfgWeapons" >> _weap >> "magazines"));
													
													if ((count _mags) > 0) then
														{
														_mag = _mags select 0;
														
														if (isText (configfile >> "CfgMagazines" >> _mag >> "simulation")) then
															{
															_ammoC = getText (configfile >> "CfgMagazines" >> _mag >> "ammo");
															_sim = configFile >> "CfgAmmo" >> _ammoC >> "simulation";
															_hit = configFile >> "CfgAmmo" >> _ammoC >> "hit";
															_iHit = configFile >> "CfgAmmo" >> _ammoC >> "indirectHit";
															
															_hit = if (isNumber _hit) then
																{
																(getNumber _hit)
																}
															else
																{
																0
																};
																
															_iHit = if (isNumber _iHit) then
																{
																(getNumber _iHit)
																}
															else
																{
																0
																};
															
															_ihrC = configFile >> "CfgAmmo" >> _ammoC >> "indirectHitRange";
															if (isNumber _ihrC) then
																{
																_ihr = (floor (getNumber _ihrC)) max 1
																};
															
															if not ((isText _sim) and {((toLower (getText _sim)) in ["shotmissile","shotrocket"])}) then
																{
																_addLvl = (_veh distance _tPos)/100;
																_dst = _veh distance _tPos;
																_addLvl = _dst/100;
																_ts = configFile >> "CfgAmmo" >> _ammoC >> "typicalSpeed";
																if (isNumber _ts) then
																	{
																	_ts = getNumber _ts;
																	_elev = (aSin (9.81 * _dst/(_ts^2)))/2;
																	_elev = _elev min (90 - _elev);
																	_addLvl = _dst * (sin _elev);
																	};
																	
																_tPos set [2,((1 * 1000/_dst) + _addLvl + _am)];
																//a1 setPosATL _tPos;
																}
															else
																{
																_tPos set [2,(1 + _am)];
																//a1 setPosATL _tPos;
																}
															};
														};
													};
													
												if not ((_hit > 1) or {(_iHit > 0)}) exitWith 
													{
													RYD_HAS_noAmmoWeapons pushBack _weap
													};

												_tPos2 = +_tPos;
												_tPos2 set [2,1];
												_tPos3 = _tPos2 getPos [25,_tPos2 getDir _vehPos];
												_tPos3 set [2,0.5];
												_toDir = _vehPos getDir _tPos;
												_tPos2A = _tPos2 getPos [2,_toDir + 90];
												_tPos2A set [2,1];
												_tPos2B = _tPos2 getPos [2,_toDir - 90];
												_tPos2B set [2,1];
												_tPos3A = _tPos3 getPos [2,_toDir + 90];
												_tPos3A set [2,0.5];
												_tPos3B = _tPos3 getPos [2,_toDir - 90];
												_tPos3B set [2,0.5];
												
												if ((not (terrainIntersect [_vehPos,_tPos2]) and {not (lineIntersects [ATLtoASL _vehPos, ATLtoASL _tPos3, _veh, _tgt])}) or 
													{not (terrainIntersect [_vehPos,_tPos2A]) and {not (lineIntersects [ATLtoASL _vehPos, ATLtoASL _tPos3A, _veh, _tgt])} or 
														{not (terrainIntersect [_vehPos,_tPos2B]) and {not (lineIntersects [ATLtoASL _vehPos, ATLtoASL _tPos3B, _veh, _tgt])}}}) then																					
													{
													if (_wasMiss) then
														{
														removeMissionEventHandler ["EachFrame",_id];
														_id = [_veh,_tPos] call RYD_HAS_ManualTarget;
														
														sleep 0.5
														};
														
													RYD_HAS_RTF = true;
													
													_shotF = 1;
													_cnt = if (_isGun) then
														{
														5
														//((round(((_ammo/10) min 10)/_ihr)) max 1)
														}
													else
														{
														3
														//((round(((_ammo/10) min 10)/_ihr)) max 1)
														};

													//for "_i" from 1 to ((round(((_ammo/10) min 10)/_ihr)) max 1) do
													if not (_wasMiss) then
														{
														_cnt = _cnt^3;
														};
													
													while {(_shotF <= _cnt)} do
														{
														RYD_HAS_Proj = objNull;
														RYD_HAS_HitPosition = _tPos;
														_gunner fireAtTarget [_tgt,_weap];

														_wasFired = true;
														_tme = time;

														waitUntil
															{	
															if ((isNull RYD_HAS_Chopper) or {not (alive RYD_HAS_Chopper) or {(isNull (driver RYD_HAS_Chopper)) or {not (alive (driver RYD_HAS_Chopper))}}}) exitwith {true};
															if ((isNull _gunner) or {not (alive _gunner)}) exitWith {_alive = false};
															if (((RYD_HAS_wasHit) and {(({_x > 0.5} count ((getAllHitPointsDamage RYD_HAS_Chopper) select 2)) > 0)}) or {RYD_HAS_CallCancelled}) exitWith {true};
															if ((isNull _tgt) or {not (alive _tgt)}) exitWith {true};
															if ((_tgt distance2D _tPos) > 5) exitWith {true};
															if ((time - _tme) > 5) exitWith {_noShot = true;true};
															
															not (isNull RYD_HAS_Proj)
															};
															
														if ((isNull RYD_HAS_Chopper) or {not (alive RYD_HAS_Chopper) or {(isNull (driver RYD_HAS_Chopper)) or {not (alive (driver RYD_HAS_Chopper))}}}) exitwith {_alive = false;};
														if ((isNull _gunner) or {not (alive _gunner)}) exitWith {_alive = false;};
														if (((RYD_HAS_wasHit) and {(({_x > 0.5} count ((getAllHitPointsDamage RYD_HAS_Chopper) select 2)) > 0)}) or {RYD_HAS_CallCancelled}) exitWith {_cancelled = true;};
														if ((isNull _tgt) or {not (alive _tgt)}) exitWith {_targets set [_ix,objNull];};
														if ((_tgt distance2D _tPos) > 5) exitWith {_wasMiss = true;_dst1 = _veh distance2D _tPos;_bracket = (((4 * (_dst1/600)) max 2) min 12);_tPos = getPosATL _tgt;_tPos set [2,1];};
														if (_noShot) exitWith {};
														
														if ((time - _tme) > 5) exitWith 
															{
															(RYD_HAS_noAmmoWeapons pushBack _weap)
															};
														
														if (_wasMiss) then
															{
															_tme = time;
															
															waitUntil
																{	
																if ((isNull RYD_HAS_Chopper) or {not (alive RYD_HAS_Chopper) or {(isNull (driver RYD_HAS_Chopper)) or {not (alive (driver RYD_HAS_Chopper))}}}) exitwith {true};
																if ((isNull _gunner) or {not (alive _gunner)}) exitWith {_alive = false};
																if (((RYD_HAS_wasHit) and {(({_x > 0.5} count ((getAllHitPointsDamage RYD_HAS_Chopper) select 2)) > 0)}) or {RYD_HAS_CallCancelled}) exitWith {true};
																if ((isNull _tgt) or {not (alive _tgt)}) exitWith {true};
																if ((_tgt distance2D _tPos) > 5) exitWith {true};
																if ((time - _tme) > 5) exitWith {true};

																(isNull RYD_HAS_Proj)
																};
															};
																																							
														sleep 0.1;
														
														if ((isNull RYD_HAS_Chopper) or {not (alive RYD_HAS_Chopper) or {(isNull (driver RYD_HAS_Chopper)) or {not (alive (driver RYD_HAS_Chopper))}}}) exitwith {_alive = false;};
														if ((isNull _gunner) or {not (alive _gunner)}) exitWith {_alive = false;};
														if (((RYD_HAS_wasHit) and {(({_x > 0.5} count ((getAllHitPointsDamage RYD_HAS_Chopper) select 2)) > 0)}) or {RYD_HAS_CallCancelled}) exitWith {_cancelled = true;};
														if ((isNull _tgt) or {not (alive _tgt)}) exitWith {_targets set [_ix,objNull];};
														if ((_tgt distance2D _tPos) > 5) exitWith {_wasMiss = true;_dst1 = _veh distance2D _tPos;_bracket = (((4 * (_dst1/600)) max 2) min 12);_tPos = getPosATL _tgt;_tPos set [2,1];};
														if (_noShot) exitWith {};
														_shotF = _shotF + 1;
														};
														
													RYD_HAS_RTF = false;
													
													_arr = +RYD_HAS_HitArray;
													
													if ((count _arr) > 0) then
														{
														_xCoords = 0;
														_yCoords = 0;
														_arrCnt = 0;
														
															{
															if ((_x distance2D _tPos) < 1000) then
																{
																_xCoords = _xCoords + (_x select 0);
																_yCoords = _yCoords + (_x select 1);
																_arrCnt = _arrCnt + 1;
																}
															}
														foreach _arr;
														
														if (_arrCnt > 0) then
															{
															_avPos = [(_xCoords/(_arrCnt max 1)),(_yCoords/(_arrCnt max 1)),0];
															//_arrow = createvehicle ["Sign_Arrow_Large_F",_avPos,[],0,"CAN_COLLIDE"];
															RYD_HAS_HitArray = [];
															
															_dst1 = _veh distance2D _tPos;
															_dst2 = _veh distance2D _avPos;
															_diff = _dst1 - _dst2;
															_wasMiss = (_wasMiss) and {(_bracket > 0.5) and {((abs _diff) > (((_ihr min 16) * (_dst1/600)) max 8))}};
															//diag_log format ["if miss: %1",[_wasMiss,_bracket,_diff,(((_ihr min 16) * (_dst1/600)) max 8)]];

															if (_wasMiss) then
																{
																if (_diff > 0) then
																	{
																	if (_wasFar > 0) then
																		{
																		_bracket = _bracket/2
																		};
																		
																	_wasFar = -1;
																	}
																else
																	{
																	if (_wasFar < 0) then
																		{
																		_bracket = _bracket/2
																		};
																		
																	_wasFar = 1;
																	};
																
																_lvlDiff = ((getPosASL _veh) select 2) - (getTerrainHeightASL _tPos);
																//diag_log format ["bracket: %1",[_bracket,abs(_diff * (_lvlDiff/(_heli distance [(_tPos select 0),(_tPos select 1),0])))]];
																_bracket = (abs(_diff * (_lvlDiff/(_heli distance [(_tPos select 0),(_tPos select 1),0]))));
																_amN = _bracket * (-_wasFar);
																_veh setVariable [("RYD_HAS_FireAm_" + _weap),(_am + _amN)];		
																_tPos set [2,(_tPos select 2) + _amN];
																	
																//removeMissionEventHandler ["EachFrame",_id];
																//_id = [_veh,_tPos] call RYD_HAS_ManualTarget;
																};
															};
														};
													}
												else
													{
													_targets set [_ix,objNull];
													_tme = 0;
													_exitNow = true;
													};

												if ((isNull RYD_HAS_Chopper) or {not (alive RYD_HAS_Chopper) or {(isNull (driver RYD_HAS_Chopper)) or {not (alive (driver RYD_HAS_Chopper))}}}) exitwith {_alive = false;};
												if ((isNull _gunner) or {not (alive _gunner)}) exitWith {_alive = false;};
												if (((RYD_HAS_wasHit) and {(({_x > 0.5} count ((getAllHitPointsDamage RYD_HAS_Chopper) select 2)) > 0)}) or {RYD_HAS_CallCancelled}) exitWith {_cancelled = true;};
												if ((isNull _tgt) or {not (alive _tgt)}) exitWith {_targets set [_ix,objNull];};
												//if ((_tgt distance2D _tPos) > 5) exitWith {};
												if (_noShot) exitWith {};
												//if not (_wasMiss) exitWith {};													
												}
											}
										};
										
									if (not (_alive) or {_cancelled}) exitWith {};
									if ((isNull _tgt) or {not (alive _tgt)}) exitWith {_tme = 0;};
									//if ((_tgt distance2D _tPos) > 5) exitWith {_tme = 0;};
									if (_exitNow) exitWith {};
									}
								foreach _x;
								
								if (not (_alive) or {_cancelled}) exitWith {};
								if ((isNull _tgt) or {not (alive _tgt)}) exitWith {_tme = 0;};
								//if ((_tgt distance2D _tPos) > 5) exitWith {_tme = 0;};
								if (_exitNow) exitWith {};
								} 
							foreach [_rockets,_guns];
							
							if (not (_alive) or {_cancelled}) exitWith {true};
							if (_exitNow) exitWith {true};
							_hasAmmo = ({not ((_x select 0) in RYD_HAS_noAmmoWeapons)} count _weapons) > 0;					
								
							((time > _tme) or {not (_hasAmmo)})					
							};
						};
						
					if (not (_alive) or {(_cancelled) or {not (_hasAmmo)}}) exitWith {};
					}
				foreach _targets;
				
				if (not (_alive) or {(_cancelled) or {not (_hasAmmo)}}) exitWith {};
				
				_cnt1 = count _targets;
				_targets = _targets - [objNull];
				_cnt2 = count _targets;
							
				if (_cnt1 == _cnt2) then 
					{
					_tol = _tol + 1 + ([_veh] call RYD_HAS_ActDamageSum)
					};
					
				if ((random _tol) > (random _cnt2)) exitWith {};
				};
			};
		};
		
	if not (_wasFired) then
		{
		_hasAmmo = ({not ((_x select 0) in RYD_HAS_noAmmoWeapons)} count _weapons) > 0;
		if not (_hasAmmo) exitWith {};
		_tme = time + _duration;
		
		waituntil 
			{
				{
				_tPos set [2,1];
				_weap = _x select 0;
				_cm = currentMuzzle _gunner;
				if not (_weap in RYD_HAS_noAmmoWeapons) then
					{														
					_mags = getArray (configFile >> "CfgWeapons" >> (_x select 0) >> "magazines");
					_vehMags = [];//magazines _veh;
					_vehAmmo = [];
					_ammo = 0;
					
						{
						if ((_x select 2) > 0) then
							{
							_class = toLower (_x select 0);
							_isBL = false;
							
								{
								if not ((_class find _x) < 0) exitWith
									{
									_isBL = true;
									}
								}
							foreach ["fake","dummy","designator","laserbatteries","flare"];
							
							if not (_isBL) then
								{
								if ((_x select 0) in _mags) then
									{
									//_vehMags pushBack (_x select 0);
									//_vehAmmo pushBack (_x select 2);
									_ammo = _ammo + (_x select 2);
									};
								}
							};
						}
					foreach (magazinesAllTurrets _veh);

					_ihr = 1;
					
					if (_ammo < 1) then
						{
						RYD_HAS_noAmmoWeapons pushBack _weap
						}
					else
						{
						_hit = 0;
						_iHit = 0;
						if (isArray (configfile >> "CfgWeapons" >> _weap >> "magazines")) then
							{
							_mags = (getArray (configfile >> "CfgWeapons" >> _weap >> "magazines"));
							if ((count _mags) > 0) then
								{
								_mag = _mags select 0;
								
								if (isText (configfile >> "CfgMagazines" >> _mag >> "simulation")) then
									{
									_ammoC = getText (configfile >> "CfgMagazines" >> _mag >> "ammo");
									_sim = configFile >> "CfgAmmo" >> _ammoC >> "simulation";
									
									_hit = configFile >> "CfgAmmo" >> _ammoC >> "hit";
									_iHit = configFile >> "CfgAmmo" >> _ammoC >> "indirectHit";
									
									_hit = if (isNumber _hit) then
										{
										(getNumber _hit)
										}
									else
										{
										0
										};
										
									_iHit = if (isNumber _iHit) then
										{
										(getNumber _iHit)
										}
									else
										{
										0
										};									
									
									_ihrC = configFile >> "CfgAmmo" >> _ammoC >> "indirectHitRange";
									if (isNumber _ihrC) then
										{
										_ihr = (floor (getNumber _ihrC)) max 1
										};
									
									if not ((isText _sim) and {((toLower (getText _sim)) in ["shotmissile","shotrocket"])}) then
										{
										_dst = _veh distance _tPos;
										_addLvl = _dst/100;
										_ts = configFile >> "CfgAmmo" >> _ammoC >> "typicalSpeed";
										if (isNumber _ts) then
											{
											_ts = getNumber _ts;
											_elev = (aSin (9.81 * _dst/(_ts^2)))/2;
											_elev = _elev min (90 - _elev);
											_addLvl = _dst * (sin _elev);
											};
											
										_tPos set [2,((1 * 1000/_dst) + _addLvl)];
										//a2 setPosATL _tPos;
										};
									};
								};
							};

						if not ((_hit > 1) or {(_iHit > 0)}) exitWith 
							{
							RYD_HAS_noAmmoWeapons pushBack _weap
							};							
							
						_tPos2 = +_areaPos;
						_tPos2 set [2,5];
						/*_tPos3 = _tPos2 getPos [(_vehPos distance2D _tPos2)/2,(_tPos2 getDir _vehPos)];
						_tPos3 set [2,(((((ATLtoASL _vehPos) select 2) + (getTerrainHeightASL _tPos2))/2) + 0.5)];
						_tPos3 = ASLtoATL _tPos3;*/
						
						if not (terrainIntersect [_vehPos,_tPos2]) then
							{							
							removeMissionEventHandler ["EachFrame",_id];
							_id = [_veh,_tPos2] call RYD_HAS_ManualTarget;
							sleep 0.5;
							
							for "_i" from 1 to ((round(((_ammo/10) min 10)/_ihr)) max 1) do
								{
								_gunner fireAtTarget [_veh,_weap];
								sleep 0.1;
								if ((isNull RYD_HAS_Chopper) or {not (alive RYD_HAS_Chopper) or {(isNull (driver RYD_HAS_Chopper)) or {not (alive (driver RYD_HAS_Chopper))}}}) exitwith {_alive = false};
								if ((isNull _gunner) or {not (alive _gunner)}) exitWith {_alive = false};
								if (((RYD_HAS_wasHit) and {(({_x > 0.5} count ((getAllHitPointsDamage RYD_HAS_Chopper) select 2)) > 0)}) or {RYD_HAS_CallCancelled}) exitWith {_cancelled = true;};
								};
							}
						}
					};
					
				if (not (_alive) or {_cancelled}) exitWith {};
				} 
			foreach _weapons;
			
			if (not (_alive) or {_cancelled}) exitWith {true};
			_hasAmmo = ({not ((_x select 0) in RYD_HAS_noAmmoWeapons)} count _weapons) > 0;
				
			((time > _tme) or {not (_hasAmmo)})
			};		
		};
	
	_veh removeEventHandler ["Fired",_fEH];
	removeMissionEventHandler ["EachFrame",_id];
	};
	
RYD_HAS_TakeWeapons = 
	{
	private ["_modes","_mode","_isHoming","_isRocket","_mags","_mag","_ammo","_airLock","_irLock","_laserLock","_nvLock"];
	params ["_veh"];
	
	private _weaponsHoming = [];
	private _rockets = [];
	private _guns = [];
	
		{
		_modes = getarray (configfile >> "cfgweapons" >> _x >> "modes");
		if (count _modes > 0) then 
			{
			_mode = _modes select 0;
			if (_mode == "this") then {_mode = _x;};
			
			_isHoming = false;
			_airLock = 0;
			_isRocket = false;
			
			if (isArray (configfile >> "CfgWeapons" >> _x >> "magazines")) then
				{
				_mags = (getArray (configfile >> "CfgWeapons" >> _x >> "magazines"));
				if ((count _mags) > 0) then
					{
					_mag = _mags select 0;
					
					if (isText (configfile >> "CfgMagazines" >> _mag >> "ammo")) then
						{
						_ammo = getText (configfile >> "CfgMagazines" >> _mag >> "ammo");
						_irLock = configFile >> "CfgAmmo" >> _ammo >> "irLock";
						_laserLock = configFile >> "CfgAmmo" >> _ammo >> "laserLock";
						_nvLock = configFile >> "CfgAmmo" >> _ammo >> "nvLock";
						_airLock = getNumber (configFile >> "CfgAmmo" >> _ammo >> "airLock");
						_sim = configFile >> "CfgAmmo" >> _ammo >> "simulation";
						
						_isRocket = (isText _sim) and {((toLower (getText _sim)) in ["shotmissile","shotrocket"])};						
						_isHoming = (({(not (isNumber _x) or {((getNumber _x) < 1)})} count [_irLock,_laserLock,_nvLock]) < 3) and {(_airLock < 1)};
						};
					};
				};
			
			if (_isHoming) then
				{
				_weaponsHoming pushBack [_x,_mode];
				}
			else
				{
				if (_airLock < 2) then
					{
					if (_isRocket) then
						{
						_rockets pushBack [_x,_mode]
						}
					else
						{
						_guns pushBack [_x,_mode]
						};
					}
				}
			};
		} 
	foreach ((typeOf _veh) call bis_fnc_weaponsEntityType);
	
	[_weaponsHoming,_rockets,_guns]
	};
	
RYD_HAS_ActDamageSum = 
	{
	params ["_veh"];
	
	private _sum = 0;
	
		{
		_sum = _sum + _x;
		}
	foreach ((getAllHitPointsDamage RYD_HAS_Chopper) select 2);	
	
	_sum
	};
	
RYD_HAS_isGunship = 
	{
	private ["_mags","_mag","_ammoC","_sim"];
	params ["_heli"];
	
	private _weaponsAll = [_heli] call RYD_HAS_TakeWeapons;
	
	private _weapons = [];
	
		{
			{
			_weapons pushBack (_x select 0)
			}
		foreach _x
		}
	foreach _weaponsAll;
	
	_heli setVariable ["RYD_HAS_myWeapons",_weapons];
	private _isGunship = false;
	private _isAT = false;

		{
		if (isArray (configfile >> "CfgWeapons" >> (_x select 0) >> "magazines")) then
			{
			_mags = (getArray (configfile >> "CfgWeapons" >> (_x select 0) >> "magazines"));
			if ((count _mags) > 0) then
				{
				_mag = _mags select 0;
				
				if (isText (configfile >> "CfgMagazines" >> _mag >> "simulation")) then
					{
					_ammoC = getText (configfile >> "CfgMagazines" >> _mag >> "ammo");
					_sim = configFile >> "CfgAmmo" >> _ammoC >> "simulation";
					
					_isGunship = (isText _sim) and {((toLower (getText _sim)) in ["shotmissile","shotrocket"])};
					
					if ((_isGunship) and {not (_isAT)}) then
						{
						_ammo = getText (configfile >> "CfgMagazines" >> _mag >> "ammo");
						_airLock = getNumber (configFile >> "CfgAmmo" >> _ammo >> "airLock");
						_isAT = ((toLower (getText _sim)) in ["shotmissile"]) and {(_airLock < 1)};
						};
					};
				};
			};
			
		if (_isGunship) exitWith {};
		}
	foreach ((_weaponsAll select 0) + (_weaponsAll select 1));
	
	_heli setVariable ["RYD_HAS_isAT",_isAT];
	
	_isGunship
	};

RYD_HAS_CAS = 
	{
	params ["_heli","_tPos","_obs","_CASDst","_range","_onlyKnownTargets"];
	
	//if not ([_heli] call RYD_HAS_isGunship) exitWith {};
	
	//_obs groupchat "CAS assigned";
	
	[] spawn
		{
		sleep (2 + (random 2));
		if not ([] call RYD_HAS_ifChopperReady) exitWith {};
		_sentArr = RYD_HAS_sent_CoordsConfirmed_cas;
		_txt = selectRandom _sentArr;
		//(driver RYD_HAS_Chopper) customChat [RYD_HAS_PilotChannel,_txt];
		[(driver RYD_HAS_Chopper),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
		if (true) then//if (player in RYD_HAS_STT) then
			{
			//playSound "TacticalPing3";
			"TacticalPing3" remoteExec ["playSound",RYD_HAS_Caller];
			};
		};
	
	_tPos = +_tPos;

	private _i = "CASMark_" + (str _tPos);
	_i = createMarker [_i,_tPos];
	_i setMarkerColor "ColorBlue";
	_i setMarkerShape "ELLIPSE";
	_i setMarkerBrush "SolidBorder";
	_i setMarkerSize [_range,_range];
	
	private _alive = true;
	private _cancelled = false;
	RYD_HAS_wasHit = false;

	private _hG = group _heli;
	
	 while {(count (waypoints _hG)) > 0} do
		 {
		 deleteWaypoint ((waypoints _hG) select 0);
		 };	

	RYD_HAS_oldBeh = behaviour (leader _hG);
	RYD_HAS_oldCM = combatMode _hG;

	_hG setBehaviour "CARELESS";
	_hG setCombatMode "BLUE";

	RYD_HAS_done = false;
	private _sPos = getPosATL _heli;
	private _CASPos = _tPos getPos [((_CASDst min ((getObjectViewDistance select 0) - _range)) max (_CASDst * 0.6)),(_tPos getDir _sPos)];
	if ((_CASPos distance2D _sPos) < 120) then
		{
		_CASPos = _sPos getPos [120,(_sPos getDir _tPos)];
		};
	
	_wps = [_heli] call RYD_HAS_ExecuteRoute;	
	
	if ((count _wps) > 0) then
		{
		_sPos = waypointPosition (_wps select ((count _wps) - 1));
		_CASPos = _tPos getPos [((_CASDst min ((getObjectViewDistance select 0) - _range)) max (_CASDst * 0.6)),(_tPos getDir _sPos)];
		if ((_CASPos distance2D (getPosATL _heli)) < 120) then
			{
			_CASPos = (getPosATL _heli) getPos [120,((getPosATL _heli) getDir _tPos)];
			};
			
		_wps = [];
		};
	
	private _wp = _hG addWaypoint [_CASPos,0];	
	_wp setWaypointType "MOVE";
	_wp setWaypointStatements ["true", "RYD_HAS_done = true;"];
	
	_tPos = +_tPos;
	_CASDst2 = (_CASPos distance2D _tPos)/2;
	_CASDir = _CASPos getDir _tPos;
	_mPos = _CASPos getPos [_CASDst2,_CASDir];
	
	private _iB = "CASMarkH_" + (str _CASPos);
	_iB = createMarker [_iB,_CASPos];
	_iB setMarkerColor "ColorBlue";
	_iB setMarkerShape "ICON";
	_iB setMarkerSize [0.75,1.5];
	_iB setMarkerType "mil_triangle";
	_iB setMarkerDir _CASDir;
	_iB setMarkerText "HAS CAS: en route";

	private _lvl = 30;
	_heli flyInHeight _lvl;
	RYD_HAS_clickedPos2 = [];
	_cntPath = +RYD_HAS_MidWPs;

	waitUntil
		{
		sleep 0.1;
		if ((isNull _heli) or {not (alive _heli) or {(isNull (driver _heli)) or {not (alive (driver _heli))}}}) exitwith {_alive = false;true};
		if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};
		if (((RYD_HAS_wasHit) and {(({_x > 0.5} count ((getAllHitPointsDamage _heli) select 2)) > 0)}) or {RYD_HAS_CallCancelled}) exitWith {_cancelled = true;true};
		
		if ((count RYD_HAS_clickedPos2) > 1)  then
			{
			RYD_HAS_clickedPos2 = [];
			if not (_cntPath isEqualTo RYD_HAS_MidWPs) then
				{
				_cntPath = +RYD_HAS_MidWPs;
				_wps = [_heli,((waypoints _hG) select (((count (waypoints _hG)) - 1) max 0))] call RYD_HAS_ExecuteRoute;
				
				if not ((_tPos distance2D RYD_HAS_clickedPos) > (RYD_HAS_CAS_Range/2)) then
					{
					_sPos = getPosATL _heli;
					if ((count _wps) > 0) then
						{
						_sPos = waypointPosition (_wps select ((count _wps) - 1));
						_wps = [];
						};
						
					_CASPos = _tPos getPos [((_CASDst min ((getObjectViewDistance select 0) - _range)) max (_CASDst * 0.6)),(_tPos getDir _sPos)];
					
					if ((_CASPos distance2D (getPosATL _heli)) < 120) then
						{
						_CASPos = (getPosATL _heli) getPos [120,((getPosATL _heli) getDir _tPos)];
						};

					_CASDst2 = (_CASPos distance2D _tPos)/2;	
					_CASDir = _CASPos getDir _tPos;
					_mPos = _CASPos getPos [_CASDst2,_CASDir];
					
					_iB setMarkerPos _CASPos;
					_iB setMarkerDir _CASDir;
					
					((waypoints _hG) select (((count (waypoints _hG)) - 1)) max 0) setWaypointPosition [_CASPos, 0];
					}
				}
			};
					
		if ((_tPos distance2D RYD_HAS_clickedPos) > (RYD_HAS_CAS_Range/2)) then
			{
			_tPos = +RYD_HAS_clickedPos;
			_i setMarkerPos _tPos;
			
			_sPos = getPosATL _heli;
			if ((count _wps) > 0) then
				{
				_sPos = waypointPosition (_wps select ((count _wps) - 1));
				_wps = [];
				};
				
			_CASPos = _tPos getPos [((_CASDst min ((getObjectViewDistance select 0) - _range)) max (_CASDst * 0.6)),(_tPos getDir _sPos)];
			
			if ((_CASPos distance2D (getPosATL _heli)) < 120) then
				{
				_CASPos = (getPosATL _heli) getPos [120,((getPosATL _heli) getDir _tPos)];
				};	

			_CASDst2 = (_CASPos distance2D _tPos)/2;	
			_CASDir = _CASPos getDir _tPos;
			_mPos = _CASPos getPos [_CASDst2,_CASDir];
			
			_iB setMarkerPos _CASPos;
			_iB setMarkerDir _CASDir;
		
			((waypoints _hG) select (((count (waypoints _hG)) - 1)) max 0) setWaypointPosition [_CASPos, 0];
			
			[] spawn
				{
				sleep (2 + (random 2));
				if not ([] call RYD_HAS_ifChopperReady) exitWith {};
				_sentArr = RYD_HAS_sent_AltCoordsConfirmed_cas;
				_txt = selectRandom _sentArr;
				//(driver RYD_HAS_Chopper) customChat [RYD_HAS_PilotChannel,_txt];
				[(driver RYD_HAS_Chopper),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
				if (true) then//if (player in RYD_HAS_STT) then
					{
					//playSound "TacticalPing3";
					"TacticalPing3" remoteExec ["playSound",RYD_HAS_Caller];
					}
				}
			}
		else
			{
			if ((count _wps) > 0) then
				{
				_sPos = waypointPosition (_wps select ((count _wps) - 1));
				_CASPos = _tPos getPos [((_CASDst min ((getObjectViewDistance select 0) - _range)) max (_CASDst * 0.6)),(_tPos getDir _sPos)];
				if ((_CASPos distance2D _sPos) < 120) then
					{
					_CASPos = _sPos getPos [120,(_sPos getDir _tPos)];
					};
					
				((waypoints _hG) select (((count (waypoints _hG)) - 1)) max 0) setWaypointPosition [_CASPos,0];
				_wps = [];
				};
			};
			
		if not (RYD_HAS_CruisingSpeed < 10) then
			{
			[RYD_HAS_Chopper] call RYD_HAS_TurningSpeed
			};
				
		(RYD_HAS_Done)
		};
	
	RYD_HAS_CASPatternChoice = true;publicVariable "RYD_HAS_CASPatternChoice";
	[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myCASAction",-1])] remoteExec ["removeAction",RYD_HAS_Caller];
	[RYD_HAS_Caller,(RYD_HAS_Caller getVariable ["RYD_HAS_myCASActionB",-1])] remoteExec ["removeAction",RYD_HAS_Caller];
		
	[["RYD_HAS_HeliT", "onMapSingleClick"],BIS_fnc_removeStackedEventHandler] remoteExec ["call",RYD_HAS_Caller];	

		
	if (not (_alive) or {(_unable) or {_cancelled}}) exitWith {deleteMarker _i; deleteMarker _iB};
	
	_i setMarkerColor "ColorOrange";
	_iB setMarkerColor "ColorOrange";
	_iB setMarkerText "HAS CAS: position";
	
	_sentArr = RYD_HAS_sent_CASImminent_cas;
	_txt = selectRandom _sentArr;
	//(driver RYD_HAS_Chopper) customChat [RYD_HAS_PilotChannel,_txt];
	[(driver RYD_HAS_Chopper),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
	if (true) then//if (player in RYD_HAS_STT) then
		{
		//playSound "TacticalPing3";
		"TacticalPing3" remoteExec ["playSound",RYD_HAS_Caller];
		};
	//_obs groupchat "CAS imminent";
		
	if (RYD_HAS_CAS_isSAD) exitWith
		{
		RYD_HAS_myDamage = [_heli] call RYD_HAS_ActDamageSum;
		private _hEH = _heli addEventHandler ["Hit",{RYD_HAS_wasHit = (((([(_this select 0)] call RYD_HAS_ActDamageSum) - RYD_HAS_myDamage) > 0.2) or {(({_x == 1} count ((getAllHitPointsDamage (_this select 0)) select 2)) > 0) or {not (canMove (_this select 0))}})}];
		RYD_HAS_done = false;
		private _wp = _hG addWaypoint [_tPos,0];	
		_wp setWaypointType "SAD";
		_wp setWaypointCombatMode "RED";
		_wp setWaypointBehaviour "COMBAT";
		_wp setWaypointStatements ["true", "RYD_HAS_done = true;"];
		
		_heli flyInHeight 35;
		
		if not (_onlyKnownTargets) then
			{
				{
				if ((_x distance2D _tPos) < RYD_HAS_CAS_Range) then
					{
					_hG reveal [_x,4]
					}
				}
			foreach (allUnits + vehicles)
			};
		
		_i setMarkerColor "ColorRed";
		_iB setMarkerColor "ColorRed";
		_iB setMarkerText "HAS CAS: SAD pattern pending";
		
		waitUntil
			{
			sleep 0.1;
			if ((isNull _heli) or {not (alive _heli) or {(isNull (driver _heli)) or {not (alive (driver _heli))}}}) exitwith {_alive = false;true};
			if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};
			if (((RYD_HAS_wasHit) and {(({_x > 0.5} count ((getAllHitPointsDamage _heli) select 2)) > 0)}) or {RYD_HAS_CallCancelled}) exitWith {_cancelled = true;true};

			(RYD_HAS_done)
			};
			
		_heli removeEventHandler ["Hit",_hEH];			
			
		_hG setCombatMode "BLUE";
		_hG setBehaviour "CARELESS";
		
			{
			_hG forgetTarget _x
			}
		foreach (allUnits + vehicles);
					
		deleteMarker _i;
		deleteMarker _iB;
		
		if (not (_alive) or {(_unable) or {_cancelled}}) exitWith {};

		_sentArr = RYD_HAS_sent_CASEnd_cas;
		_txt = selectRandom _sentArr;
		//(driver RYD_HAS_Chopper) customChat [RYD_HAS_PilotChannel,_txt];
		[(driver RYD_HAS_Chopper),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
		if (true) then//if (player in RYD_HAS_STT) then
			{
			//playSound "TacticalPing3";
			"TacticalPing3" remoteExec ["playSound",RYD_HAS_Caller];
			};
			
		//_obs groupchat "CAS complete";
				
		_heli flyInHeight RYD_HAS_ChopperLvl;
		};

	private _cPos = getPosATL _heli;
	_cPos set [2,(((_cPos select 2) - 10) max 1)];
	_tPos1A = _tPos getPos [_range/2,0];
	_tPos1B = _tPos getPos [_range,0];
	_tPos2A = _tPos getPos [_range/2,90];
	_tPos2B = _tPos getPos [_range,90];
	_tPos3A = _tPos getPos [_range/2,180];
	_tPos3B = _tPos getPos [_range,180];
	_tPos4A = _tPos getPos [_range/2,270];
	_tPos4B = _tPos getPos [_range,270];
	_tPos set [2,1];
	
	_arr = 
		[
		_tPos,
		_tPos1A,
		_tPos1B,
		_tPos2A,
		_tPos2B,
		_tPos3A,
		_tPos3B,
		_tPos4A,
		_tPos4B
		];
		
	private _tB = false;
	
		{
		_x set [2,1];
		
		_tB = terrainIntersect [_cPos,_x];
		if (_tb) exitWith {};
		}
	foreach _arr;
	
	_heliDst = _heli distance2D _tPos;
	_tgtLvlASL = (ATLtoASL _tPos) select 2;

	while {_tB} do
		{
		_lvl = _lvl + 20;
		_heli flyInHeight _lvl;
		_cPos = getPosATL _heli;
		_cPos set [2,(_cPos select 2) - 10];
		_tB = false;
		
			{
			_x set [2,1];

			_tB = terrainIntersect [_cPos,_x];
			if (_tb) exitWith {};
			}
		foreach _arr;
		_cLvl = _cPos select 2;
		_tme = time;
		
		waitUntil
			{
			sleep 0.1;
			
			if ((isNull _heli) or {not (alive _heli) or {(isNull (driver _heli)) or {not (alive (driver _heli))}}}) exitwith {_alive = false;true};
			if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};
			if (((RYD_HAS_wasHit) and {(({_x > 0.5} count ((getAllHitPointsDamage _heli) select 2)) > 0)}) or {RYD_HAS_CallCancelled}) exitWith {_cancelled = true;true};
			
			(((((getPosATL _heli) select 2) - _cLvl) > 15) or {((time - _tme) > 5)})
			};
			
		if (not (_alive) or {(_unable) or {_cancelled}}) exitWith {};
		if (_heliDst < (((getPosASL _heli) select 2) - _tgtLvlASL)) exitWith {};
		};
			
	if not (_alive) exitWith {deleteMarker _i; deleteMarker _iB};
	
	private _homing = [];
	private _air = [];
	private _soft = [];
	private _arm = [];
	
	if not (not (_alive) or {(_unable) or {_cancelled}}) then
		{	
		_air = _tPos nearEntities [["Air"],_range];
		_soft = _tPos nearEntities [["Car"],_range];
		_arm = _tPos nearEntities [["Tank"],_range];
			
			{
			if (((((RYD_HAS_Caller knowsAbout _x) max (_obs knowsAbout _x)) < 0.01) and {(_onlyKnownTargets)}) or {not (((side RYD_HAS_Caller) getFriend (side _x)) < 0.6)}) then
				{
				_air set [_foreachIndex,objNull]
				}
			}
		foreach _air;
		_air = _air - [objNull];				
				
			{
			if (((((RYD_HAS_Caller knowsAbout _x) max (_obs knowsAbout _x)) < 0.01) and {(_onlyKnownTargets)}) or {not (((side RYD_HAS_Caller) getFriend (side _x)) < 0.6)}) then
				{
				_soft set [_foreachIndex,objNull]
				}
			}
		foreach _soft;
		_soft = _soft - [objNull];				
				
			{
			if (((((RYD_HAS_Caller knowsAbout _x) max (_obs knowsAbout _x)) < 0.01) and {(_onlyKnownTargets)}) or {not (((side RYD_HAS_Caller) getFriend (side _x)) < 0.6)}) then
				{
				_arm set [_foreachIndex,objNull]
				}
			}
		foreach _arm;
		_arm = _arm - [objNull];	

		_homing appEnd _arm;
		_homing appEnd _air;
		_homing appEnd _soft;		
		
		private _hPos = getPosATL _heli;
		//private _mPos = _hPos getPos [((_hPos distance2D _tPos)/2),_hPos getDir _tPos];
		//_mPos set [2,(((((ATLtoASL _hPos) select 2) + (getTerrainHeightASL _tPos))/2) + 5)];
		//private _mPosASL = ATLtoASL _mPos;
		_cPos = getPosASL _heli;
		_cPos set [2,(_cPos select 2) - 10];
		_hLvlASL = _cPos select 2;
		
		private _code = 
			{
			_tgtPos = getPosATL _x;
			_toDir = _hPos getDir _tgtPos;
			_diff = ((((ATLtoASL _tgtPos) select 2) max 0) - (((ATLtoASL _hPos) select 2) max 0)) max 0;
			_mPos = _hPos getPos [(((_hPos distance2D _tgtPos) - ((((getPosATL _heli) select 2) - (30 + _diff)) max 0)) max ((_hPos distance2D _tgtPos)/2)),_toDir];
			_mPos1 = _mPos getPos [3,_toDir + 90];
			_mPos2 = _mPos getPos [3,_toDir - 90];
			_mPosLvl = ((getTerrainHeightASL _tgtPos) + 0.5) * (_hPos distance2D _tgtPos)/(_hPos distance2D _mPos);
			_mPos set [2,_mPosLvl];
			_mPos1 set [2,_mPosLvl];
			_mPos2 set [2,_mPosLvl];
			
			((lineIntersects [_cPos, _mPos, _heli, _x]) and {(lineIntersects [_cPos, _mPos1, _heli, _x]) and {(lineIntersects [_cPos, _mPos2, _heli, _x])}})
			};
		
		private _oB = (_code count _homing) > 0;
		
		while {_oB} do
			{
			_lvl = _lvl + 20;
			_heli flyInHeight _lvl;
			_cPos = getPosASL _heli;
			_cPos set [2,(_cPos select 2) - 10];
			_hLvlASL = _cPos select 2;
			_oB = (_code count _homing) > 0;
			_cLvl = _hLvlASL;
			_tme = time;
			
			waitUntil
				{
				sleep 0.1;
				
				if ((isNull _heli) or {not (alive _heli) or {(isNull (driver _heli)) or {not (alive (driver _heli))}}}) exitwith {_alive = false;true};
				if not ([] call RYD_HAS_ifChopperReady) exitWith {_unable = true;true};
				if (((RYD_HAS_wasHit) and {(({_x > 0.5} count ((getAllHitPointsDamage _heli) select 2)) > 0)}) or {RYD_HAS_CallCancelled}) exitWith {_cancelled = true;true};
				
				(((((getPosASL _heli) select 2) - _cLvl) > 15) or {((time - _tme) > 5)})
				};
				
			if (not (_alive) or {(_unable) or {_cancelled}}) exitWith {};
			};
		};
			
	if not (_alive) exitWith {deleteMarker _i; deleteMarker _iB};

	if not ((_cancelled) or {(_unable)}) then
		{
		_i setMarkerColor "ColorRed";
		_iB setMarkerColor "ColorRed";
		_iB setMarkerText "HAS CAS: HOVER pattern pending";
		//_obs groupchat "CAS begins";
		_sentArr = RYD_HAS_sent_CASBegin_cas;
		_txt = selectRandom _sentArr;
		//(driver RYD_HAS_Chopper) customChat [RYD_HAS_PilotChannel,_txt];
		[(driver RYD_HAS_Chopper),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
		if (true) then//if (player in RYD_HAS_STT) then
			{
			//playSound "TacticalPing3";
			"TacticalPing3" remoteExec ["playSound",RYD_HAS_Caller];
			};
		
		_heli flyInHeight ((getPosATL _heli) select 2);

		private _inf = _tPos nearEntities [["CAManBase"],_range];
		
			{
			if (((((RYD_HAS_Caller knowsAbout _x) max (_obs knowsAbout _x)) < 0.01) and {(_onlyKnownTargets)}) or {not (((side RYD_HAS_Caller) getFriend (side _x)) < 0.6)}) then
				{
				_inf set [_foreachIndex,objNull]
				}
			}
		foreach _inf;
		_inf = _inf - [objNull];

		private _targets = [];
				
			{
			_inf appEnd (crew _x)
			}
		foreach _homing;

		_targets appEnd _inf;
		_targets appEnd _air;
		_targets appEnd _soft;
		
		RYD_HAS_myDamage = [_heli] call RYD_HAS_ActDamageSum;

		private _hEH = _heli addEventHandler ["Hit",{RYD_HAS_wasHit = (((([(_this select 0)] call RYD_HAS_ActDamageSum) - RYD_HAS_myDamage) > 0.2) or {(({_x == 1} count ((getAllHitPointsDamage (_this select 0)) select 2)) > 0) or {not (canMove (_this select 0))}})}];
		
		private _weaponsAll = [_heli] call RYD_HAS_TakeWeapons;
		[_heli,_tPos,_weaponsAll,10,_targets,_homing,false] call RYD_HAS_Fire;
				
		_heli removeEventHandler ["Hit",_hEH];
		if ((isNull _heli) or {not (alive _heli) or {(isNull (driver _heli)) or {not (alive (driver _heli)) or {not (canMove _heli)}}}}) exitWith {deleteMarker _i; deleteMarker _iB};

		_sentArr = RYD_HAS_sent_CASEnd_cas;
		_txt = selectRandom _sentArr;
		//(driver RYD_HAS_Chopper) customChat [RYD_HAS_PilotChannel,_txt];
		[(driver RYD_HAS_Chopper),[RYD_HAS_PilotChannel,_txt]] remoteExec ["customChat"];
		if (true) then//if (player in RYD_HAS_STT) then
			{
			//playSound "TacticalPing3";
			"TacticalPing3" remoteExec ["playSound",RYD_HAS_Caller];
			};
			
		//_obs groupchat "CAS complete";
		
		deleteMarker _i;
		deleteMarker _iB;
		
		_heli flyInHeight RYD_HAS_ChopperLvl;
		};
	};
	
RYD_HAS_AnglesMinDiff = 
	{	
	private _diff = (_this select 0) - (_this select 1);
	(sin _diff) atan2 (cos _diff)
	};
	
RYD_HAS_TurningSpeed = 
	{
	private ["_newSPD","_maxSpeed","_gp","_wps","_cnt","_cwpN","_cwp","_cwpPos","_dst","_nwp","_nwpPos","_spd","_dir1","_dir2","_diff","_dstF"];
	params ["_heli"];
	
	_newSPD = RYD_HAS_CruisingSpeed;
	if (_newSPD < 10) then
		{
		_maxSpeed = configFile >> "CfgVehicles" >> (typeOf _heli) >> "maxSpeed";
		_newSPD = if (isNumber _maxSpeed) then
			{
			(getNumber _maxSpeed)
			}
		else
			{
			1000
			}	
		};
		
	_gp = group _heli;
	
	_wps = waypoints _gp;
	_cnt = count _wps;
	if not (_cnt < 1) then
		{
		_cwpN = currentWaypoint _gp;
		_cwp = [_gp,_cwpN];
		_cwpPos = waypointPosition _cwp;
		_dst = _heli distance2D _cwpPos;
		_spd = speed _heli;
		_dir1 = _heli getDir _cwpPos;
		_nwp = [_gp,(_cwpN + 1)];
		_nwpPos = waypointPosition _nwp;
		_dstF = (_dst/500) min 1;
		
		_dir2 = if ((_dst < 500) and {(_cwpN < (_cnt - 1)) and {(_cwpPos distance2D _nwpPos) > 0}}) then	
			{
			(_cwpPos getDir _nwpPos);
			}
		else
			{
			_dstF = 0;
			(getDir _heli)
			};
			
		_diff = abs ([_dir1,_dir2] call RYD_HAS_AnglesMinDiff);
		_newSPD = ((_newSPD^(1/(1 + (_diff/180)))) max (100 max (_dst/2))) min _newSPD;
		_newSPD = (_newSPD * _dstF) + (_newSPD * (1 - _dstF) * (cos (_diff/2)));
		};
		
	_heli limitSpeed (_newSPD max 10);
	//hint format ["spd: %1\nexp: %2",speed _heli,_newSPD];
	
	_newSPD
	};
	
RYD_HAS_BIS_fnc_removeCommMenuItem = //corrected BIS function (was generating errors)
	{
	/*
		Author: Karel Moricky

		Description:
		Remove an item from the communication menu

		Parameter(s):
			0: OBJECT - object to which the item belongs to
			1: NUMBER - item ID returned by BIS_fnc_addCommMenuItem command

		Returns:
		BOOL - true when the item was removed
	*/
	private ["_unit","_itemID","_itemFound","_menu","_xID"];

	_unit = _this param [0,player,[objnull]];
	_itemID = _this param [1,-1,[0]];
	_itemFound = false;

	_menu = _unit getvariable ["BIS_fnc_addCommMenuItem_menu",[]];
	
		{
		_xID = _x select 0;
		if (_xID == _itemID) exitwith {_menu set [_foreachindex,-1]; _itemFound = true;};
		} 
	foreach _menu;
	_menu = _menu - [-1];

	if (_itemFound) then 
		{
		_unit setvariable ["BIS_fnc_addCommMenuItem_menu",_menu];
		[] call bis_fnc_refreshCommMenu;

		if (count _menu == 0) then 
			{
			terminate BIS_fnc_addCommMenuItem_loop;
			removemissioneventhandler ["loaded",BIS_fnc_addCommMenuItem_load];

			//BIS_fnc_addCommMenuItem_loop = nil;
			//BIS_fnc_addCommMenuItem_load = nil;
			};
		true
		} 
	else 
		{
		//["[x] Item %1 not found in the comm menu.",_itemID] call bis_fnc_error;
		false
		};
	};
	
publicVariable "RYD_HAS_BIS_fnc_removeCommMenuItem";