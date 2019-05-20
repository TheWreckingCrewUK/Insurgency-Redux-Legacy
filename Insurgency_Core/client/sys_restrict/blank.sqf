if ([player] call TWC_Core_fnc_ismanagement) exitwith {};
waituntil {!isnil "twc_approvedenemies"};

cutText ["", "Black", 0.001];
player forceWalk true;

while {(!((getPlayerUID player) in twc_approvedenemies))}do{
	
cutText ["", "Black", 0.001];

    [
        "<t size='1.2'>Enemy Players</t><br/><t size='0.6'>This slot is used by members that play as aggressors. You are not whitelisted for playing as an aggressor on this server</t>", 0, 0.22, 5, 0, 0, 2
    ] spawn bis_fnc_dynamictext;
	sleep 5;
};

while {(count allplayers) < 13}do{
	
cutText ["", "Black", 0.001];

    [
        "<t size='1.2'>Aggressor Players</t><br/><t size='0.6'>You need at least 13 players online before you can be an aggressor. Be useful for a while</t>", 0, 0.22, 5, 0, 0, 2
    ] spawn bis_fnc_dynamictext;
	sleep 5;
};
cutText ["","Black IN",1];
player forceWalk false;

"AGGRESSORS" hintc ["ACE interact on the base ammobox to become enemy", "Don't exploit players that dont want to spend their evening looking backwards. Harass or ambush from a distance.", "Dont enter the BLUFOR base"];