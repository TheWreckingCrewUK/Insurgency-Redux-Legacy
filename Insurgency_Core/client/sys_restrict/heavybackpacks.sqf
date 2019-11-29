
if (!(["70", twc_missionname] call BIS_fnc_inString)) then {

player addEventHandler ["Take", {
	params["_unit","_container","_item"];


if (((_item) == "UK3CB_BAF_U_RolledUniform_MTP") && ((["90", twc_missionname] call BIS_fnc_inString))) then {
	(player) setObjectTextureGlobal [0, "uk3cb_baf_equipment\backpacks\data\backpack_ddpm_co.paa"];
};
}];

player addEventHandler ["Take", {
	params["_unit","_container","_item"];

	if (_item isKindOf ["Bag_Base", configFile >> "CfgVehicles"]) then{
		_playerbackpack = [(configFile >> "CfgVehicles" >> typeof player), "backpack", ""] call BIS_fnc_returnConfigEntry;
		
		if ((_item isKindOf ["twc_dpm_belt", configFile >> "CfgVehicles"]) || (_item isKindOf ["CUP_B_ACRScout_m95", configFile >> "CfgVehicles"])) exitwith {
			_unit allowsprint true;
		};
		if ((_playerbackpack == "") || ((side player) == east)) exitwith {
			_unit allowsprint false;
			hint "This Role cannot sprint with a Backpack.";
		};
		
		_playerload = [(configFile >> "CfgVehicles" >> _playerbackpack), "maximumload", 0] call BIS_fnc_returnConfigEntry;
		
		
		_newbackpack = _item;
		
		_newload = [(configFile >> "CfgVehicles" >> _newbackpack), "maximumload", 0] call BIS_fnc_returnConfigEntry;
		
		if (_newload < (130)) exitwith {
			_unit allowsprint true;
		};
		
		if (_newload > (_playerload * 1.1)) exitwith {
			hint "This Backpack is bigger that what this role is used to fighting with. You are unable to Sprint";
			_unit allowsprint false;
		};
		
		if (_newload < (_playerload * 1.1)) exitwith {
			_unit allowsprint true;
		};
		
	};
	
}];

player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	if (_vehicle iskindof "Tank") then {
		if (!((backpack _unit) == "")) then {
		
			_newbackpack = (backpack _unit);
			
			_load = [(configFile >> "CfgVehicles" >> _newbackpack), "maximumload", 0] call BIS_fnc_returnConfigEntry;
			if (_load > 120) then {
				moveout player;
				"MECHANISED MOBILITY" hintc [
					"You are unable to enter armoured vehicles while wearing a backpack. Store it in the vehicle’s inventory or drop it.","Tip: Mechanised troops commonly fight without backpacks."
				];
			};
		};
	};
}];

};

player addEventHandler ["Put", {
	params["_unit","_container","_item"];

	if (_item isKindOf ["Bag_Base", configFile >> "CfgVehicles"]) exitwith{
		_unit allowsprint true;
	};
	
}];