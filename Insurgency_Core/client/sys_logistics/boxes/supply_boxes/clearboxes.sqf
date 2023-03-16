//Clearing Script
params [["_emptyonly", false]];
//box Crate removal
_pos = (getPos AmmoBoxSpawner);
{
	_arr = nearestObjects [_pos, [_x], 30];
	{
		if (!((typeof _x) == "UK3CB_BAF_MAN_HX58_Container_Green")) then {
			_needsdel = true;
			if (_emptyonly) then {
				if ((count ((weaponcargo _x) + (itemcargo _x) + (magazinecargo _x) + (backpackcargo _x))) > 0) then {
					_needsdel = false;
				};
			};
			if (_needsdel) then {
				deletevehicle _x;
			};
		};
	} foreach _arr;
} foreach ["NATO_Box_Base", "ReammoBox_F", "ace_wheel", "ace_track", "UK3CB_BAF_1Rnd_60mm_Mo_Shells_spent", "UK3CB_BAF_1Rnd_81mm_Mo_Shells_spent"];
