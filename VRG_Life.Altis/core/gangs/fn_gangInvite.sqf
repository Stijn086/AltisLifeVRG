#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Prompts the player about an invite.
*/
private["_name","_group"];
_name = [_this,0,"",[""]] call BIS_fnc_param;
_group = [_this,1,grpNull,[grpNull]] call BIS_fnc_param;
_type = [_this,2,-1] call BIS_fnc_param;
if(_name == "" OR isNull _group) exitWith {}; //Fail horn anyone?
_groupid = (group player) getVariable "gang_id";
if(_type == 1) then {if(!isNil "_groupid") then { if(_groupid != life_gangid) exitWith {hint "You are already in a gang"};}; };
if(_type == -1) exitWith {};

_gangName = _group getVariable "gang_name";
_txt = if(_type == 1) then {format[localize "STR_GNOTF_InviteGangMSG",_name,_gangName]} else {format[localize "STR_GNOTF_InviteMSG",_name,_gangName]};
_action = [
	_txt,
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	[player] joinSilent _group;
    if(_type == 1 ) then { // if they are already ingroup lets make them a gang member.
        if(life_gangid == 0) then {
            life_gangid = (_group getVariable "gang_id");
            _members = (group player) getVariable "gang_members";
            _members set [count _members,(getPlayerUID player)];
            (group player) setVariable["gang_members",_members,true];
	       [[5,_group,getPlayerUID player],"TON_fnc_updateGang",false,false] spawn life_fnc_MP; 
        };
    };
};
