player addEventHandler ["InventoryClosed", {[_this select 0, _this select 1] spawn {
		if(typeOf vehicle (_this select 1) == "groundWeaponHolder" && (_this select 0) distance2D (getMarkerPos "base") < 200) then{sleep 300;
		deleteVehicle (_this select 1);
	};
	};
}];