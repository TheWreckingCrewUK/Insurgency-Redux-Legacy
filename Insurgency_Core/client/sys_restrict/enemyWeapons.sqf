player addEventHandler ["InventoryOpened", {
	if((getPos player) distance2D (getMarkerPos "base") < 200) then{
		if(primaryWeapon player in twc_restrictedPrimaryWeapons)then{
			player removeWeapon (primaryWeapon player);
		};
		if(secondaryWeapon player in twc_restrictedSecondaryWeapons)then{
			player removeWeapon (secondaryWeapon player);
		};
		if(handgunWeapon player in twc_restrictedHangunWeapons)then{
			player removeWeapon (handgunWeapon player);
		};
	};
}];
twc_restrictedPrimaryWeapons = ["CUP_arifle_AK74"];

player addEventHandler ["Take", {
	params["_unit","_container","_item"];

		if(_item in twc_restrictedPrimaryWeapons)then{
		_unit allowsprint false;
		
		player addEventHandler ["Fired", {

		execvm "Insurgency_Core\client\sys_restrict\restrictedprimary.sqf";
	};];

	
}];