//now find out what groups we're dealing with. looking for regular infantry groups and adding exemptions for any non-infantry groups that are allowed at low playercounts, like snipers, heli pilots and quartermasters
{if (_x == leader _x) then {
	
		if ((["infantry", str (group _x)] call BIS_fnc_inString)) then {
		
			if (!(["heli", str (group _x)] call BIS_fnc_inString)) then {
			
				if (!(["quartermaster", str (typeof _x)] call BIS_fnc_inString)) then {
				
					_groups pushback (group _x);
					
					} else {_snowflakes = _snowflakes + (count units group _x)};
					
				} else {_snowflakes = _snowflakes + (count units group _x)};
			};
		
	};
} foreach allplayers;
 
 {if (_x == leader _x) then {
		if (!(["HQ", str (group _x)] call BIS_fnc_inString)) then {
			if (!(["quartermaster", str (typeof _x)] call BIS_fnc_inString)) then {
			_groups pushback [group _x]
			};
		};
	};
} foreach allplayers;
 
//quick sleep because instring is a bit slow
sleep 3;

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
