/*
by Hobbs
looks at the magazines in each player's inventory on spawn (before the persistent loadout system kicks in) and builds an array of magazines and their commonality. Used for ammoboxes and vehicles
*/

params ["_player"];
_mags = magazines _player;

missionnamespace setvariable ["twc_spawnmags", _mags + _mags + _mags];
_items = items _player;

missionnamespace setvariable ["twc_spawnitems", _items + _items + _items];
