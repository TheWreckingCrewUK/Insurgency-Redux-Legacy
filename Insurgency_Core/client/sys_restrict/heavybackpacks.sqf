//if this ever needs to work, make a version that checks the current backpack on respawn

twc_heavybackpacks = ["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A"];
publicvariable "twc_heavybackpacks";


player addEventHandler ["Take", {
	params["_unit","_container","_item"];

		if(_item in twc_heavybackpacks)then{
		_unit allowsprint false;
	};
	
}];

player addEventHandler ["Put", {
	params["_unit","_container","_item"];
	
			if(_item in twc_heavybackpacks)then{
		_unit allowsprint true;
	};
	
}];