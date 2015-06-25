#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the invite process?
*/
private["_unit","_type"];
disableSerialization;

if((lbCurSel 2632) == -1) exitWith {hint localize "STR_GNOTF_SelectPerson"};
_unit = call compile format["%1",getSelData(2632)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint localize "STR_GNOTF_InviteSelf"};
// dont let cunts invite people to groups they joined and arent atleast a member
if(((group player) getVariable "gang_id") != life_gangid) exitWith {hint "you cant invite people to be a group member in a group ur not a member of."}; 

_action = [
	format[localize "STR_GNOTF_InvitePlayerMSG",_unit getVariable ["realname",name _unit]],
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	[[profileName,grpPlayer,0],"life_fnc_gangInvite",_unit,false] spawn life_fnc_MP;
	hint format[localize "STR_GNOTF_InviteSent",_unit getVariable["realname",name _unit]];
} else {
	hint localize "STR_GNOTF_InviteCancel";
};
