/*
File: fn_gatherFrogs.sqf

Author: Unknown

Description:
Grape Picking Function

*/
private["_sum"];
_sum = ["ergot",2,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
life_action_inUse = true;
titleText["Gathering Ergot...","PLAIN"];
titleFadeOut 4;
sleep 4;
if(([true,"ergot",_sum] call life_fnc_handleInv)) then
{

titleText["You have gathered some Ergot.","PLAIN"];
};
};

life_action_inUse = false;