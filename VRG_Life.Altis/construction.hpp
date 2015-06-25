class constructionDialog
{
	idd = -1;
	movingEnable = true;
	moving = 1;
	onLoad = "with uiNameSpace do { constructionDialog = _this select 0 }";
	controls[] = {textBar,RscListbox_1500,RscText_1001,buyButton,destroyButton,nearList,Movebutton,nearstuff,snap};
	controlsBackground[] = {IGUIBack_2200};
		
	class textBar: RscText
	{
		idc = 1000;
		text = "Construction"; //--- ToDo: Localize;
		x = 0.293721 * safezoneW + safezoneX;
		y = 0.225022 * safezoneH + safezoneY;
		w = 0.412558 * safezoneW;
		h = 0.0219982 * safezoneH;
		colorBackground[] = {0.275,0.51,0.706,1};
		sizeEx = 0.8 * GUI_GRID_H;
	};
	class RscListbox_1500: RscListbox
	{
		idc = 1500;
		onLBSelChanged = "call construction_ButtonText";
		x = 0.304035 * safezoneW + safezoneX;
		y = 0.291017 * safezoneH + safezoneY;
		w = 0.39193 * safezoneW;
		h = 0.24198 * safezoneH;
	};
	class RscText_1001: RscText
	{
		idc = 1001;
		text = "Structures"; //--- ToDo: Localize;
		x = 0.304035 * safezoneW + safezoneX;
		y = 0.269019 * safezoneH + safezoneY;
		w = 0.39193 * safezoneW;
		h = 0.0219982 * safezoneH;
		colorBackground[] = {0.275,0.51,0.706,1};
		sizeEx = 0.8 * GUI_GRID_H;
	};
	class buyButton: RscButton
	{
		idc = 1600;
		action = "call construction_Purchase";
		text = "Purchase ($)"; //--- ToDo: Localize;
		x = 0.304035 * safezoneW + safezoneX;
		y = 0.554995 * safezoneH + safezoneY;
		w = 0.39193 * safezoneW;
		h = 0.0329973 * safezoneH;
		colorBackground[] = {0.275,0.51,0.706,1};
	};
	class IGUIBack_2200: IGUIBack
	{
		idc = 2200;
		x = 0.293721 * safezoneW + safezoneX;
		y = 0.247062 * safezoneH + safezoneY;
		w = 0.412558 * safezoneW;
		h = 0.681834 * safezoneH;
		colorBackground[] = {0,0,0,0.8};
	};
	class destroyButton: RscButton
	{
		idc = 1610;
		action = "call construction_Remove";

		text = "Remove Structure"; //--- ToDo: Localize;
		x = 0.304035 * safezoneW + safezoneX;
		y = 0.862911 * safezoneH + safezoneY;
		w = 0.39193 * safezoneW;
		h = 0.0329972 * safezoneH;
		colorBackground[] = {0.275,0.51,0.706,1};
	};
	class nearList: RscListBox
	{
		idc = 1506;
		onLBSelChanged = "call construction_ButtonText";

		x = 0.304035 * safezoneW + safezoneX;
		y = 0.675957 * safezoneH + safezoneY;
		w = 0.39193 * safezoneW;
		h = 0.109973 * safezoneH;
	};
	class Movebutton: RscButton
	{
		idc = 1609;
		action = "call construction_Move";

		text = "Move Structure"; //--- ToDo: Localize;
		x = 0.304035 * safezoneW + safezoneX;
		y = 0.807925 * safezoneH + safezoneY;
		w = 0.39193 * safezoneW;
		h = 0.0329972 * safezoneH;
		colorBackground[] = {0.275,0.51,0.706,1};
	};
	class nearstuff: RscText
	{
		idc = 1001;

		text = "My Structures"; //--- ToDo: Localize;
		x = 0.304035 * safezoneW + safezoneX;
		y = 0.653962 * safezoneH + safezoneY;
		w = 0.39193 * safezoneW;
		h = 0.0219946 * safezoneH;
		colorBackground[] = {0.275,0.51,0.706,1};
		sizeEx = 0.8 * GUI_GRID_H;
	};
	class snap: RscButton
	{
		idc = 1030;
		action = "call construction_Snap";

		text = "Snap To Terrain (FALSE)"; //--- ToDo: Localize;
		x = 0.304035 * safezoneW + safezoneX;
		y = 0.609973 * safezoneH + safezoneY;
		w = 0.39193 * safezoneW;
		h = 0.0329972 * safezoneH;
		colorBackground[] = {0.275,0.51,0.706,1};
	};
};

