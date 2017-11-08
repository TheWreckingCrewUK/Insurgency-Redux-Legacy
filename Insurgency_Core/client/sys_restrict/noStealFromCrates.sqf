player addEventHandler ["Take", {
	params["_unit","_container","_item"];
	if(typeOf _container in twc_restrictedCrates)then{
		closeDialog 602;
		
		_cfgType = "unknown";
		switch true do
		{
			case(isClass(configFile >> "CfgMagazines" >> _item)): {_cfgType = "CfgMagazines"};
			case(isClass(configFile >> "CfgWeapons" >> _item)): {_cfgType = "CfgWeapons"};
		};
		if(_cfgType == "CfgWeapons")then{
			_unit removeWeapon _item;
			_container addWeaponCargoGlobal [_item,1];
		}else{
			_unit removeItem _item;
			_container addItemCargoGlobal [_item,1];
		};
		_title = "<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'>RESTRICTED</t><br />";
		_text = format["The %1 has been put back in the %2",([_item] call twc_fnc_getDisplayName),getText (configFile >> "cfgVehicles" >> (typeOf _container) >> "displayName")];
		hint parseText (_title + _text);
	};
}];

player addEventHandler ["Put", {
	params["_unit","_container","_item"];
	if(typeOf _container in twc_restrictedCrates)then{
		closeDialog 602;

		_title = "<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'>RESTRICTED</t><br />";
		_text = "This is a restricted crate. Anything you place in it you won't be able to get back!";
		hint parseText (_title + _text);
	};
}];