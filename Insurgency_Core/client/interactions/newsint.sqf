
_alphaaction = ["SpawnsmallAlphaCreate","TWC News","",{call twc_news},{true}] call ace_interact_menu_fnc_createAction;
["TWC_Item_Public_Base_LOCSTAT",0,["ACE_MainActions"],_alphaaction,true] call ace_interact_menu_fnc_addActionToClass;


twc_news = {
	/*
	by [TWC] Hobbs
	puts a simple news article type hint in players' screens
	currently accessed with an ACE interaction on the locstat folder

	useful formatting:
	new line = <br />
	*/

	[] spawn {
	 _news = missionnamespace getvariable ["twc_newstext", "There doesn't appear to be any news"];
	 
	 hint _news;
	};
};