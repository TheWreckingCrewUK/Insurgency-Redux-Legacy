//Clearing Script

//box Crate removal
{
	_arr = nearestObjects [AmmoBoxSpawner, [_x], 30];
	{
		if (!((typeof _x) == "UK3CB_BAF_MAN_HX58_Container_Green")) then {
			deletevehicle _x;
		};
	} foreach _arr;
} foreach ["NATO_Box_Base", "ReammoBox_F", "ace_wheel", "ace_track", "UK3CB_BAF_1Rnd_60mm_Mo_Shells_spent", "UK3CB_BAF_1Rnd_81mm_Mo_Shells_spent"];
