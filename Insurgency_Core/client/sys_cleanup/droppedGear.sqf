player addEventHandler ["InventoryClosed", {if(typeOf vehicle (_this select 1) != "groundWeaponHolder") exitwith {};[_this select 0, _this select 1] spawn {
		if(typeOf vehicle (_this select 1) == "groundWeaponHolder" && ((_this select 0) distance2D (missionnamespace getvariable ["twc_basepos", [0,0,0]]) < 200)) then{
			sleep 600;
			if (!isnull (_this select 1)) then {
				deleteVehicle (_this select 1);
			};
		};
	};
}];