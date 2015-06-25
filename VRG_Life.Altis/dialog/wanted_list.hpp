class life_wanted_menu {
	idd = 2400;
	name= "life_wanted_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {1,0,0,1};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {

		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 199201;
			text = "$STR_Wanted_Title";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class WantedConnection : Title {
			idc = 2404;
			style = 1;
			text = "";
		};
		
		class WantedList : Life_RscListBox 
		{
			idc = 2401;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[] call life_fnc_wantedInfo";
			
			x = 0.12; y = 0.26;
			w = 0.2; h = 0.4;
		};
		
		class WantedDetails : Life_RscListBox
		{
			idc = 2402;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0};
			
			x = 0.34;
			y = 0.35;
			w = 0.36;
			h = 0.32;
		};
		
		class BountyPrice : Life_RscText
		{
			idc = 2403;
			text = "";
			x = 0.34;
			y = 0.03;
			w = 0.6;
			h = 0.6;
		};
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class PardonButtonKey : Life_RscButtonMenu {
			idc = 2405;
			text = "$STR_Wanted_Pardon";
			onButtonClick = "[] call life_fnc_pardon; closeDialog 0;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

class life_deployment_menu {
	idd = 199203;
	name= "life_deployment_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground: Life_RscText
{
	idc = -1;

	x = 0.335 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.232031 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {1,0,0,1};
};
class MainBackground: Life_RscText
{
	idc = -1;

	x = 0.335 * safezoneW + safezoneX;
	y = 0.3592 * safezoneH + safezoneY;
	w = 0.232031 * safezoneW;
	h = 0.099 * safezoneH;
	colorBackground[] = {0,0,0,0.7};
};
	};
	
	class controls {

		
		class TitleDeployment: Life_RscTitle
{
	idc = -1;

	text = "Special Unit Deployment"; //--- ToDo: Localize;
	x = 0.335 * safezoneW + safezoneX;
	y = 0.3372 * safezoneH + safezoneY;
	w = 0.232031 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {0.95,0.95,0.95,1};
};
class SwatInstructions: Life_RscText
{
	idc = -1;

	text = "Enter the location of where the "; //--- ToDo: Localize;
	x = 0.412344 * safezoneW + safezoneX;
	y = 0.3438 * safezoneH + safezoneY;
	w = 0.159844 * safezoneW;
	h = 0.088 * safezoneH;
};
class LocationST: Life_RscEdit
{
	idc = 199209;

	text = "Location"; //--- ToDo: Localize;
	x = 0.4175 * safezoneW + safezoneX;
	y = 0.4252 * safezoneH + safezoneY;
	w = 0.134062 * safezoneW;
	h = 0.022 * safezoneH;
};
class CallSwatButton: Life_RscButtonMenu
{
	onButtonClick = "[] call fnc_deployment_swat";

	idc = 1006;
	text = "SWAT"; //--- ToDo: Localize;
	x = 0.34325 * safezoneW + safezoneX;
	y = 0.368 * safezoneH + safezoneY;
	w = 0.0644531 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.8};
};
class CallRiotButton: Life_RscButtonMenu
{
	onButtonClick = "[] call fnc_deployment_riot";

	idc = 1007;
	text = "Riot Squad"; //--- ToDo: Localize;
	x = 0.34325 * safezoneW + safezoneX;
	y = 0.3955 * safezoneH + safezoneY;
	w = 0.0644531 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.8};
};
class CallMLButton: Life_RscButtonMenu
{
	onButtonClick = "if(!martial_law_active) then { martial_law_active = true; [] execVM ""core\functions\fn_martialSiren.sqf"";}; [] call fnc_deployment_ml;";

	idc = 1008;
	text = "Martial Law"; //--- ToDo: Localize;
	x = 0.34325 * safezoneW + safezoneX;
	y = 0.423 * safezoneH + safezoneY;
	w = 0.0644531 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.8};
};
class CloseButtonKey: Life_RscButtonMenu
{
	onButtonClick = "closeDialog 0;";

	idc = 1009;
	text = "Close"; //--- ToDo: Localize;
	x = 0.335 * safezoneW + safezoneX;
	y = 0.4604 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.8};
};
class RecallDeployment: Life_RscButtonMenu
{
	onButtonClick = "martial_law_active = false; sleep 0.1; [] call fnc_deployment_recall";

	idc = 1010;
	text = "Recall"; //--- ToDo: Localize;
	x = 0.372125 * safezoneW + safezoneX;
	y = 0.4604 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.8};
};
class RscText_1004: RscText
{
	idc = -1;

	text = "special unit will be deployed:"; //--- ToDo: Localize;
	x = 0.412344 * safezoneW + safezoneX;
	y = 0.3966 * safezoneH + safezoneY;
	w = 0.159844 * safezoneW;
	h = 0.022 * safezoneH;
};
		
		
	};
};