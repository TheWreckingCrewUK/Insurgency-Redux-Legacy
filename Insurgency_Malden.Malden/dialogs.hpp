class twc_sandBag_Dialog
{
	idd = 9999;
	movingEnabled = false;
	
	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by jayman, v1.063, #Xojihu)
////////////////////////////////////////////////////////

class twc_rsc_picture_background: RscPicture
{
	idc = 1200;

	text = "#(argb,8,8,3)color(0,0,1,0.5)";
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.269 * safezoneH + safezoneY;
	w = 0.37125 * safezoneW;
	h = 0.462 * safezoneH;
};
class twc_rsc_button_spawn: RscButton
{
	idc = 1600;
	action = "closeDialog 0; player setVariable [""twc_spawnFromBox"", true];";

	text = "SPAWN"; //--- ToDo: Localize;
	x = 0.597969 * safezoneW + safezoneX;
	y = 0.665 * safezoneH + safezoneY;
	w = 0.0567187 * safezoneW;
	h = 0.044 * safezoneH;
};
class twc_rsc_button_close: RscButton
{
	idc = 1601;
	action = "closeDialog 0";

	text = "CANCEL"; //--- ToDo: Localize;
	x = 0.520625 * safezoneW + safezoneX;
	y = 0.665 * safezoneH + safezoneY;
	w = 0.0567187 * safezoneW;
	h = 0.044 * safezoneH;
};
class twc_rsc_listBox: RscListBox
{
	idc = 1500;

	x = 0.324687 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.165 * safezoneW;
	h = 0.418 * safezoneH;
};
class twc_rsc_picture_item: RscPicture
{
	idc = 1201;

	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.510312 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.154687 * safezoneW;
	h = 0.286 * safezoneH;
};
class twc_rsc_text_cost: RscText
{
	idc = 1001;
	
	text="COST";
	align = "center";
	x = 0.510312 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.154687 * safezoneW;
	h = 0.044 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

	};
};