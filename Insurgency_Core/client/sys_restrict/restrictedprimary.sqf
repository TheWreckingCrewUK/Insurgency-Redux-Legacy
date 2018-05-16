player addEventHandler ["Fired", { 
		if (currentWeapon player in twc_restrictedPrimaryWeapons) then {
			if (random 1>0.97) then {
			[player, currentWeapon player] call ace_overheating_fnc_jamWeapon;	
			[player,random 0.5,["stab"], ["hand_l", "hand_r"]] call twc_fnc_aiWounds;
			};	
		};
}];
