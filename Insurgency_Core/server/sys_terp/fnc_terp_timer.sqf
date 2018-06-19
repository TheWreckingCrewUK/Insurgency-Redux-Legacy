//Controller to make sure terp messages don't overstack
params ["_time"];
terptimer = _time;

[] spawn {

while {terptimer > 0} do {sleep 10; terptimer = terptimer - 10;};
}