if (typeof _veh == "rhsgref_cdf_b_Mi24D_Early") then {
	private _pylons = ["rhs_mag_fab500_m54","rhs_mag_fab500_m54","rhs_mag_upk23_mixed","rhs_mag_upk23_mixed","",""];
	private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};

	{ _veh removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon"); } forEach (getPylonMagazines _veh);
	{ _veh setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex]; } forEach _pylons;
};

if (typeof _veh == "RHS_AH1Z") then {
	private _pylons = ["","PylonRack_4Rnd_ACE_Hellfire_AGM114K","rhs_mag_M229_19_green","rhs_mag_M229_19_green","PylonRack_4Rnd_ACE_Hellfire_AGM114K",""];
	private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
	{ _veh removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon"); } forEach (getPylonMagazines _veh);
	{ _veh setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex]; } forEach _pylons;
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
};

if (typeof _veh == "RHS_AH64D") then {
	private _pylons = ["","rhs_mag_M151_19","PylonRack_4Rnd_ACE_Hellfire_AGM114K","PylonRack_4Rnd_ACE_Hellfire_AGM114K","rhs_mag_M151_19",""];
	private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
	{ _veh removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon"); } forEach (getPylonMagazines _veh);
	{ _veh setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex]; } forEach _pylons;
};

if (typeof _veh == "ukcw_Gazelle") then {
	[_veh, 3] call ace_cargo_fnc_setSpace;
};

if (typeof _veh == "twc_mert_ch47") then {
_veh addItemCargoGlobal ["ACE_fieldDressing",40];
_veh addItemCargoGlobal ["ACE_elasticBandage",40];
_veh addItemCargoGlobal ["ACE_quikclot",40];
_veh addItemCargoGlobal ["ACE_packingBandage",40];
_veh addItemCargoGlobal ["ACE_personalAidKit",1];
_veh addItemCargoGlobal ["ACE_salineIV_500",50];
_veh addItemCargoGlobal ["ACE_salineIV_250",50];
_veh addItemCargoGlobal ["ACE_salineIV",30];
_veh addItemCargoGlobal ["ACE_bodybag",30];
_veh addItemCargoGlobal ["ACE_tourniquet",15];
_veh addItemCargoGlobal ["ACE_atropine",15];
_veh addItemCargoGlobal ["ACE_epinephrine",25];
_veh addItemCargoGlobal ["ACE_morphine",25];
};

