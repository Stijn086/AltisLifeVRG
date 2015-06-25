/*
	File: fn_rapefail.sqf
	
	Description:
	Damages the player if the rape failed.
*/
private["_target"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _target) exitWith {};
if(_target != player) exitWith {};
_target setdamage ((damage player)+.05);
