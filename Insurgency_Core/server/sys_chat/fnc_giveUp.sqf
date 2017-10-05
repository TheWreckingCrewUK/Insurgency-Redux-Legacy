//Function that runs when players are attempting to give up

//Exit if a vote is already occuring
if(twc_surrenderVote)exitWith{};
hint "A vote to surrender has begun. You have 5 minutes to use #giveup to end the mission.";
twc_surrenderVote = true;

//5 minute loop to record surrenders
_time = time + 300;
while{_time > time}do{
	sleep 5;
	_count = {_x getVariable ["wantingSurrender",false]}count allPlayers;
	if(_count > (count allPlayers * (3/4) max 4))then{
		"EveryoneLost" call BIS_fnc_endMission
	};
};

//If it fails it sets all units as not surrendering and resets
{
	_x setVariable ["wantingSurrender",false];
}forEach allUnits;

hint "The vote to surrender has failed";
twc_surrenderVote = false;