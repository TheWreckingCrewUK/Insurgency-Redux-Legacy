//Hermes Airlift Services by Rydygier

//RYD_HAS_Chopper - fixed name for an helicopter vehicle to be used. 
//RYD_HAS_Base - fixed name of HQ Game Logic object
//to add new helicopter run this code when no airlift is pending, after assigning the crew for new helicopter: myNewHeliWithCrewName call RYD_HAS_NewChopper;
//to add new units to the RYD_HAS_STT pool run this code when no airlift is pending: [newUnit1,newUnit2,newUnit3] call RYD_HAS_NewUnits;

//User Config///////////////////////////////////////////////////////////////
RYD_HAS_STT = //names of the units to be transported
	[
	leader1
	];
	
RYD_HAS_Limit = -1;//uses limit of airlift support. Set negative value for unlimited uses
RYD_HAS_RadioReq = "";//calls available, if any assigned unit's item (including weapons in use and backpack) classname contains this string. Leave empty for no item restriction.
RYD_HAS_VoiceChat = false;//if there should be played kbTell sentences (if available). If false - sidechat text sentences will be used instead (no voice, but better coverage). Ignored for supply drop - text chat only
RYD_HAS_whenInside = true;//if new airlift task should begin also when there is no airlift pending and at least one RYD_HAS_STT unit get in RYD_HAS_Chopper
RYD_HAS_CallerName = "";//name of the unit calling for airlift. Leave empty string for default: actual unit's name
RYD_HAS_AddHints = false;//if additional hint messsages should be displayed
RYD_HAS_SignalSearchRadius = 150;//how far around call position heli should search for proper signal to land. Avoid too big values (CPU heavy)
RYD_HAS_signalTimeLimit = 600;//how long (seconds) helicopter should loiter waiting for the signal before task fail/RTB (set 0 for unlimited)
RYD_HAS_AutoInOut = true;//if all RYD_HAS_STT units should be sent to embark/disembark RYD_HAS_Chopper automatically. Doesn't affect fast roping, which is always automatic
RYD_HAS_RemoveAtLimit = true;//if ability to call airlift should be permanently removed from RYD_HAS_STT units after limit of call is reached. If false - this action will be only hidden and will show up, if calls limit raised
RYD_HAS_ForceDescent = false;//should additional code enforce heli descent at last landing stage at destination until all disembark. May be useful, if heli's AI tend to go up too early. Use only, if necessary.
RYD_HAS_AlternativeLanding = true;//experimental, scripted solution instead of vanilla getin/getout landings at pickup and disembark spots
RYD_HAS_UseSupportsMenu = false;//if false = mouse actions will be used to call transport, supply, to cancel request or to change flight ceiling. When true - these actions will be available via supports menu (0-8). Destination choice actions will be always under mouse action menu. 
RYD_HAS_IgnoreAbilityCheck = false;//if true, in mouse actions variant there will be no check, if heli is able to lift given container before accepting the task. 
RYD_HAS_CruisingSpeed = 400;//maximal expected cruising speed for helicopters. Set below 10 for unlimited cruising speed and disabling slowing down at turning.
RYD_HAS_ContourFlightMode = false;//if enabled, new, lowest flight ceiling is added: "contour flight", where heli will try to fly as low, as possible.
RYD_HAS_RespawnHelis = -1;//if positive, destroyed/immobilized HAS helicopter will be after 60 seconds replaced by new one, placed, where destroyed was placed when was added to HAS. Old one will be deleted along with the crew. Value represents number of respawns. 0 - disabled, -1 - unlimited

RYD_HAS_FastReady = false;//if true, helicopter will be ready for another task at begining of RTB, not at the end of it. 

RYD_HAS_Switch_Taxi = true;//global switch for troops transportation support availability
RYD_HAS_Switch_Supply = false;//global switch for supply drops support availability
RYD_HAS_Switch_CAS = false;//global switch for close air support availability

RYD_HAS_addJIPs = true;//if true, JIP-ing players will automatically get access to HAS calls

