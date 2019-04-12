/*
by [TWC] Hobbs
puts a simple news article type hint in players' screens
currently accessed with an ACE interaction on the locstat folder

useful formatting:
new line = <br />
*/

[] spawn {



_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>TWC NEWS</t>"; 

 _text1 = "<br />The latest changelogs on major and minor issues are displayed here.<br /><br />A fix has been put in for caches not giving points for being destroyed. Let Hobbs know if this persists<br /><br />A more forgiving system has been put in place for full team restrictions. If you've been alive for more than half an hour and you're more than 1km from base you will not be blacked out if your attachment team drops below the limit<br /><br />A test for SF implementation has been added, more info is available on the forum.<br /><br />You will now lose a large portion of your ammunition when respawning. Only take what you need and try to avoid dying. This does not affect vehicles or ammoboxes.";
 
 _titlemem = "";
 _textmem = "";
 //secondary files for member and management news, not viewable on github
 //#include "membernews.sqf";
 //only do the management include if the player is management, so that it only CTD's management if the mission has been built without the file
  if ([player] call twc_core_fnc_ismanagement) then {
 #include "managementnews.sqf";
 };
 _news = parsetext (_title + _text1 + _titlemem + _textmem + _titlemgmt + _textmgmt);
 
 hint _news;
};

