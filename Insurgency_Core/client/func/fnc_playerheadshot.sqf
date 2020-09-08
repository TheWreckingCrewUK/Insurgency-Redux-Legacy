//_testing = missionnamespace getvariable ["twc_testmode", false];
		//if (!_testing) exitwith {};
		if ((random 1) < 0.5) exitwith {};
		{
			_x params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];
			if (!_direct) exitwith {};
			if (!("head" in _selection)) exitwith {};
			if ((getNumber (configFile >> "CfgWeapons" >> headgear _target >> "iteminfo" >> "HitpointsProtectionInfo" >> "head" >> "armor")) > 0) exitwith {};
			[_target, true] call ace_medical_fnc_setDead;
		} foreach _this;