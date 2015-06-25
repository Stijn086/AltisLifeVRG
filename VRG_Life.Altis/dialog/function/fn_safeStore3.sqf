#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_safeStore.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gateway copy of fn_vehStoreItem but designed for the safe.
*/
private["_ctrl","_num"];
disableSerialization;

_ctrl = ctrlSelData(8973);
_num = ctrlText 8976;

if(!([_num] call fnc_isnumber)) exitWith {hint "STR_MISC_WrongNumFormat";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "STR_Cop_VaultUnder1";};
if(_ctrl != "pow") exitWith {hint "STR_Cop_Onlydirty"};
if(_num > life_inv_pow) exitWith {hint "STR_Cop_NotEnoughdirty";};

//Store it.
if(!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint "STR_Cop_CantRemove";};
_safeInfo = life_safeObj getVariable["safe",0];
life_safeObj setVariable["safe",_safeInfo + _num,true];

[life_safeObj] call life_fnc_safeInventory3;