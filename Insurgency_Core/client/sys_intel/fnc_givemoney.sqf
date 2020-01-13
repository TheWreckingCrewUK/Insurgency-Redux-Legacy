params ["_civ"];

_civ setVariable ["twc_hasmoney",1, true];

if (TWC_civMorale <= 25) exitwith {
	hint "Your money is worth nothing to me or my people. Leave my village, leave my country and leave us alone";
};

player removeitem "CUP_item_Money";

["TWC_Insurgency_adjustCivilianMorale", 0.1] call CBA_fnc_serverEvent;

switch (True) do {
	case (floor TWC_civMorale <= 30):{hint "Look, I'll take your money but making a genuine difference around here is more difficult than that."};
	case (floor TWC_civMorale <= 40):{hint "Thanks, I appreciate this."};
	case (floor TWC_civMorale <= 50):{hint "You guys really want us on your side huh?"};
	case (floor TWC_civMorale <= 60):{hint "I appreciate what you've done around here, and thanks for the money too."};
	case (floor TWC_civMorale <= 70):{hint "I'm glad you're here, even if you weren't giving out free money it's clear you're the good guys."};
	case (floor TWC_civMorale <= 90):{hint "I'm really happy that you guys are helping us, not just with the money but in general."};
	case (floor TWC_civMorale > 90):{hint "Wow things are really looking up around here, thanks!"};
};