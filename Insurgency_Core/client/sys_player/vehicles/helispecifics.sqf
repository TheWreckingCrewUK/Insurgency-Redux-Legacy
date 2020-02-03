if (typeof _veh == "rhsgref_cdf_b_Mi24D_Early") then {
	private _pylons = ["rhs_mag_fab500_m54","rhs_mag_fab500_m54","rhs_mag_upk23_mixed","rhs_mag_upk23_mixed","",""];
	private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};

	{ _veh removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon"); } forEach (getPylonMagazines _veh);
	{ _veh setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex]; } forEach _pylons;
	
	_veh setVariable ["ace_pylons_magazineWhitelist", ["rhs_mag_fab500_m54","rhs_mag_upk23_mixed"], true];
};

if (typeof _veh == "RHS_AH1Z") then {
	private _pylons = ["","PylonRack_4Rnd_ACE_Hellfire_AGM114K","rhs_mag_M229_19_green","rhs_mag_M229_19_green","PylonRack_4Rnd_ACE_Hellfire_AGM114K",""];
	private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
	{ _veh removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon"); } forEach (getPylonMagazines _veh);
	{ _veh setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex]; } forEach _pylons;
	_veh setVariable ["ace_pylons_magazineWhitelist", ["PylonRack_4Rnd_ACE_Hellfire_AGM114K","rhs_mag_M229_19_green"], true];
};

					

if (typeof _veh == "ukcw_Gazelle_dyn") then {
	private _pylons = ["ukcw_PylonPod_1200Rnd_L20A1","ukcw_PylonPod_1200Rnd_L20A1"];
	private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
	{ _veh removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon"); } forEach (getPylonMagazines _veh);
	{ _veh setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex]; } forEach _pylons;
	[
						_veh,
						["Woodland",1], 
						["HideWeapons",1]
						] call BIS_fnc_initVehicle;
};				

if (typeof _veh == "RHS_UH60M_ESSS") then {
	private _pylons = ["rhs_mag_M151_19","rhs_mag_M151_19","rhs_mag_M151_19","rhs_mag_M151_19"];
	private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
	{ _veh removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon"); } forEach (getPylonMagazines _veh);
	{ _veh setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex]; } forEach _pylons;
	_veh setVariable ["ace_pylons_magazineWhitelist", ["rhs_mag_M151_19"], true];
};

if (typeof _veh == "RHS_AH64D") then {
	private _pylons = ["","rhs_mag_M151_19","PylonRack_4Rnd_ACE_Hellfire_AGM114K","PylonRack_4Rnd_ACE_Hellfire_AGM114K","rhs_mag_M151_19",""];
	private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
	{ _veh removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon"); } forEach (getPylonMagazines _veh);
	{ _veh setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex]; } forEach _pylons;
	_veh addItemCargoGlobal ["rhsusf_ihadss",2];
	_veh setVariable ["ace_pylons_magazineWhitelist", ["rhs_mag_M151_19", "PylonRack_4Rnd_ACE_Hellfire_AGM114K", "PylonRack_4Rnd_ACE_Hellfire_AGM114L"], true];
	if (["90", twc_missionname] call BIS_fnc_inString) then {
		[
			_veh,
			["standard",1], 
			["radar_hide",1]
		] call BIS_fnc_initVehicle;
	};
};

if (typeof _veh == "B_Heli_Transport_01_F") then {

	clearWeaponCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearitemCargoGlobal _veh;
	[_veh] call ace_fastroping_fnc_equipFRIES;
	hint "This is an SF helicopter. Only SF and sniper teams are able to ride in it";
};

if (typeof _veh == "RHS_MELB_MH6M") then {

	clearWeaponCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearitemCargoGlobal _veh;
	[_veh] call ace_fastroping_fnc_equipFRIES;
	hint "This is an SF helicopter. Only SF and sniper teams are able to ride in it";
};

if ((typeof _veh == "RHS_Mi8T_vvsc") || (typeof _veh == "RHS_Mi24P_vvsc")) then {

_box= _veh;
_box additemcargoglobal ["ACE_fieldDressing",20];
_box additemcargoglobal ["ACE_packingBandage",15];
_box additemcargoglobal ["ACE_quikclot",15];
_box additemcargoglobal ["ACE_morphine",5];
_box additemcargoglobal ["ACE_epinephrine",3];
_box additemcargoglobal ["ACE_personalAidKit",1];

_box addmagazinecargoglobal ["rhs_30Rnd_545x39_7N6M_AK",25]; 
_box addmagazinecargoglobal ["rhs_mag_9x18_8_57N181S",5]; 
_box addmagazinecargoglobal ["rhs_GRD40_White",5]; 
_box addmagazinecargoglobal ["rhs_GRD40_White",8]; 
_box addmagazinecargoglobal ["rhs_rpg7_PG7V_mag",3]; 
_box addmagazinecargoglobal ["rhs_rpg7_PG7V_mag",5]; 
};

if (typeof _veh == "CUP_B_UH60M_FFV_US") then {

	clearWeaponCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearitemCargoGlobal _veh;
	[_veh] call ace_fastroping_fnc_equipFRIES;
	[
		_veh,
		["Black",1], 
		["Hide_ESSS2x",1,"Hide_ESSS4x",1,"Hide_Nose",0,"Navyclan_hide",1,"Navyclan2_hide",1,"Blackhawk_Hide",0,"Hide_FlirTurret",0,"Hide_Probe",0,"Doorcock_Hide",1,"Filters_Hide",0]
	] call BIS_fnc_initVehicle;
};

if (typeof _veh in ["RHS_UH60M", "UK3CB_BAF_Wildcat_AH1_HEL_6A", "RHS_UH1Y_d", "ukcw_lynx_2gpmg", "CUP_O_Mi8_CHDKZ"]) then {
	[_veh] call ace_fastroping_fnc_equipFRIES;
};

if (typeof _veh == "ukcw_Gazelle") then {
	[_veh, 3] call ace_cargo_fnc_setSpace;
};


