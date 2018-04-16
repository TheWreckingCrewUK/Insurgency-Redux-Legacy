//Controller to make sure terp messages don't overstack
params ["_time"];
terptimer = _time;

[] spawn {

while {terptimer > 0} do {terptimer = terptimer - 10; sleep 10};
}