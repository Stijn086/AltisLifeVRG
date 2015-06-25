/*
	File: fn_pmcloadGear.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the pmc out with the default gear.
*/
removeAllContainers player;
removeAllWeapons player;
player addUniform "U_Rangemaster";
player addItem "ToolKit";
player addItem "ToolKit";
player addItem "ToolKit";
player addItem "ToolKit";
player addItem "ToolKit";
removeGoggles player;
removeHeadGear player;
if(hmd player != "") then {
	player unlinkItem (hmd player);
};

player setObjectTextureGlobal [0,"textures\pmc_uniform.paa"]; 