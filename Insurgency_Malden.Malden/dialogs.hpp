class twc_sandBag_Dialog
{
	idd = 9999;
	movingEnabled = false;
	
	class controls
	{
		////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by jayman, v1.063, #Wewybo)
////////////////////////////////////////////////////////

class twc_rsc_picture_background: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(0,0,1,0.5)";
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.269 * safezoneH + safezoneY;
	w = 0.366094 * safezoneW;
	h = 0.462 * safezoneH;
};
class twc_rsc_button_spawn: RscButton
{
	idc = 1600;
	text = "Spawn"; //--- ToDo: Localize;
	x = 0.613437 * safezoneW + safezoneX;
	y = 0.654 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.055 * safezoneH;
};
class twc_rsc_button_close: RscButton
{
	idc = 1601;
	action = "closeDialog 0";
	text = "Close"; //--- ToDo: Localize;
	x = 0.324687 * safezoneW + safezoneX;
	y = 0.654 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.055 * safezoneH;
};
class twc_rsc_listBox: RscListbox
{
	idc = 1500;
	x = 0.324687 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.165 * safezoneW;
	h = 0.22 * safezoneH;
};
class twc_rsc_picture_item: RscPicture
{
	idc = 1201;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.515469 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.159844 * safezoneW;
	h = 0.22 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

	};
};