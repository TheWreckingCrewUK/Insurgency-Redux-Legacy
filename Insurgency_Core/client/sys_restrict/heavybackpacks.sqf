//if this ever needs to work, make a version that checks the current backpack on respawn

twc_heavybackpacks = ["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A"];
publicvariable "twc_heavybackpacks";


player addEventHandler ["Take", {
	params["_unit","_container","_item"];


if (((_item) == "UK3CB_BAF_U_RolledUniform_MTP") && ((["90", twc_missionname] call BIS_fnc_inString))) then {
	(player) setObjectTextureGlobal [0, "uk3cb_baf_equipment\backpacks\data\backpack_ddpm_co.paa"];
};
}];

/*
player addEventHandler ["Take", {
	params["_unit","_container","_item"];

		if(_item in twc_heavybackpacks)then{
		_unit allowsprint false;
	};
	
}];
*/

player addEventHandler ["Take", {
	params["_unit","_container","_item"];

	if (_item isKindOf ["Bag_Base", configFile >> "CfgVehicles"]) then{
		_playerbackpack = [(configFile >> "CfgVehicles" >> typeof player), "backpack", ""] call BIS_fnc_returnConfigEntry;
		
		if (_item isKindOf ["twc_dpm_belt", configFile >> "CfgVehicles"]) exitwith {
			_unit allowsprint true;
		};
		if (_playerbackpack == "") exitwith {
			_unit allowsprint false;
			hint "This Role is not used to fighting with a Backpack. You are unable to Sprint";
		};
		
		_playerload = [(configFile >> "CfgVehicles" >> _playerbackpack), "maximumload", 0] call BIS_fnc_returnConfigEntry;
		
		_newbackpack = _item;
		
		_newload = [(configFile >> "CfgVehicles" >> _newbackpack), "maximumload", 0] call BIS_fnc_returnConfigEntry;
		
		if (_newload > (_playerload * 1.1)) exitwith {
			hint "This Backpack is bigger that what this role is used to fighting with. You are unable to Sprint";
			_unit allowsprint false;
		};
		
		if (_newload < (_playerload * 1.1)) exitwith {
			_unit allowsprint true;
		};
		
	};
	
}];

player addEventHandler ["Put", {
	params["_unit","_container","_item"];

	if (_item isKindOf ["Bag_Base", configFile >> "CfgVehicles"]) exitwith{
		_unit allowsprint true;
	};
	
}];

/*
player addEventHandler ["Put", {
	params["_unit","_container","_item"];
	
			if(_item in twc_heavybackpacks)then{
		_unit allowsprint true;
	};
	
}];
*/
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