#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if((__GETC__(life_coplevel) == 0) && (__GETC__(life_adminlevel) == 0)) then {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	sleep 35;
};

player setVariable["rank",(__GETC__(life_coplevel)),true];
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

// Special Uniforms cops can buy in shops. Add new 'if' for every classname you want the skin to be overwritten. (warning, does NOT work with every class!)
[] spawn
{
while {true} do
{
waitUntil {uniform player == "U_B_CombatUniform_mcam_worn"};
player setObjectTextureGlobal [0,"textures\clothing\Cop1.jpg"];
waitUntil {uniform player != "U_B_CombatUniform_mcam_worn"};
};
};

[] spawn
{
while {true} do
{
waitUntil {uniform player == "U_Rangemaster"};
player setObjectTextureGlobal [0,"textures\clothing\Cop.jpg"];
waitUntil {uniform player != "U_Rangemaster"};
};
};
