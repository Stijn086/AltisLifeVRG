#include <macro.h>
/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the civilian.
*/
private["_spawnPos"];
civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
waitUntil {!(isNull (findDisplay 46))};

if((str(player) in ["civ_70","civ_71","civ_72","civ_73","civ_74","civ_75"])) then {
	if(__GETC__(life_adminlevel) == 0) then {
		["NotAdmin",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};

//if( not ((str player) in ["civ_69","civ_68","civ_67","civ_66","civ_65"])) then {
//    if(__GETC__(life_whitelisted) == 0) then {
//        ["NotWhitelisted",false,true] call BIS_fnc_endMission;
//        sleep 35;
//    };
//};

if(life_is_arrested) then
{
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
}
	else
{
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};
player addRating 9999999;

[] call life_fnc_zoneCreator;

[] spawn
{
while {true} do
{
waitUntil {uniform player == "U_C_Scientist"};
player setObjectTextureGlobal [0,"textures\clothing\jumpsuit.jpg"];
waitUntil {uniform player != "U_C_Scientist"};
};
};

[] spawn
{
while {true} do
{
waitUntil {uniform player == "U_C_WorkerCoveralls"};
player setObjectTextureGlobal [0,"textures\clothing\prisonsuit.jpg"];
waitUntil {uniform player != "U_C_WorkerCoveralls"};
};
};
if(isNil "life_drink") then {life_drink = 0;};
