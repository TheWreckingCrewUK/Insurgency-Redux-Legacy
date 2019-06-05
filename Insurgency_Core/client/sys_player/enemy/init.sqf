_voice = (["Male01TK", "Male02TK", "Male03TK", "Male04TK", "Male05TK"] call bis_fnc_selectrandom); 

if ((player getvariable ["twc_enemyvoice", "none"]) == "none") then {

player setvariable ["twc_enemyvoice", _voice];

};

