_vehicle = _this select 0;


if(isNil "twc_repairtickets") then{
	twc_repairtickets = 5;
	publicvariable "twc_repairtickets";
};

if (typeof _vehicle == "Land_InfoStand_V1_F") then {
_list = (_vehicle nearentities [["car", "helicopter", "plane", "tank"], 10]); {_x setdamage 0.1; _x setdamage 0; _x setvehicleammo 1} foreach _list;

hint format ["%1 Vehicles Repaired", count _list];

sleep 5;
_tsv = ["CUP_B_Wolfhound_LMG_GB_W", "CUP_B_Wolfhound_LMG_GB_D"];
{
if (count (_vehicle nearobjects [_x, 30]) > 0) then {
	twc_repairtickets = 5;
	publicvariable "twc_repairtickets";
	hint "Logistics Vehicle Resupplied";
	} else { 
	if (twc_is90 == 0) then {
	hint "Logistics Vehicle Not Nearby, Unable To Resupply."}}
	} foreach _tsv;
} else 
//now it's the non-base repair script, usually from a wolfhound, with a ticket system
{

//replen the vehicle's tickets if it's near the spawner
if (count (_vehicle nearobjects ["Land_InfoStand_V1_F", 30]) > 0) then {
	twc_repairtickets = 6;
	publicvariable "twc_repairtickets";
	hint "Logistics Vehicle Resupplied";
	sleep 5;
	};

if (twc_repairtickets > 0) then {
_list = (_vehicle nearentities [["car", "helicopter", "plane", "tank"], 10]); 

_time = time;

hint format ["Repairing. %1 Seconds Remaining.", (count _list * 10)];
waituntil {time > _time + (count _list * 10)};

if ((count _list) == (count (_vehicle nearentities [["car", "helicopter", "plane", "tank"], 10]))) then {
{_x setdamage 0.1; _x setdamage 0; _x setvehicleammo 1} foreach _list;
	twc_repairtickets = twc_repairtickets - 1;
	publicvariable "twc_repairtickets";
	
	
hint format ["%1 Vehicles Repaired. %2 Repairs Remaining. Resupply The Vehicle From The Base Ammo Spawner.", count _list, twc_repairtickets];} else {hint "The Number Of Vehicles In The Repair Zone Changed. Repair Cancelled."}

;
	
	} else 
	
	{
	hint "This Vehicle Can No Longer Repair Anything. Resupply The Vehicle From The Base Ammo Spawner."
	};
	
};
