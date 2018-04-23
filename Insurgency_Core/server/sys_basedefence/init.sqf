
if(isNil "basemode") then{
	basemode = 0;
	publicVariable "basemode";
};

if(isNil "basesafe") then{
	basesafe = 201;
	publicVariable "basesafe";
};

if(isNil "alarm") then{
	alarm = 0;
	publicvariable "alarm";
};

if(isNil "clearing") then{
	clearing = 0;
	publicvariable "clearing";
};

if(isNil "idfreported") then{
	idfreported = 0;
	publicvariable "idfreported";
};

if(isNil "idfon") then{
	idfon = 0;
	publicvariable "idfon";
};

if(isNil "markertime") then{
	markertime = 10;
	publicvariable "markertime";
};

if(isNil "clearingmarker") then{
	clearingmarker = 0;
	publicvariable "clearingmarker";
};

if(isNil "idfGuns") then{
	idfGuns = [];
	publicvariable "idfGuns";
};
twc_fnc_idf = compile preprocessfilelinenumbers "insurgency_Core\server\sys_basedefence\IDF_Alarmfire.sqf";
