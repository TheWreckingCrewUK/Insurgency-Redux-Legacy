


execvm "Insurgency_Core\client\sys_intel\stopcivsinit.sqf";


//Questioning Civs
InsP_fnc_questionDisplay = compile preProcessFileLineNumbers "Insurgency_Core\client\sys_intel\fnc_questionDisplay.sqf";
InsP_fnc_moneyDisplay = compile preProcessFileLineNumbers "Insurgency_Core\client\sys_intel\fnc_moneyDisplay.sqf";
InsP_fnc_enemyIntel_body = compile preProcessFileLineNumbers "Insurgency_Core\client\sys_intel\fnc_enemyIntel_body.sqf";
InsP_fnc_enemyIntel = compile preProcessFileLineNumbers "Insurgency_Core\client\sys_intel\fnc_enemyIntel.sqf";
InsP_fnc_givemoney = compile preProcessFileLineNumbers "Insurgency_Core\client\sys_intel\fnc_givemoney.sqf";
InsP_fnc_possibleIntel = compile preProcessFileLineNumbers "Insurgency_Core\client\sys_intel\fnc_possibleIntel.sqf";
InsP_fnc_Evidence = compile preProcessFileLineNumbers "Insurgency_Core\client\sys_intel\fnc_evidence.sqf";


//Adds question action to all civilians whose classname is defined in array civiliantype	
{
	_questionAction = ["QuestionPerson","Question Person","",{[_this select 0] call InsP_fnc_questionDisplay},{alive (_this select 0) && !((_this select 0) getVariable ["ACE_isUnconscious",false]) && (((_this select 0) getVariable ["twc_isenemy",1]) == 0)}] call ace_interact_menu_fnc_createAction;
	
	[_x, 0, ["ACE_MainActions"], _questionAction] call ace_interact_menu_fnc_addActionToClass;
	
	_questionAction = ["QuestionPerson","Give Money","",{(_this select 0) call insp_fnc_moneydisplay},{alive (_this select 0) && !((_this select 0) getVariable ["ACE_isUnconscious",false]) && (((_this select 0) getVariable ["twc_isenemy",1]) == 0) && ("CUP_item_Money" in ((uniformitems player) + (vestitems player) + (backpackitems player)))}] call ace_interact_menu_fnc_createAction;
	
	[_x, 0, ["ACE_MainActions"], _questionAction] call ace_interact_menu_fnc_addActionToClass;
} forEach civiliantype;

_list = [];
{	

	if (!(_x in _list)) then {
		_questionAction = ["QuestionPerson","Question Person","",{[_this select 0] call InsP_fnc_questionDisplay},{alive (_this select 0) && (!((_this select 0) getVariable ["ACE_isUnconscious",false])) && (((_this select 0) getVariable ["twc_isenemy",1]) == 0) && (side (_this select 0) getFriend side player > 0.6)}] call ace_interact_menu_fnc_createAction;
		
		[_x, 0, ["ACE_MainActions"], _questionAction] call ace_interact_menu_fnc_addActionToClass;
	
		_questionAction = ["QuestionPerson","Give Money","",{(_this select 0) call insp_fnc_moneydisplay},{alive (_this select 0) && !((_this select 0) getVariable ["ACE_isUnconscious",false]) && (((_this select 0) getVariable ["twc_isenemy",1]) == 0) && ("CUP_item_Money" in ((uniformitems player) + (vestitems player) + (backpackitems player)))}] call ace_interact_menu_fnc_createAction;
		
		[_x, 0, ["ACE_MainActions"], _questionAction] call ace_interact_menu_fnc_addActionToClass;
		
		_list pushback _x;
	};
	
} forEach townspawn;

EvidenceAction = [ "CollectEvidence", "Collect Evidence", "", { [ 5, [(_this select 0)], { [(_this select 0)] spawn InsP_fnc_Evidence }, {}, "Examining Evidence..." ] call ace_common_fnc_progressBar }, { alive (_this select 0) } ] call ace_interact_menu_fnc_createAction;

["cwa_Tablemap_Desert", 0, ["ACE_MainActions"], EvidenceAction] call ace_interact_menu_fnc_addActionToClass;

["ace_placedInBodyBag", {
	params ["_man", "_bag"];
	if (((_man getVariable ["twc_isenemy",1]) == 1) && (side _man != WEST)) then {_bag setVariable ["twc_isenemy",1, true]; }
}] call CBA_fnc_addEventHandler;