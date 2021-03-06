/*
	File: fn_safeInventory.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Fills up the safes inventory.
*/
private["_safe","_tInv","_pInv","_safeInfo","_str","_shrt"];
_safe = mb_vault;
if(isNull _safe) exitWith {closeDialog 0;};
disableSerialization;

_tInv = (findDisplay 8970) displayCtrl 8972;
lbClear _tInv;

_safeInfo = _safe getVariable["safe",-1];
if(_safeInfo < 1) exitWith {closeDialog 0; hint "The Militay Store is empty.";};

_str = ["life_inv_pow"] call life_fnc_varToStr;
_shrt = ["life_inv_pow",1] call life_fnc_varHandle;
_tInv lbAdd format["[%1] - %2",_safeInfo,_str];
_tInv lbSetData [(lbSize _tInv)-1,_shrt];