RYD_HAS_allChoppers = //contains heli vehicle names. Helis put there will be used to perform airlift (always the closest able). If left empty, used will be heli present on the map named RYD_HAS_Chopper
	[
	heli1
	//heli2
	];

RYD_HAS_SignalClassesDay = //parent classes of ammo shot, that will be considered as proper position marker for pick up spot. Leave empty if no signal should be required - day
	[
	"SmokeShellBlue",
	"SmokeShellGreen",
	"SmokeShellRed",
	"SmokeShellOrange",
	"SmokeShellPurple",
	"SmokeShellYellow",
	"F_Signal_Green",
	"F_Signal_Red",
	"1Rnd_SmokeGreen_Grenade_shell",
	"1Rnd_SmokeBlue_Grenade_shell",
	"1Rnd_SmokeRed_Grenade_shell",
	"1Rnd_SmokePurple_Grenade_shell",
	"1Rnd_SmokeYellow_Grenade_shell",
	"FlareBase"
	];
	
RYD_HAS_SignalClassesNight = //parent classes of ammo shot, that will be considered as proper position marker for pick up spot. Leave empty if no signal should be required - night
	[
	"B_IR_Grenade",
	"FlareBase"
	];
	
RYD_HAS_SignReqDst = 1000;//2D distance in meters from the position of the calling unit, at which inbound helicopter will ask for LZ mark signal 

RYD_HAS_ChopperLvl = 30;//optimal chopper's flight ceiling

RYD_HAS_SafetyMargin = 10;//part of the radius for flat and empty area search for safe landing. Biiger - safer. Lower - closer to the chosen position. 10 - reasonable minimum (default). 8 - slightly risky. Big, negative number (like -100) - maximal accuracy and collision risk. 	
//RYD_HAS_FastRoping = true;//if fast rope should be used for disembarking instead of landing at destination. Does not apply to the disembarking at base (RTB option)
RYD_HAS_FastRopingLvl = 15;//optimal height for fast roping. Final level may be higher, if too tall obstacles present at destination
RYD_HAS_FastRopingOSrad = 0;//"obstacles search radius". How wide area at final fast roping spot has to be free from building class obstacles to be accepted. For rooftop fast roping etc. set to 0 for most precise on-click delivery, but use with caution, on the own risk. Note - the search counts distance from the center of the building, not from it's edges!
	
RYD_HAS_DoorsToOpen = //optional setting of animation sources, that should be animated before deploying fast ropes - intended for doors. Leave empty for no animations
	[
	//[heli1,["Door_Back_R","Door_Back_L"]]//Mohawk
	//[heli1,["door_l","door_r"]],//Ghosthawk
	//[heli2,["door_l","door_r"]]//Ghosthawk
	//[heli1,["Door_rear_source"]]//Huron
	];

RYD_HAS_RopeAttachPoints = ////optional setting of rope attachement points in model space coordinates ([x,y,z], [0,0,0] means the center of the vehicle, values in meters). Leave empty for automatic choice (how reasonable results will be - depends on the heli class). 
	[
	//[heli1,[[-1,0,0],[1,0,0]]],
	//[heli2,[[-5,0,0],[5,0,0]]]
	];
	
RYD_HAS_SupplyDrop_SlingLoad = false;//should the supply call be performed using slingload. If not - parachute drop will be used instead.
RYD_HAS_SupplyDrop_onMapClick = true;//set to true to mark drop position with map click. If false - by default usual smoke/flare etc. signal required by the pilot, unless no signal is defined - in that case supply will be dropped at caller's initial position
RYD_HAS_SupplyDrop_attachFlareAndSmoke = true;//if landed supply container should be marked with light and smoke
RYD_HAS_SupplyDrop_Arsenal = false;//if true, Virtual Arsenal access will be added to the supply box

