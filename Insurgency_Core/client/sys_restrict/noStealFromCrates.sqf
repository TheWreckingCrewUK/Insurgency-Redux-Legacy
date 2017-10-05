player addEventHandler ["Take", {
	params["_unit","_container","_item"];
	if(typeOf _container in twc_restrictedCrates)then{
		closeDialog 602;
		hint format["You are to retrive the supplies. Not Steal them. Don't take the %1",[_item] call twc_fnc_getDsiplayName];
		
		_cfgType = "unknown";
		switch true do
		{
			case(isClass(configFile >> "CfgMagazines" >> _item)): {_cfgType = "CfgMagazines"};
			case(isClass(configFile >> "CfgWeapons" >> _item)): {_cfgType = "CfgWeapons"};
		};
		if(_cfgType == "CfgWeapons")then{
			_unit removeWeapon _item;
			_container addWeaponCargo [_item,1];
		}else{
			_unit removeItem _item;
			_container addItemCargo [_item,1];
		};
	};
}];