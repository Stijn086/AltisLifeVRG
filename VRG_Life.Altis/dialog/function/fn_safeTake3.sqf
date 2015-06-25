#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_safeTake.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gateway to fn_vehTakeItem.sqf but for safe(s).
*/
private["_ctrl","_num","_safeInfo"];
disableSerialization;

if((lbCurSel 8972) == -1) exitWith {hint "You need to select an item.";};
_ctrl = ctrlSelData(8972);
_num = ctrlText 8975;
_safeInfo = life_safeObj getVariable["safe",0];
if(!([_num] call fnc_isnumber)) exitWith {hint "Wrong number format.";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "STR_Cop_VaultUnder1";};
if(_ctrl != "pow") exitWith {hint "STR_Cop_Onlydirty"};
if(_num > _safeInfo) exitWith {hint format[localize "STR_Civ_IsntEnoughdirty",_num];};

//Secondary checks
_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_num == 0) exitWith {hint "Inventory full."};
//Take it
if(!([true,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint "Couldn't take it for some reason.";};
life_safeObj setVariable["safe",_safeInfo - _num,TRUE];
[life_safeObj] call life_fnc_safeInventory3;