//RYD_HAS_SupplyDrop_Prepared = [];//holds optional prepared boxes as supply to be dropped, that will be used before default, spawned boxes
RYD_HAS_SupplyCall_ContainerClass = "B_supplyCrate_F";//in fact, can be also any vehicle, but heli must be able to lift its weight. 
RYD_HAS_SupplyCall_ContainerPositions = //where, in relation to appointed heli ([x-axis (meters),y-axis (metes),z-axis (will be reduced to ground level)]), supply box should be spawned (area should be optimally free of obstacles and, for slingload mode: ahead of the heli, not closer, than 50 meters from it, reasonably flat and accessible from above). Leave empty for default - somewhere safe ahead of each of appointed helis. 
	[
	//[heli1,[0,80,0]],
	//[heli2,[0,80,0]]
	];

RYD_HAS_SupplyCall_MagCount = -12;//amount of each compatible magazine per each piece of weaponry used by chosen units. Use negative number to randomize amount of each from 0 to positive opposition of this number. 

RYD_HAS_SupplyCall_AddBackPack = 
	[
	//[class,amount,randomize from 0 to amount]
	];

RYD_HAS_SupplyCall_AddWeapon = 
	[
	//[class,amount,randomize from 0 to amount]
	];
	
RYD_HAS_SupplyCall_AddItem = 
	[
	//[class,amount,randomize from 0 to amount]
	];
	
RYD_HAS_SupplyCall_AddMagazine = 
	[
	//[class,amount,randomize from 0 to amount]
	];
	
RYD_HAS_SupplyCall_MagBlacklist = //magazine class names, that should be not added, all lower-case! Doesn't affect the content of RYD_HAS_SupplyCall_AddMagazine
	[
	"handgrenade_stone"
	//"i_ir_grenade",
	//"o_ir_grenade"
	];
	
	
RYD_HAS_CAS_Distance = 600;//how far from target area CAS helicopter should take firing position (can belower, if object draw distance is lower, but never below 60% of set value)
RYD_HAS_CAS_Range = 150;//how wide around target position CAS helicopter should look for hostile targets
RYD_HAS_CAS_OnlyKnownTargets = false;//if true, CAS helicopter will shoot only at hostile targets actually known to its crew or the caller unit
RYD_HAS_CAS_reammo = true;//if true, designated CAS helicopter will have ammunition restored at CAS task start

//sentences for "no voice chat" option (will be chosen random line from each array):
RYD_HAS_sent_Request = //at airlift request, by the caller, %1 refers to caller's name (RYD_HAS_CallerName)
	[
	"HQ, this is %1. We need heli transport, how copy?",
	"HQ, this is %1. Airlift requested, over."
	];
	
RYD_HAS_sent_Request_sc = //at supply drop request, by the caller, %1 refers to caller's name (RYD_HAS_CallerName)
	[
	"HQ, this is %1. We need the supplies, how copy?",
	"HQ, this is %1. Supplies airlift requested, over."
	];
	
RYD_HAS_sent_Request_cas = //at CAS request, by the caller, %1 refers to caller's name (RYD_HAS_CallerName)
	[
	"HQ, this is %1. We need CAS, how copy?",
	"HQ, this is %1. Immediate CAS requested, over."
	];
	
RYD_HAS_sent_Confirmation = //transport assignment confirmation, by HQ
	[
	"This is HQ, heli en route, over.",
	"This is HQ, airlift inbound, sit tight, over."
	];
	
RYD_HAS_sent_Confirmation_sc = //supply drop assignment confirmation, by HQ
	[
	"This is HQ, heli en route, over.",
	"This is HQ, airlift inbound, sit tight, over."
	];
	
RYD_HAS_sent_Confirmation_cas = //CAS assignment confirmation, CAS coords request by HQ
	[
	"This is HQ, gunship ready, provide CAS coordinates, over.",
	"This is HQ, CAS heli awaits, transmit target position, over."
	];
	
RYD_HAS_sent_SignalReq = //when heli is close enough to request a signal, by pilot
	[
	"We're closing. Mark your position!",
	"We're inbound. Signal your position!"
	];
	
RYD_HAS_sent_SignalReq_sc = //when heli is close enough to request a signal, by pilot (supply drop)
	[
	"We're closing. Mark your position!",
	"We're inbound. Signal your position!"
	];
	
