#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours later...
*/
private["_grp","_grpMembers"];
if(steamid == (grpPlayer getVariable "gang_owner")) exitWith {hint localize "STR_GNOTF_LeaderLeave"};

_grp = grpPlayer;
_grpMembers = grpPlayer getVariable "gang_members";
_grpMembers = _grpMembers - [steamid];
_grp setVariable["gang_members",_grpMembers,true];
[player] joinSilent (createGroup civilian);

if(life_gangid == (_grp getVariable "gang_id")) then {
    [[4,_grp],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
    life_gangid = 0;
} else {
if(((life_gangData select 0) select 0) != 0) then {[] spawn life_fnc_initGang;};
};
[] call life_fnc_gangMenu;
closeDialog 0;

