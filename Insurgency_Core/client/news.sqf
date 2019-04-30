/*
by [TWC] Hobbs
puts a simple news article type hint in players' screens
currently accessed with an ACE interaction on the locstat folder

useful formatting:
new line = <br />
*/

[] spawn {



_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>TWC NEWS</t>"; 

 _text1 = "<br />The latest changelogs on major and minor issues are displayed here.<br /><br />Gear that is dropped in the field such as backpacks should no longer be deleted as long as its outside base. Equipment discarded inside base will despawn after 10 minutes";
 
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

