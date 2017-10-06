player addEventHandler ["InventoryClosed", {
	if(typeOf vehicle (_this select 1) == "CUP_BAF_VehicleBox") then{
		_items = magazineCargo (_this select 1);
		_count = {_x in ["ACE_IEDLandBig_Range_Ammo","ACE_IEDLandSmall_Range_Ammo","ACE_IEDUrbanBig_Range_Ammo","ACE_IEDUrbanSmall_Range_Ammo"]} count _items;
		["TWC_Insurgency_adjustPoints", (_count * 5)] call CBA_fnc_serverEvent;
	};
}];