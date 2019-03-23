/*
by [TWC] Hobbs
puts a simple news article type hint in players' screens
currently accessed with an ACE interaction on the locstat folder

useful formatting:
new line = <br />
*/

[] spawn {



_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>TWC NEWS</t>"; 

 _text1 = "<br />The latest changelogs on major and minor issues are displayed here.<br /><br />Infinite ammunition is no longer available from the base supply box.<br /><br />The player requirement for crew chief has been dropped from 14 to 11.<br /><br />90s heli crew chiefs added to all relevant missions";
 
 _titlemem = "";
 _textmem = "";
 //secondary files for member and management news, not viewable on github
 //#include "membernews.sqf";
 #include "managementnews.sqf";
 
 _news = parsetext (_title + _text1 + _titlemem + _textmem + _titlemgmt + _textmgmt);
 
 hint _news;
};

