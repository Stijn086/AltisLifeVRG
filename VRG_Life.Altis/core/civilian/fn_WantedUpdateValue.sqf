/*
  File: fn_WantedUpdateValue.sqf
  Author: Anthony "Zanven" Poschen

  Description:
  gets the new value of the wanted list and updates the life_wanted to update the UI. (called from server only)
*/
private["_wanted"];

_wanted = [_this,0,-1,[0]] call BIS_fnc_param;

if(_wanted == -1) exitWith {}; // not a valid value so dont change it.
life_wanted = _wanted;
