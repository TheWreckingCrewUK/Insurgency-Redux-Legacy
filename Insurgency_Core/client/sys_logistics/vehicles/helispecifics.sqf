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

if (typeof _veh == "B_Heli_Transport_01_F") then {

	clearWeaponCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearitemCargoGlobal _veh;
	[_veh] call ace_fastroping_fnc_equipFRIES;
	hint "This is an SF helicopter. Only SF and sniper teams are able to ride in it";
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

if (typeof _veh in ["UK3CB_BAF_Wildcat_AH1_HEL_6A", "CUP_B_UH1Y_UNA_USMC", "ukcw_lynx_2gpmg", "CUP_O_Mi8_CHDKZ"]) then {
	[_veh] call ace_fastroping_fnc_equipFRIES;
};

if (typeof _veh == "ukcw_Gazelle") then {
	[_veh, 3] call ace_cargo_fnc_setSpace;
};


