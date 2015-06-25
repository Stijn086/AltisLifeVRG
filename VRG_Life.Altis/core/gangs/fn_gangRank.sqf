#include <macro.h>
/*
	Author: Anthony "Zanven" Poschen  
	
	Description:
	handles promotions and demotions within gangs.
    0 = demote.
    1 = promote.
*/
private["_unit"];
disableSerialization;

_unit = lbData[2621,lbCurSel (2621)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {hint localize "STR_GNOTF_SelectPerson"};
if(isNull _unit) exitWith {hint localize "STR_GNOTF_SelectPerson"}; //Bad unit?
if(_unit == player) exitWith {hint "you cant change your own rank. who do u think you are!"};

_grpMembers = (group player) getVariable "gang_members";
_grpLeaders = (group player) getVariable "gang_leaders";
_owner = (group player) getVariable "gang_owner";
_uid = getPlayerUID player;

// changing ranks on a different gang that ur in group with is not allowed
if(((group player) getVariable "gang_id") != life_gangid) exitWith {hint "you have no power here nigger."}; //how the fuck did u get this menu :(

// cant kick the owner hurdur
if((getPlayerUID _unit) == _owner) exitWith {hint "Nigger did u seriously just try that. your lucky i dont rek you."};

//if not a leader or owner wtf are we doing here
if(_owner != _uid && !(_uid in _grpLeaders)) exitWith{ hint "fuck you. you power hungry cunt. god says no"};

switch((_this select 0)) do {
    // demote
    case 0: {
        // if leader just demote. idk why u wouldnt just kick some cunt if ur gonna demote him he musta fucked up hard.
        if(_owner == _uid && ((getPlayerUID _unit) in _grpLeaders )) then {
            [[2,(group player),getPlayerUID _unit],"TON_fnc_updateGang",false,false] spawn life_fnc_MP; 
            _grpLeaders = _grpLeaders - [(getPlayerUID _unit)];
            (group player) setVariable["gang_leaders",_grpLeaders,true];
            
        } else {
            // boot the cunt
            // if you are the owner or Are a leader and the target is not a leader or the owner
            if(_owner == _uid || (((getPlayerUID player) in _grpLeaders ) && (!((getPlayerUID _unit) in _grpLeaders ) && (getPlayerUID _unit) != _owner) )) then {
                [[4,(group player),getPlayerUID _unit],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
                _grpMembers = _grpMembers - [(getPlayerUID _unit)];
                (group player) setVariable["gang_members",_grpMembers,true];
            };
        };

    };
    // promote
    case 1: {
        if(((group _unit) getVariable "gang_id") != life_gangid) exitWith {hint "This player is already in a gang"}; //Added
        // if not in gang add to gang.
        if(!((getPlayerUID _unit) in _grpMembers)) then { 
            [[profileName,(group player),1],"life_fnc_gangInvite",_unit,false] spawn life_fnc_MP;
            hint "invited to gang";
        } else { 
        // he is in the gang so lets see if we can make that cunt a leader boo yah.
            if(_owner == _uid) then {
                [[1,(group player),getPlayerUID _unit],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
                _grpLeaders set[count _grpLeaders,(getPlayerUID _unit)];
                (group player) setVariable["gang_leaders",_grpLeaders,true];
            };
        };
    };
    case default {hint "how the fuck...."};
};

[] call life_fnc_gangMenu;