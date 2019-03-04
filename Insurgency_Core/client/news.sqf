/*
by [TWC] Hobbs
puts a simple news article type hint in players' screens
currently accessed with an ACE interaction on the locstat folder

useful formatting:
new line = <br />
*/

[] spawn {



_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>TWC NEWS</t>"; 

 _text1 = "<br />The latest changelogs on major and minor issues will now be displayed here.<br /><br />Infinite ammunition is no longer available from the base supply box. This is being paired with a substantial increase in supplies for most roles. This allows more rare consumable equipment to be introduced in a sparse amount, such as drum magazines. Commanders can still spawn ammoboxes from the spawner as usual.<br /><br />The German MG's MG36 is now a G36A with bipod and access to Beta-C mags. They have the same barrel length, but now have the proper dual-optic system. The ANA MG also has access to 75 round drum mags for the RPK";
 
 
 //secondary files for member and management news, not viewable on github
 //#include "membernews.sqf";
 #include "managementnews.sqf";
 
 _news = parsetext (_title + _text1 + _titlemem + _textmem + _titlemgmt + _textmgmt);
 
 hint _news;
};

