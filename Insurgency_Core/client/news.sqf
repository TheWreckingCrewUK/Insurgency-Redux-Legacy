/*
by [TWC] Hobbs
puts a simple news article type hint in players' screens
currently accessed with an ACE interaction on the locstat folder

useful formatting:
new line = <br />
*/

[] spawn {



_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>TWC NEWS</t>"; 

 _text1 = "<br />The latest changelogs on major and minor issues are displayed here.<br /><br />The playercount requirement for heli pilots and crew chiefs have been removed. Instead, an infantry commander needs to be online for heli pilot and 2 infantry commanders need to be online for a crew chief.<br /><br />A test for SF implementation has been added, more info will be posted about this on the forum soon.<br /><br />You will now lose a large portion of your ammunition when respawning. Only take what you need and try to avoid dying. This does not affect vehicles or ammoboxes.";
 
 _titlemem = "";
 _textmem = "";
 //secondary files for member and management news, not viewable on github
 //#include "membernews.sqf";
 #include "managementnews.sqf";
 
 _news = parsetext (_title + _text1 + _titlemem + _textmem + _titlemgmt + _textmgmt);
 
 hint _news;
};

