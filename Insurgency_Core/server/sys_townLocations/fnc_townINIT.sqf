params["_pos"];

_random =(random 50) + (TWC_insMorale);
if(_random < 50)then{
	_spawn = false;
}else{
	_spawn = true;
};

[_pos,[20,200]] spawn twc_fnc_spawnCiv;