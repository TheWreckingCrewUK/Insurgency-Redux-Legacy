/*
by [TWC] Hobbs
puts a simple news article type hint in players' screens
currently accessed with an ACE interaction on the locstat folder

useful formatting:
new line = <br />
*/

[] spawn {
 _news = missionnamespace getvariable ["twc_newstext", ""];
 
 hint _news;
};