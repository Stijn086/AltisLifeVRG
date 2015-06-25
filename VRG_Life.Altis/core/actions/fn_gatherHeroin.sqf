/*
	File: fn_gatherHeroin.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gathers heroin?
*/
private["_sum"];
_sum = ["poppies",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_inUse = true;
	titleText[format[localize "STR_NOTF_Gathering",localize "STR_Item_Poppies"],"PLAIN"];
	titleFadeOut 5;
	sleep 5;
	if(([true,"poppies",1] call life_fnc_handleInv)) then
	{
		titleText[format[localize "STR_NOTF_Collected",localize "STR_Item_Poppies"],"PLAIN"];
	};
};

life_action_inUse = false;