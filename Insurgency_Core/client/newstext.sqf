/*
by [TWC] Hobbs
puts a simple news article type hint in players' screens
currently accessed with an ACE interaction on the locstat folder

useful formatting:
new line = <br />
*/

_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>TWC NEWS</t>"; 

 _text1 = "<br />The latest changelogs on major and minor issues are displayed here.<br /><br />Civilians will now turn to look at you when questioned.<br /><br />You can now interact with vehicles to prep them with relevant ammo when parked on the spawn pad.<br /><br />The food and water system has been activated on a very loose basis, if you are on the server for an extreme amount of time you will see an icon notifying you of hunger or thirst. Letting yourself starve or run out of water results in loss of stamina.";
 
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
 
 missionnamespace setvariable ["twc_newstext", _news];