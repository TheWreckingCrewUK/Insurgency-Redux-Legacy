player addEventHandler ["InventoryClosed", {
	if(typeOf vehicle (_this select 1) == "CUP_BAF_VehicleBox") then{
		_items = magazineCargo (_this select 1);
		_count = {_x == "IEDLandBig_Remote_Mag"} count _items;
		["TWC_Insurgency_adjustPoints", (_count * 2)] call CBA_fnc_serverEvent;
	};
}];