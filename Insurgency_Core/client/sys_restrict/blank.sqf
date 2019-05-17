if ([player] call TWC_Core_fnc_ismanagement) exitwith {};
waituntil {!isnil "twc_approvedenemies"};

cutText ["", "Black", 0.001];
player forceWalk true;

while {(!((getPlayerUID player) in twc_approvedenemies))}do{
	
cutText ["", "Black", 0.001];

    [
        "<t size='1.2'>Enemy Players</t><br/><t size='0.6'>This slot is used by members that play as the enemy. You are not whitelisted for playing as an enemy on this server</t>", 0, 0.22, 5, 0, 0, 2
    ] spawn bis_fnc_dynamictext;
	sleep 5;
};

while {(count allplayers) < 13}do{
	
cutText ["", "Black", 0.001];

    [
        "<t size='1.2'>Enemy Players</t><br/><t size='0.6'>You need at least 13 players online before you can be an enemy. Be useful for a while</t>", 0, 0.22, 5, 0, 0, 2
    ] spawn bis_fnc_dynamictext;
	sleep 5;
};
cutText ["","Black IN",1];
player forceWalk false;