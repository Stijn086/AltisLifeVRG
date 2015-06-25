#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine , Anthony "Zanven" Poschen
	Description:
	31 hours of no sleep screw your description.
*/
private["_ownerID","_gangBank","_gangName","_gangid","_members","_leaders","_allUnits","_ctrl"];
disableSerialization;
if(isNull (findDisplay 2620)) then {
	if(!(createDialog "Life_My_Gang_Diag")) exitWith {}; //NOOOOOOOOOOOOOOOOOOOOOOOoooooooooooooOOOOOOOOOOOOOOOOOOOOOOOOOOO00000000000000oooooo
};

_ownerID = grpPlayer getVariable["gang_owner",""];
if(_ownerID == "") exitWith {closeDialog 0;}; //Bad juju
_gangName = grpPlayer getVariable "gang_name";
_gangBank = grpPlayer getVariable "gang_bank";
_gangid = grpPlayer getVariable "gang_id";
_gangmembers = grpPlayer getVariable "gang_members";
_gangleaders = grpPlayer getVariable "gang_leaders";
_isLeader = (steamid in _gangleaders);


// first match is only done. so order in priority.
switch true do {
    
    case (steamid == _ownerID): {};//we are the owner have it all.
    
    case (steamid in _gangleaders): { // cant disband or set leader
        (getControl(2620,2631)) ctrlEnable false; // Disband Gang 
        (getControl(2620,2625)) ctrlEnable false; // Set New Owner
    }; 
    case (steamid in _gangmembers): { // just a member cant do promotions.
        (getControl(2620,2631)) ctrlEnable false; // Disband Gang 
        (getControl(2620,2625)) ctrlEnable false; // Set New Owner  
        (getControl(2620,2622)) ctrlEnable false; // Promote
        (getControl(2620,2633)) ctrlEnable false; // Demote
    };
    case default { // just tagging along in group have no menus.
        (getControl(2620,2622)) ctrlEnable false; // Promote
        (getControl(2620,2633)) ctrlEnable false; // Demote
        (getControl(2620,2624)) ctrlEnable false; // Kick
        (getControl(2620,2625)) ctrlEnable false; // Set New Owner
        (getControl(2620,2630)) ctrlEnable false; // Invite Player
        (getControl(2620,2631)) ctrlEnable false; // Disband Gang        
    };
};


(getControl(2620,2629)) ctrlSetText _gangName;
(getControl(2620,601)) ctrlSetText format[(localize "STR_GNOTF_Funds")+ " $%1",[_gangBank] call life_fnc_numberText];

//Loop through the players.
_members = getControl(2620,2621);
lbClear _members;
{
    _uid = (getPlayerUID _x);
    _rank = 0;
    // bohemia is gay and no easy way to do a switch with a case which involves code block.
    if(_uid in _gangmembers)    then {_rank = 1;};
    if(_uid in _gangleaders)    then {_rank = 2;};
    if(_uid == _ownerID)        then {_rank = 3;};
    
    switch(_rank) do {
      case 3 :{ _members lbAdd format["%1 (Gang Owner)" ,(_x getVariable["realname",name _x])];};
      case 2 :{ _members lbAdd format["%1 (Gang Leader)",(_x getVariable["realname",name _x])];};
      case 1 :{ _members lbAdd format["%1 (Gang Member)",(_x getVariable["realname",name _x])];};
      case 0 :{ _members lbAdd format["%1 (Group Only)" ,(_x getVariable["realname",name _x])];};
    };
    _members lbSetData [(lbSize _members)-1,str(_x)];  
    
} foreach (units grpPlayer);

_grpMembers = units grpPlayer;
_allUnits = playableUnits;
//Clear out the list..
{
	if(_x in _grpMembers OR side _x != civilian && isNil {(group _x) getVariable "gang_id"}) then {
		_allUnits set[_forEachIndex,-1];
	};
} foreach _allUnits;
_allUnits = _allUnits - [-1];

_ctrl = getControl(2620,2632);
lbClear _ctrl; //Purge the list
{
	_ctrl lbAdd format["%1",_x getVariable["realname",name _x]];
	_ctrl lbSetData [(lbSize _ctrl)-1,str(_x)];
} foreach _allUnits;
