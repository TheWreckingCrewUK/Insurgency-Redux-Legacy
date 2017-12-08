

clearingmarker = 0;
publicvariable "clearingmarker";
clearon = 1;
//systemchat "marker init";
if (markertime < 5) then {
//systemchat "marker start reset";
clearingmarker = 1;
while {markertime < 5} do {
//systemchat "markreset";
markertime = markertime + 1;
publicvariable "markertime";
sleep 6;
};
};

	if (markertime == 5) then {
markertime = 6;
publicvariable "markertime";

clearingmarker = 0;
publicvariable "clearingmarker";
};

