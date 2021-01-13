
player addeventhandler ["getoutman", { 
	params ["_unit", "_role", "_vehicle", "_turret"];
	_var = player getvariable ["twc_staticlineready", false];
	if (_var) then {
		[] spawn twc_fnc_heliparadrop;
	} else {
		player setvariable ["twc_staticlineready", false];
	};
}];

twc_staticlinevehs = [
"CUP_B_C130J_GB",
"RHS_Mi8AMT_vdv",
"CUP_O_Mi8_CHDKZ",
"CUP_B_UH60M_FFV_US",
"CUP_B_SA330_Puma_HC2_BAF",
"CUP_B_CH47F_GB",
"CUP_O_UH1H_TKA",
"UK3CB_BAF_Merlin_HC3_18_GPMG",
"RHS_UH1Y_d",
"RHS_UH60M",
"CUP_B_MH47E_GB",
"CUP_B_MH47E_USA",
"RHS_CH_47F",
"RHS_UH60M_d",
"CUP_B_MV22_USMC_RAMPGUN"
];
	

_prepline = ["preline","Prepare Static Line","",{player setvariable ["twc_staticlineready", true];hint "Static Line Connected. Eject above 200m to deploy parachute";},{((vehicle player) != player) && ((typeof (vehicle player)) in twc_staticlinevehs) && (!(player getvariable ["twc_staticlineready", false]))}] call ace_interact_menu_fnc_createAction;
["Air", 1, ["ACE_SelfActions"], _prepline, true] call ace_interact_menu_fnc_addActionToClass;

_prepline = ["preline","Disconnect Static Line","",{player setvariable ["twc_staticlineready", false];hint "Static Line Disconnected.";},{((vehicle player) != player) && ((typeof (vehicle player)) in twc_staticlinevehs) && ((player getvariable ["twc_staticlineready", false]))}] call ace_interact_menu_fnc_createAction;
["Air", 1, ["ACE_SelfActions"], _prepline, true] call ace_interact_menu_fnc_addActionToClass;

_prepline = ["preline","Cut Away","",{moveout player},{((typeof (vehicle player)) == "rhs_d6_Parachute")}] call ace_interact_menu_fnc_createAction;
["Air", 1, ["ACE_SelfActions"], _prepline, true] call ace_interact_menu_fnc_addActionToClass;

