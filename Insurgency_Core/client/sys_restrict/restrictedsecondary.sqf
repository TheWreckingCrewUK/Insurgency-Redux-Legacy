
player addEventHandler ["Fired", { 
		if (secondaryWeapon player in twc_restrictedSecondaryWeapons) then {
			if (random 1>0.98) then {
		deleteVehicle (_this select 6);
			"R_60mm_HE" createVehicle (getPos player);
			hint "WEAPON FAILURE";	
			sleep 0.5;
			player removeweapon secondaryWeapon player;		
		};	};
}];
		while {secondaryWeapon player in twc_restrictedSecondaryWeapons} do {
		if (random 1>0.99) then {
			"R_60mm_HE" createVehicle (getPos player);
			hint "LAUNCHER SELF DETONATION";	
			sleep 0.5;
			player removeweapon secondaryWeapon player;
		};
			sleep 15;
		};