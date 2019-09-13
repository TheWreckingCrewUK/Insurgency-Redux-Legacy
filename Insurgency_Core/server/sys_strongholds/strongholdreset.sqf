

params['_pos'];
_id = [_pos, "Stronghold"];


missionNamespace setVariable ['stronghold_' + (str _id), 5];

['TWC_Insurgency_adjustInsurgentMorale', 10] call CBA_fnc_serverEvent;