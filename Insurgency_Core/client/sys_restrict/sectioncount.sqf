/* written by [TWC] Hobbs
the functional opposite of the attachment count system, this will keep everyone to a single main section
*/

//first up, let's just go open season if there's more slots than our standard layout of infantry can manage

if (( count(allPlayers - entities "HeadlessClient_F")) > 23) exitwith {};



if (isnil "twc_skipsectionsystem") then {
twc_skipsectionsystem = 0;
publicVariable "twc_skipsectionsystem";
};


if (isnil "twc_sectionsize") then {
twc_sectionsize = 7;
publicVariable "twc_sectionsize";
};

if (twc_skipsectionsystem == 1) exitwith {};


//then we'll exit if they haven't joined a regular infantry slot, there's other stuff for that
if (!(["infantry", str (group player)] call BIS_fnc_inString)) exitwith {
//systemchat "section system thinks you've taken a non standard slot. Let Hobbs know ASAP if this isn't the case";
};

//init the group count for the first player to join
if (isnil "twc_groupcount") then {
	twc_groupcount = 1;
	publicVariable "twc_groupcount"};

//now exempt the heli crew, it's named as infantry in the sqm to take it out of the attachment stuff
if(["heli", str (group player)] call BIS_fnc_inString)exitwith{};

_groups = [];

_snowflakes = 0;

	if ((["quartermaster", str (typeof player)] call BIS_fnc_inString)) exitwith {};

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

//systemchat format["section system sees %1 viable groups", count _groups];
//if the player hasn't increased the number of groups from the last player to do the count, exit the script

if ((count _groups) == twc_groupcount) exitwith {
twc_groupcount = count _groups;
publicVariable "twc_groupcount";
//systemchat "section system thinks you're ok";
};



//no need to do anything if there's only 1 group
if ((count _groups) == 1) exitwith {
twc_groupcount = count _groups;
publicVariable "twc_groupcount";
//systemchat "there's only one group";
};


//see if the section they're in is populated

if ((count units group player) >= (3 min ((count(allPlayers - entities "HeadlessClient_F")) - _snowflakes))) exitwith {
twc_groupcount = count _groups;
publicVariable "twc_groupcount";
//systemchat "section system thinks you've joined a decent sized team";
};


systemchat format ["I see %1", _groups];
//find out if the other infantry groups have any space
_space = 0;
{	if(!(str group player == str _x)) then {
		if ((count units _x) < twc_sectionsize) then {
			_space = 1;
		} else {
		//systemchat "found a full group";
		};
	} else {
	//systemchat "got your number"
	};
} foreach _groups;

//systemchat format ["space equals %1", _space];
 
// if it finds no space in any of the sections, update the server with the new group count to check for future and don't restrict the new guy for joining a new section
if (_space == 0) exitwith {
twc_groupcount = count _groups;
publicVariable "twc_groupcount";
//systemchat "section system thinks all the sections are full, let Hobbs know ASAP if this isn't the case";
cutText ["","Black IN",5]; 
player forceWalk false;
};

//now use the standard spawn restriction system to let the player know what's up
//systemchat "gonna restrict you now";
cutText ["", "Black", 0.001];
player forceWalk true;
while {((count units group player) < (3 min ((count(allPlayers - entities "HeadlessClient_F")) - _snowflakes))) && (_space == 1)} do {
cutText ["", "Black", 0.001];
    [ 
        format ["<t size='1.2'>Fill The Sections</t><br/><t size='0.6'>There are other sections that need to be filled. Go there or get 3 or more people in the current section</t>", 
		
		0
		], 0, 0.22, 5, 0, 0, 2 
    ] spawn bis_fnc_dynamictext;
	_space = 0;
	sleep 5;
	{	if(!(group player == _x)) then {
		if ((count units _x) < twc_sectionsize) then {
			_space = 1;
		};
	};
} foreach _groups;

if (_space == 0) exitwith {
twc_groupcount = count _groups;
publicVariable "twc_groupcount";
//systemchat "section system thinks all the sections are full, let Hobbs know ASAP if this isn't the case";
cutText ["","Black IN",5]; 
player forceWalk false;
};


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

if ((count units group player) >= 3) exitwith {
twc_groupcount = count _groups;
publicVariable "twc_groupcount";
cutText ["","Black IN",5]; 
player forceWalk false;
};


};

	
cutText ["","Black IN",5];
player forceWalk false;