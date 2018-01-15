player addEventHandler ["Fired", { 
		if (primaryWeapon player in twc_restrictedPrimaryWeapons) then {
			if (random 1>0.97) then {
			player removePrimaryWeaponItem (currentMagazine player);
			hint "Magazine Broken";			
		[player,random 0.5,["stab"], ["hand_l", "hand_r"]] call twc_fnc_aiWounds;
		};	};
}];
