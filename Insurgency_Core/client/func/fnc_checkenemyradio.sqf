_radio = ["ACRE_PRC152", [player]] call acre_api_fnc_getRadioByType;   
 if (isnil "_radio") exitwith {false}; 
_check = [_radio] call acre_api_fnc_getRadioChannel; 


_var = missionnamespace getvariable ["twc_enemychannel", 2];
If (_check == _var) exitwith {true}; 
false; 