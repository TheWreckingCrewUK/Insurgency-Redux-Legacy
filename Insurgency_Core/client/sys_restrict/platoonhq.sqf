

if (twc_skipsectionsystem == 1) exitwith {};

systemchat "platoon system init";

_groups = [];

_snowflakes = 0;


if(isNil "twc_campaignmode") then{
	twc_campaignmode = 0;
	publicVariable "twc_campaignmode";
};

//now find out what groups we're dealing with. looking for regular infantry groups and adding exemptions for any non-infantry groups that are allowed at low playercounts, like snipers, heli pilots and quartermasters
{if (_x == leader _x) then {
	if (!(["sniper", str (group _x)] call BIS_fnc_inString)) then {
	
		if ((["infantry", str (group _x)] call BIS_fnc_inString)) then {
		
			if (!(["heli", str (group _x)] call BIS_fnc_inString)) then {
			
				if (!(["quartermaster", str (typeof _x)] call BIS_fnc_inString)) then {
				
					_groups pushback (group _x);
					
					} else {_snowflakes = _snowflakes + (count units group _x)};
					
				} else {_snowflakes = _snowflakes + (count units group _x)};
			};
		} else { //sniper exemption because they can spawn under 5 playercount
			if ((count(allPlayers - entities "HeadlessClient_F"))< 5) then {
				_snowflakes = _snowflakes + (count units group _x);
				};
			};
	};
} foreach allplayers;
 
 
//quick sleep because instring is a bit slow
sleep 3;


if ((count _groups) > 1) exitwith {if (twc_campaignmode == 0) then {
	twc_pltcmd = player;
	publicVariable "twc_pltcmd";
	execvm "Insurgency_Core\server\sys_objectives\operation\operation_start.sqf";
};};



//now use the standard spawn restriction system to let the player know what's up
systemchat "gonna restrict you now";
cutText ["", "Black", 0.001];
player forceWalk true;
while {((count _groups) <2)} do {
cutText ["", "Black", 0.001];
    [ 
        format ["<t size='1.2'>Fill The Sections</t><br/><t size='0.6'>There needs to be more than 1 active section to be part of HQ. Join that instead.</t>", 
		
		0
		], 0, 0.22, 5, 0, 0, 2 
    ] spawn bis_fnc_dynamictext;
	_space = 0;
	sleep 5;
	


_groups = [];

_snowflakes = 0;

{if (_x == leader _x) then {
	if ((["infantry", str (group _x)] call BIS_fnc_inString)) then {
		if (!(["heli", str (group _x)] call BIS_fnc_inString)) then {
			if (!(["sniper", str (group _x)] call BIS_fnc_inString)) then {
				_groups pushback [group _x];
				} else {
					if ((count(allPlayers - entities "HeadlessClient_F"))< 5) then {
						_snowflakes = _snowflakes + (count units group _x)
						};
					};
			} else {_snowflakes = _snowflakes + 1};
		};
	};
} foreach allplayers;


};

	
cutText ["","Black IN",5];
player forceWalk false;


if (twc_campaignmode == 0) then {
	twc_pltcmd = player;
	publicVariable "twc_pltcmd";
	execvm "Insurgency_Core\server\sys_objectives\operation\operation_start.sqf";
};
