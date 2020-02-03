_role = typeof vehicle player;

_profile = profilenamespace getvariable ["twcpubloadout" + _role, []];

if ((count _profile) == 0) exitwith {
	//systemchat "no loadout found, writing . . .";
	profilenamespace setvariable ["twcpubloadout" + _role, [uniformitems player, vestitems player, backpackitems player]];
	saveprofilenamespace;
};

{player removeitemfromuniform _x} foreach (uniformitems player);

if (!("ACE_EarPlugs" in (_profile select 0))) then {
	player additemtouniform "ACE_EarPlugs";
};

if (!("ACE_Canteen" in (_profile select 0))) then {
	player additemtouniform "ACE_Canteen";
};
player removeitem "ACE_Canteen_Empty";
player removeitem "ACE_Canteen_Half";

{
	
	player additemtouniform _x;
} foreach (_profile select 0);

{player removeitemfromvest _x} foreach (vestitems player);

{
	
	player additemtovest _x;
} foreach (_profile select 1);

{player removeitemfrombackpack _x} foreach (backpackitems player);
{
	
	player additemtobackpack _x;
} foreach (_profile select 2);

//systemchat "loaded loadout";