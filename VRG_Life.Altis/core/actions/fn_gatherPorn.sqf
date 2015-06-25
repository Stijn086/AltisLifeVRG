/*
File: fn_gatherPorn.sqf

Author: Unknown

Description:
Porn Gathering Function

*/
private["_sum"];
_sum = ["uporn",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
life_action_inUse = true;
titleText["Creating Snuff Tape ...","PLAIN"];
titleFadeOut 3;
sleep 3;
if(([true,"uporn",1] call life_fnc_handleInv)) then
{

titleText["You have created a tape.","PLAIN"];
};
};

life_action_inUse = false;