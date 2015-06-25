#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours... // fuck ur desc tonic.
*/
private["_unit","_unitID","_members"];
disableSerialization;

if((lbCurSel 2621) == -1) exitWith {hint localize "STR_GNOTF_SelectKick"};
_unit = call compile format["%1",getSelData(2621)];
_owner = (group player) getVariable "gang_owner";
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint localize "STR_GNOTF_KickSelf"};

_members = grpPlayer getVariable "gang_members";
if(isNil "_members") exitWith {};
if(typeName _members != "ARRAY") exitWith {};

_leaders = (group player) getVariable "gang_leaders";
if(isNil "_leaders") exitWith {};
if(typeName _leaders != "ARRAY") exitWith {};

_unitID = getPlayerUID _unit;
_playerID = getPlayerUID player;
if(_unitID == _owner) exitWith {hint str "nigger why u try and kick the boss";}; // cant kick owner
if((_unitID in _leaders) && _playerID != _owner) exitWith {hint str "u can try but this giganigger is to high up for you.";}; // if he is a leader and we arent owner cant kick.
if((_unitID in _members) && !((_playerID in _leaders) || _playerID == _owner)) exitWith {hint str "dont make me laugh fool";}; // if target is a member and i am not a leader or the owner then cant boot. 
if(!(_playerID in _members) && !(_playerID in _leaders) && !(_playerID == _owner)) exitWith {hint str "nigger get ur shit together this isnt even ur gang";}; // if ur not a member or a leader or the owner u cant kick this rand. 

if(_unitID in _members) then {
    [[4,(group player),getPlayerUID _unit],"TON_fnc_updateGang",false,false] spawn life_fnc_MP; //Update the database. kicks from leader aswell.
};

if(_unitID in _members) then {
    _members = _members - [_unitID];
    (group player) setVariable["gang_members",_members,true];
};

if(_unitID in _leaders) then {
    _leaders = _leaders - [_unitID];
    (group player) setVariable["gang_leaders",_leaders,true];    
};

[[_unit,(group player),(group player) getVariable "gang_id"],"clientGangKick",_unit,false] spawn life_fnc_MP; //Boot that bitch!
[] call life_fnc_gangMenu;