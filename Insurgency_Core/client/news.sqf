/*
by [TWC] Hobbs
puts a simple news article type hint in players' screens
currently accessed with an ACE interaction on the locstat folder

useful formatting:
new line = <br />
*/

[] spawn {



_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>TWC NEWS</t>"; 

 _text1 = "<br />The latest changelogs on major and minor issues are displayed here.<br /><br />Players that can do PVP can now place fortifications in the Patrol Base with the ACE Fortify function, available in the self interaction menu.<br /><br />The food and water system has been activated on a very loose basis, if you are on the server for an extended period you will see an icon notifying you of hunger or thirst. This is because I intend to make civilian objectives involving food and water in future. If you expect to be on the server for longer than 10 hours then command roles can spawn a hearts and minds box which includes food and water. Letting yourself starve or run out of water results in loss of stamina.";
 
 _titlemem = "";
 _textmem = "";
 _titlemgmt  = "";
_textmgmt  = "";
 //secondary files for member and management news, not viewable on github
 //#include "membernews.sqf";
 //only do the management include if the player is management, so that it only CTD's management if the mission has been built without the file
  if ([player] call twc_core_fnc_ismanagement) then {
 #include "managementnews.sqf";
 };
 _news = parsetext (_title + _text1 + _titlemem + _textmem + _titlemgmt + _textmgmt);
 
 hint _news;
};