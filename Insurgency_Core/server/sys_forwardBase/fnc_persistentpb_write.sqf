/*
by Hobbs
collects a picture of the environment around a patrol base, to then be recreated upon mission restart to create persistent patrol bases

*/
params ["_trigger"];

_pos = getpos _trigger;

_radio = _pos nearObjects ["vysilacka",200];

if ((count _radio) == 0) exitwith {deletevehicle _trigger;};

_primary = nearestObjects [_pos, (["landvehicle", "air", "NATO_Box_Base", "UK3CB_BAF_MAN_HX58_Container_Green", "twc_radiotable", "twc_portableGenerator", "B_supplyCrate_F"]) + twc_fortifyobjects, 300];

_final = [];
// && ((isvehiclecargo _x) == objnull) && (((getposatl _x) select 2) > 0)
{
	_objarray = [];
	if (((damage _x) < 1) && (((getposatl _x) select 2) > -30) && (isnull (isvehiclecargo _x)) && (({alive _x} count (crew _x)) == 0)) then {
		_vector = [vectordir _x, vectorup _x];
		_cargo = (_x getvariable ["ace_cargo_loaded", []]);
		_cargoarray = [];
		{
			_cargoobjarray = [_x];
			if (!(_x isequaltype "a")) then {
				//make sure it's a string
				_cargoobjarray = [typeof _x];
				_cargocontents = [getitemcargo _x, getweaponcargo _x, getmagazinecargo _x];
				_cargoobjarray pushback _cargocontents;
				//at this point cargoobjarray should be [ typeof thing (string), [items, weapons, mags] ]
				_cargoarray pushback _cargoobjarray;
				// this should make cargoarray to be [ [ typeof thing (string), [items, weapons, mags] ], [ typeof thing (string), [items, weapons, mags] ] ]
				// cargoarray then get put inside the objarray
			}; 
		} foreach _cargo;
		
		
		
		_viv = getVehicleCargo _x;
		_vivarray = [];
		{
			_cargoobjarray = [_x];
			
			if (!(_x isequaltype "a")) then {
				//make sure it's a string
				_vivobjarray = [typeof _x];
				_vivcontents = [getitemcargo _x, getweaponcargo _x, getmagazinecargo _x];
				_vivobjarray pushback _vivcontents;
				
				_vivcargo = (_x getvariable ["ace_cargo_loaded", []]);
				_vivcargoarray = [];
				
				//viv cargo is each vehicle that is in there
				//vivarray is the array that gets added to the objarray
				//_vivarray = [typeof _obj, [items, weapons, mags], [[ace cargo obj, [items, weapons, mags]], [ace cargo obj, [items, weapons, mags]]]]
				{
					
					_vivcargoobjarray = [_x];
					if (!(_x isequaltype "a")) then {
						//make sure it's a string
						_vivcargoobjarray = [typeof _x];
						_vivcargocontents = [getitemcargo _x, getweaponcargo _x, getmagazinecargo _x];
						_vivcargoobjarray pushback _vivcargocontents;
						//[obj, stuff]
						_vivcargoarray pushback _vivcargoobjarray;
						// every obj on the viv vehicle, with its stuff
						// 
					}; 
				} foreach _vivcargo;
				
				_vivobjarray pushback _vivcargoarray;
				
				_vivarray pushback _vivobjarray;
				
			}; 
			
			_vivobjarray = [];
			_vivcontents = [[[],[]], [[],[]], [[],[]]];
			_vivcargo = [];
			_vivcargoarray = [];
		} foreach _viv;
		
		
		
		
		_objarray = [typeof _x, getposasl _x, getdir _x, getitemcargo _x, getweaponcargo _x, getmagazinecargo _x, _cargoarray, _vivarray, _vector];
		_final pushback _objarray;
	};
} foreach _primary;

profilenamespace setvariable ["twcpb" + missionname, _final];
saveprofilenamespace;