class Life_My_Gang_Diag {
	idd = 2620;
	name= "life_my_gang_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";

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
			idc = 2629;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class GangMemberList : Life_RscListBox
		{
			idc = 2621;
			text = "";
			sizeEx = 0.035;

			x = 0.11; y = 0.26;
			w = 0.350; h = 0.370;
		};

		class CloseLoadMenu : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class GangKick : Life_RscButtonMenu
		{
			idc = 2624;
			text = "$STR_Gang_Kick";
			colorBackground[] = {1,0,0,1};
			onButtonClick = "[] call life_fnc_gangKick";
			x = 0.47;
			y = 0.26;
			w = (9 / 40);
			h = (1 / 25);
		};
        
		class GangPromote : Life_RscButtonMenu
		{
			idc = 2622;
			text = "$STR_Gang_Promote";
			colorBackground[] = {1,0,0,1};
			onButtonClick = "[1] spawn life_fnc_gangRank";
			x = 0.47;
            y = 0.31;
            w = (9 / 40);
			h = (1 / 25);
		};

		class GangDemote : Life_RscButtonMenu
		{
			idc = 2633;
			text = "Demote"; // stringtable is a cunt and doesnt like this one no matter what. so fuck it.
			colorBackground[] = {1,0,0,1};
			onButtonClick = "[0] spawn life_fnc_gangRank";
			x = 0.47;
            y = 0.36;
            w = (9 / 40);
			h = (1 / 25);
		};
        
		class InvitePlayer : Life_RscButtonMenu
		{
			idc = 2630;
			text = "$STR_Gang_Invite_Player";
			colorBackground[] = {1,0,0,1};
			onButtonClick = "[0] spawn life_fnc_gangInvitePlayer";
            x = 0.47;
            y = 0.41;
            w = (9 / 40);
			h = (1 / 25);
		};
		class ColorList : Life_RscCombo
		{
			idc = 2632;
			x = 0.47; y = 0.46;
			w = (9 / 40); h = 0.03;
		};
        
		class GangLeave : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Gang_Leave";
			colorBackground[] = {1,0,0,1};
			onButtonClick = "[] call life_fnc_gangLeave";
			x = 0.11;
			y = 0.65;
			w = (6.25 / 40);
			h = (1 / 25);
		};
        
		class GangOwner : Life_RscButtonMenu
		{
			idc = 2625;
			text = "$STR_Gang_SetOwner";
			colorBackground[] = {1,0,0,1};
			onButtonClick = "[] spawn life_fnc_gangNewOwner";
			x = 0.11;
			y = 0.70;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class DisbandGang : GangOwner
		{
			idc = 2631;
			text = "$STR_Gang_Disband_Gang";
			colorBackground[] = {1,0,0,1};
			onButtonClick = "[] spawn life_fnc_gangDisband";
			x = (0.11 + (6.25/40) + 0.01);
		};

		class GangBank : Title {
			idc = 601;
			style = 1;
			text = "";
		};
	};
};

class Life_Create_Gang_Diag {
	idd = 2520;
	name= "life_my_gang_menu_create";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {waitUntil {!isNull (findDisplay 2520)}; ((findDisplay 2520) displayCtrl 2523) ctrlSetText format[localize ""STR_Gang_PriceTxt"",[(call life_gangPrice)] call life_fnc_numberText]};";

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {1,0,0,1};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.3 - (22 / 250);
		};
	};

	class controls {

		class InfoMsg : Life_RscStructuredText
		{
			idc = 2523;
			sizeEx = 0.020;
			text = "";
			x = 0.1;
			y = 0.25;
			w = 0.5; h = 0.11;
		};

		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Gang_Title";
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class CloseLoadMenu : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.5 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class GangCreateField : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Gang_Create";
			colorBackground[] = {1,0,0,1};
			onButtonClick = "[] call life_fnc_createGang";
			x = 0.27;
			y = 0.40;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class CreateGangText : Life_RscEdit
		{
			idc = 2522;
			text = "$STR_Gang_YGN";

			x = 0.04 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.35;
			w = (13 / 40);
			h = (1 / 25);
		};
	};
};
