/* written by [TWC] Hobbs
this will count the current number of groups, disregarding any groups that have infantry in their title, and assess whether the player can join an attachment instead of regular infantry.
*/

//first up, let's just go open season if there's more slots than our standard layout of 8+12 infantry roles can manage

if (( count(allPlayers - entities "HeadlessClient_F")) > 23) exitwith {};

_groups = [];

{if (_x == leader _x) then {
	if (!(["infantry", str (group _x)] call BIS_fnc_inString)) then {
		_groups pushback [group _x]
		};
	};
} foreach allplayers;
 

//quick sleep because instring is a bit slow
sleep 3;

_attachmentcount = count _groups;

//look at the playercount and do some maths to see if an attachment is viable. The standard gap is defined in server init and publicvariable, so that if something goes weird with the maths then it can be adjusted on the fly by admin

//intention is to have a sliding scale that puts people into regular infantry roles in the beginning and then lowers the gap to new attachments as the playercount increases to avoid a perpetually reserved slot scenario. simple approach for now

if (((_attachmentcount * twc_attachmentgap)- 3) < ( count(allPlayers - entities "HeadlessClient_F")))

exitwith {systemchat format ["you good %1", ((_attachmentcount * twc_attachmentgap)- 3)]};

//now use the standard spawn restriction system to let the player know what's up

cutText ["", "Black", 0.001];
player forceWalk true;
while {(((_attachmentcount * twc_attachmentgap)- 3) > ( count(allPlayers - entities "HeadlessClient_F")))} do {
cutText ["", "Black", 0.001];
    [ 
        format ["<t size='1.2'>Attachment Role</t><br/><t size='0.6'>There are currently no attachment roles available, join one of the regular infantry roles. %1 players need to be online for the next attachment to become available</t>", 
		
		ceil ((_attachmentcount * twc_attachmentgap)- 3),
		( count(allPlayers - entities "HeadlessClient_F"))
		], 0, 0.22, 5, 0, 0, 2 
    ] spawn bis_fnc_dynamictext;
	
	sleep 5;

};

	
cutText ["","Black IN",5];
player forceWalk false;