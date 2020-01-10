player addEventHandler ["InventoryClosed", {
	if((_this select 1) != crateBox) exitwith {};
		_iedarray = ["IEDLandSmall_Remote_Mag", "IEDUrbanSmall_Remote_Mag", "IEDLandBig_Remote_Mag", "IEDUrbanBig_Remote_Mag"];
		_items = magazineCargo (_this select 1);
		{
			if (_x in _iedarray) then {
				[cratebox, _x] call CBA_fnc_removeMagazineCargo;
				["TWC_Insurgency_adjustPoints", 20] call CBA_fnc_serverEvent;
				hint "IED Parts recovered, extra intel gained.";
				_color = "ColorYellow";
				_object = InsP_iedGroup call BIS_fnc_selectRandom;
				_distance = [100,200] call BIS_fnc_selectRandom;
				_intelPos = [_object, _distance] call CBA_fnc_randPos;
				_marker = createMarker [format["%1%2", _object, (str _intelPos)], _intelPos];
				_marker setMarkerType "hd_join";
				_marker setMarkerColor _color;
				_marker setMarkerText (str(_distance) + "m");
				_marker setMarkerSize [0.5,0.5];
			};
		} foreach _items;
	
}];


/*
player addEventHandler ["InventoryOpened", {
	params ["_unit", "_container"];
	
	if (!(_container == crateBox)) exitwith {};
	_backpack = ((backpackitems player) + (vestitems player));
	_iedarray = ["IEDLandSmall_Remote_Mag", "IEDUrbanSmall_Remote_Mag", "IEDLandBig_Remote_Mag", "IEDUrbanBig_Remote_Mag"];
	{
		if (_x in _iedarray) then {
			player removeitem _x;
			["TWC_Insurgency_adjustPoints", 20] call CBA_fnc_serverEvent;
			hint "IED Parts recovered";
		};
	} foreach _backpack;
}];
*/

