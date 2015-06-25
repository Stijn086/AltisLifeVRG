/*
File: fn_gatherGrapes.sqf

Author: Unknown

Description:
Grape Picking Function

*/
private["_sum"];
_sum = ["chemicals",3,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
life_action_inUse = true;
titleText["Receiving Delivery...","PLAIN"];
titleFadeOut 5;
sleep 5;
if(([true,"chemicals",_sum] call life_fnc_handleInv)) then
{

titleText["You have received a chemical shipment.","PLAIN"];
};
};

life_action_inUse = false;