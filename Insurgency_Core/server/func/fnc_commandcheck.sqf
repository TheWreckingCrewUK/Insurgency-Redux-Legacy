_command = 0;

{if (["platoon", typeof _x] call BIS_fnc_inString) then {_command = 1}}foreach allplayers;

if (_command == 0) then {
	twc_campaignmode = 0;
	publicVariable "twc_campaignmode";
	};