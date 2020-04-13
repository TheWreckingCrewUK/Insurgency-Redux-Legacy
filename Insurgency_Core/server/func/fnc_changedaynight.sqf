//Function for switching to day or night

params [["_light", 1]];

_canchange = missionnamespace getvariable ["twc_daytimeonly", false];

if ((_light == 0) and (_canchange)) exitwith {
	"This mission does not have sufficient equipment for night ops" remoteExec ["hint"];
};

while {(!(sunormoon == _light))} do {
	skiptime 3;
};
skiptime 0.5;