class Military_Vault
{
	idd = 8970;
	name = "Military_Vault";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class RscTitleBackground : Life_RscText
		{
			colorBackground[] = {1,0,0,1};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.33;
			h = (1 / 25);
		};
		
		class RscBackground : Life_RscText
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.33;
			h = 0.7 - (22 / 250);
		};
		
		class RscTitleText : Life_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 8971;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.33;
			h = (1 / 25);
		};
		
		class VehicleWeight : RscTitleText
		{
			idc = 8974;
			style = 1;
			text = "";
		};
		
		class RscTrunkText : Life_RscText
		{
			idc = -1;
			colorBackground[] = {1,0,0,1};
			text = "Military Store";
			sizeEx = 0.04;
			
			x = 0.11; y = 0.25;
			w = 0.3; h = 0.04;
		};
	};
	
	class Controls
	{
		class TrunkGear : Life_RscListBox
		{
			idc = 8972;
			text = "";
			sizeEx = 0.030;
			
			x = 0.11; y = 0.29;
			w = 0.3; h = 0.42;
		};
		
		class TrunkEdit : Life_RscEdit
		{
			idc = 8975;
			text = "1";
			sizeEx = 0.030;
			x = 0.11; y = 0.72;
			w = 0.3; h = 0.03;
		};
		
		class TakeItem : Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Trunk_Take";
			colorBackground[] = {1,0,0,1};
			onButtonClick = "[] call life_fnc_safeTake3;";
			x = 0.19; y = 0.78;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.9 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};