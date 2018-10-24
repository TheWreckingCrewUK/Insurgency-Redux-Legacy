/*
player addEventHandler ["InventoryOpened", {
	if((getPos player) distance2D (getMarkerPos "base") < 200) then{
		if(primaryWeapon player in twc_restrictedPrimaryWeapons)then{
			player removeWeapon (primaryWeapon player);
		};
		if(secondaryWeapon player in twc_restrictedSecondaryWeapons)then{
			player removeWeapon (secondaryWeapon player);
		};
		if(handgunWeapon player in twc_restrictedHangunWeapons)then{
			player removeWeapon (handgunWeapon player);
		};
	};
}];
*/
_local_restrictedPrimaryWeapons = ["twc_ksvk", "CUP_srifle_SVD_des_ghillie_pso", "CUP_arifle_M16A2", "CUP_arifle_FNFAL", "CUP_arifle_RPK74", "CUP_lmg_PKM", "CUP_arifle_AK74_GL", "CUP_arifle_AK74", "CUP_arifle_AKM", "CUP_arifle_AKS_Gold", "CUP_arifle_M16A2", "CUP_arifle_AKS", "CUP_arifle_AK74"];

if(isNil "twc_restrictedPrimaryWeapons") then{
twc_restrictedPrimaryWeapons = _local_restrictedPrimaryWeapons;
publicVariable "twc_restrictedPrimaryWeapons";
} else {
{twc_restrictedPrimaryWeapons pushback _x} foreach _local_restrictedPrimaryWeapons;
publicVariable "twc_restrictedPrimaryWeapons";};

twc_restrictedSecondaryWeapons = ["CUP_launch_RPG7V"];

player addEventHandler ["Take", {
	params["_unit","_container","_item"];
		if (_item in twc_restrictedPrimaryWeapons) then {
		execvm "Insurgency_Core\client\sys_restrict\restrictedprimary.sqf";
	};
	
		if(_item in twc_restrictedSecondaryWeapons)then{
		execvm "Insurgency_Core\client\sys_restrict\restrictedsecondary.sqf";
					if (random 1>0.98) then {
			"R_60mm_HE" createVehicle (getPos player);
			hint "WEAPON DETONATION";	
			sleep 0.5;
			player removeweapon secondaryWeapon player;
		};
		};

		
	
}];
/*
player addEventHandler ["InventoryOpened", {
	params ["_unit", "_container"];
	if((getPos player) distance2D (getMarkerPos "base") > 200) exitwith {};
	if ((primaryweapon player in (player getvariable ["twc_allowedweapons", [0]])) || (primaryweapon player == "")) exitwith {};

	_goodlist = [];

	{if (_x isKindOf ["Rifle", configFile >> "CfgWeapons"]) then {_goodlist pushback _x}} foreach (player getvariable ["twc_allowedweapons", [0]]);

	player removeWeapon primaryweapon player;
	
	[_container] spawn {
	params ["_container"];
		waituntil {dialog};
		closeDialog 2;
		player action ["GEAR",_container];
	};
	
	if (_container == cratebox) then {
		player addweapon (_goodlist call bis_fnc_selectrandom);

	};
}];
*/
/* secondary systems to restrict the player taking scopes above the power of what they spawn with and taking weapons that they won't need when they get back to base. Didn't work due to weapon classnames changing after picking up the weapon so our twc versions weren't getting picked up, but it was a lot of damn effort and I don't want to waste it so I'm letting it rot for a bit

player addEventHandler ["InventoryClosed", {
	params ["_unit", "_container"]; 
 
_scope = [(configFile >> "CfgWeapons" >> (primaryweapon player) >> "linkeditems" >> "linkeditemsoptic"), "item", "none"] call BIS_fnc_returnConfigEntry; 
if (_scope in (primaryWeaponItems player)) exitwith {}; 
_zoom = 10;  
  
_configsbase = "true" configClasses (configFile >> "CfgWeapons" >> _scope >> "iteminfo" >> "opticsmodes");   
  
_conf = [];   
{_conf pushback configname _x} foreach _configsbase;   
  
  
  
_check = 10;   
{_check = getNumber (configFile >> "CfgWeapons" >> _scope >> "iteminfo" >> "opticsmodes" >> _x >> "opticsZoomMin");  
 if ((_check != 0) && (_check < _zoom)) then {_zoom = _check}; } foreach _conf;  

 
 
//now get the new scope 
 _attacheditems = [];
_attacheditems = primaryWeaponItems player;
if ((count _attacheditems) == 0) exitwith {};
_foundscope = _attacheditems select 0;

_newzoom = 10; 

_check = 10; 
{ 
 _scope = _x; 
  
 _configsbase = "true" configClasses (configFile >> "CfgWeapons" >> _scope >> "iteminfo" >> "opticsmodes");  
 
 _conf = [];  
 {_conf pushback configname _x} foreach _configsbase;  
     
{_check = getNumber (configFile >> "CfgWeapons" >> _scope >> "iteminfo" >> "opticsmodes" >> _x >> "opticsZoomMin");  
 if ((_check > 0) && (_check < _newzoom)) then {_newzoom = _check}; _foundscope = _scope;} foreach _conf; 
 
} foreach _attacheditems; 
// systemchat format ["%1", [_newzoom, _zoom]];

if (_newzoom < _zoom) then {
player removePrimaryWeaponItem _foundscope;
systemchat "Scope removed, nice try chap";};

}];
*/