RYD_HAS_sent_noLZ = //when heli fail to find suitable LZ at pick up position
	[
	"We don't see suitable LZ here. Transmit alternative map coords.",
	"There's nowhere to land. Requesting new LZ map coords."
	];
		
RYD_HAS_sent_SignalSpot = //when heli spotted the signal, by pilot
	[
	"We see you, we're landing.",
	"I see your signal. We're approaching."
	];
	
RYD_HAS_sent_SignalSpot_sc = //when heli spotted the signal, by pilot (supply drop)
	[
	"We see you, wait for delivery.",
	"I see your signal. We're approaching."
	];
	
RYD_HAS_sent_CoordsConfirmed_cas = //heli pilot confirms corrected CAS coordinates
	[
	"Copy that, heading towards CAS coords.",
	"Received CAS coords, we're enroute."
	];
	
RYD_HAS_sent_AltCoordsConfirmed = //when heli pilot accepts pointed alternate LZ coords
	[
	"The coords looks good, we're landing.",
	"I see your coords. We're heading there."
	];
	
RYD_HAS_sent_AltCoordsConfirmed_cas = //heli pilot confirms corrected CAS coordinates
	[
	"Copy that, heading towards new coords.",
	"Received new coords, rerouting now."
	];
	
RYD_HAS_sent_CASImminent_cas = //when CAS heli reaches attack position
	[
	"We're on place, CAS imminent.",
	"We're on place. Assuming attack position."
	];
	
RYD_HAS_sent_CASBegin_cas = //when CAS heli is ready to shoot
	[
	"Commencing CAS, heads down.",
	"Attack position assumed. Opening fire."
	];
	
RYD_HAS_sent_CASEnd_cas = //when CAS heli is completed
	[
	"Rounds complete.",
	"CAS concluded."
	];
		
RYD_HAS_sent_AirliftCancelled = //by caller to pilot, at airlift cancelling
	[
	"This is %1. Abort the airlift."
	];
	
RYD_HAS_sent_AirliftCancelled_sc = //by caller to pilot, at supply drop cancelling
	[
	"This is %1. Abort the supply drop."
	];
	
RYD_HAS_sent_CASCancelled_cas = //by caller to pilot, at CAS cancelling
	[
	"This is %1. Abort CAS."
	];
		
RYD_HAS_sent_AirliftCancelledConf = //by pilot to caller, after airlift cancelling
	[
	"Roger that. Airlift cancelled. We are RTB."
	];
	
RYD_HAS_sent_AirliftCancelledConf_sc = //by pilot to caller, after supply drop cancelling
	[
	"Roger that. Supply drop cancelled. We are RTB."
	];
	
RYD_HAS_sent_CASCancelledConf_cas = //by pilot to caller, after supply drop cancelling
	[
	"Roger that. CAS cancelled. We are RTB."
	];
		
RYD_HAS_sent_Welcome = //when all units in the heli, question about destination, by pilot
	[
	"All on board? Where to drop?",
	"All boarded? What's the destination?"
	];
	
RYD_HAS_sent_LZSelected = //at destination chosen, by pilot
	[
	"All right, let's get out of here.",
	"Hang on, we're flying."
	];
	
RYD_HAS_sent_Accomplished = //at destination/disembark, by pilot
	[
	"Good luck out there!",
	"All out? OK."
	];
	
RYD_HAS_sent_Accomplished_sc = //after supply drop, by pilot
	[
	"Supplies delivered, enjoy!",
	"Supplies dropped, you're welcome."
	];
	
RYD_HAS_sent_Destroyed = //at heli destroyed or unable to fly due to damage
	[
	"This is HQ, heli is gone, I repeat, heli is gone.",
	"This is HQ, we lost helicopter."
	];
	
RYD_HAS_sent_Destroyed_sc = //at heli destroyed or unable to fly due to damage (supply drop)
	[
	"This is HQ, heli is gone, I repeat, heli is gone.",
	"This is HQ, we lost helicopter."
	];