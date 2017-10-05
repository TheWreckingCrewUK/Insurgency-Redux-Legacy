params["_item"];

_cfgType = "unknown";
switch true do
{
	case(isClass(configFile >> "CfgMagazines" >> _item)): {_cfgType = "CfgMagazines"};
    case(isClass(configFile >> "CfgWeapons" >> _item)): {_cfgType = "CfgWeapons"};
    case(isClass(configFile >> "CfgVehicles" >> _item)): {_cfgType = "CfgVehicles"};
    case(isClass(configFile >> "CfgGlasses" >> _item)): {_cfgType = "CfgGlasses"};
};
_ret = getText (configFile >> _cfgType >> _item >> "displayName");
_ret