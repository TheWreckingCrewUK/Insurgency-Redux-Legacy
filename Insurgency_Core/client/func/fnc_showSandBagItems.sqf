params["_player","_target","_params"];
disableSerialization;
_sandBags = twc_supplyBoxBuildables;

player setVariable ["twc_spawnFromBox",false];

createDialog "twc_sandBag_Dialog";

waitUntil{!isNull (findDisplay 9999);};

_ctrl = (findDisplay 9999) displayCtrl 1500;

{
	_string = str (_sandBags select _foreachindex select 1);
	_index = _ctrl lbAdd (getText (configFile >> "cfgVehicles" >> _x select 0 >> "displayName"));
	_ctrl lbSetData [_index, _x select 0];
}forEach _sandBags;
	
_classname = "";
_selectedIndex = "";
_ctrl lbSetCurSel 0;
while{!isNull (findDisplay 9999);}do{
	_selectedIndex = lbCurSel _ctrl;
	_classname = _ctrl lbData _selectedIndex;
		
	ctrlSetText [1201,getText (configFile >> "cfgVehicles" >> _classname >> "editorPreview")];
	ctrlSetText [1001,"Cost = " + str (_sandBags select _selectedIndex select 1) + " Supplies"];
};
sleep 0.2;
systemChat str _selectedIndex;
if(player getVariable "twc_spawnFromBox")then{
	_return = [_target,_classname,((_sandBags select _selectedIndex) select 1)] call twc_fnc_createDefenses;
	hint _return;
	player setVariable ["twc_spawnFromBox",false];
};