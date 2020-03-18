params["_civ"];

[_civ, player] remoteexec ["twc_ailookat", _civ];
_hasmoney = (_civ getVariable ["twc_hasmoney",0]);
if (_hasmoney == 1) exitwith {hint "This civilian doesn't want any more money"};

if (captive _civ) exitwith {hint "Civilians will not accept money while handcuffed"};

[5, _civ, {[_this select 0] call InsP_fnc_givemoney;}, {}, "Giving Money..."] call ace_common_fnc_progressBar;

