/*
	File: fn_gatherCocaine.sqf
	
	Description:
	Gathers cocaine?
*/
private["_sum"];
_sum = ["coke",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_inUse = true;
	titleText[format[localize "STR_NOTF_Gathering",localize "STR_Item_Cocaine"],"PLAIN"];
	titleFadeOut 5;
	sleep 5;
	if(([true,"coke",1] call life_fnc_handleInv)) then
	{
		titleText[format[localize "STR_NOTF_Collected",localize "STR_Item_Cocaine"],"PLAIN"];
	};
};

life_action_inUse = false;
