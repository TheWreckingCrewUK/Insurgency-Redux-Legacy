

//systemchat "marker init";
if (markertime < 5) then {
//systemchat "marker start reset";
clearingmarker = 1;
publicvariable "clearingmarker";
while {markertime < 5} do {
//systemchat "markreset";
markertime = markertime + 1;
publicvariable "markertime";
sleep 60;
};
};

	if (markertime == 5) then {
markertime = 6;
publicvariable "markertime";

clearingmarker = 0;
publicvariable "clearingmarker";
};

