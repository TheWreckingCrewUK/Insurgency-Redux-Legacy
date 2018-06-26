
#include "enemyWeapons.sqf";
#include "noFireInBase.sqf";
#include "noStealFromCrates.sqf";
#include "placedExplosives.sqf";
#include "vehicleSlots.sqf";
#include "heavybackpacks.sqf";
#include "minimi.sqf";



if (isNil "twc_sniperteam") then {
	twc_sniperteam = [];
	publicVariable "twc_sniperteam";
};



execvm "Insurgency_Core\client\sys_restrict\rolerestrictions.sqf";

