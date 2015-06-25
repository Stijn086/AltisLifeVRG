/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
removeAllContainers player;
removeAllWeapons player;
removeGoggles player;
removeHeadGear player;
player addUniform "U_Rangemaster";

player addbackpack "B_Carryall_oli";
player addHeadgear "H_CrewHelmetHeli_B";
player addItem "medikit";
player addGoggles "NVGoggles";
player assignItem "ItemGPS";


if(hmd player != "") then {
	player unlinkItem (hmd player);
};

[[player,0,"textures\clothing\medic_uniform.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
