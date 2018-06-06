/*written by [TWC] Hobbs, for when you want to be especially mean

mild gas attack script that causes bleeding over time from every orifice, which can be mitigated with atropine

twc_chembag is the origin object of the gas, it will account for wind direction and speed to determine where it will affect the player

*/
//params ["_obj"];
systemchat "activated";

if (isnil "twc_chembag") then {

twc_chembag =  
createVehicle ["Land_CanOpener_F", [0,0,0], [], 0, "can_collide"];  
hideobject twc_chembag; 

};



waituntil {(player distance twc_chembag) < 200};


_windSpeed = (vectorMagnitude wind) * 2;
_windDir = (wind select 0) atan2 (wind select 1);

_pos = twc_chembag getrelpos [_windSpeed, _windDir];

waituntil {(player distance _pos) < 100};

while {(player distance _pos) < 100} do {

if ((player getVariable ["ace_medical_atropine_insystem", 0])< 0.1) then {

if (isnil "twc_chembag") then {

twc_chembag =  
createVehicle ["Land_CanOpener_F", [0,0,0], [], 0, "can_collide"];  
hideobject twc_chembag; 

};


_windSpeed = (vectorMagnitude wind) * 2;
_windDir = (wind select 0) atan2 (wind select 1);

_pos = twc_chembag getrelpos [_windSpeed, _windDir];

_limb = ["hand_l","hand_r","leg_l","leg_r","Head","body"] call bis_fnc_selectrandom;

[player, 0.1, _limb, "stab"] call ace_medical_fnc_addDamageToUnit;

_severity = (player distance _pos)/ 5;

sleep (3 + _severity);

systemchat "gas";
};
};


execVM "Insurgency_Core\client\func\fnc_gasattack.sqf";