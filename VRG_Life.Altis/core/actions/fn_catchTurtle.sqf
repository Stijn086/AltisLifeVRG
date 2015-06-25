/*
	File: fn_catchTurtle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Catches a dead turtle?
*/

private["_obj","_turtleZones"];
_obj = cursorTarget;
_turtleZones = ["turtle_1","turtle_2","turtle_3"];

if(isNull _obj) exitWith {}; //Not valid
if(alive _obj) exitWith {}; //It's alive, don't take it charlie!


{
    _pos = getMarkerPos _x;
    _distance = player distance _pos;
    if(_distance <= 350) then {
        if(([true,"turtle",1] call life_fnc_handleInv)) then
        {
	       deleteVehicle _obj;
	       titleText[localize "STR_NOTF_CaughtTurtle","PLAIN"];
        };  
    };
} forEach _turtleZones;
life_action_inUse = false;
