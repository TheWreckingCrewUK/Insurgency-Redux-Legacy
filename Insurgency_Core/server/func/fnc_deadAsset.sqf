/*
simple function to call which assigns points when something is killed. Use addeventhandler "killed" for this

nicked from the dead cache function since it worked and doing it straight from the eventhandler was causing strange server issues

*/
params["_points"];

["TWC_Insurgency_adjustPoints",_points] call CBA_fnc_serverEvent;