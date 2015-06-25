/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Main initialization for gangs?
*/
private["_exitLoop","_group","_wait"];
if(playerSide != civilian) exitWith {}; //What in the hell?
if(count life_gangData == 0) exitWith {}; //Dafuq?

_wait = round(random(8));
sleep _wait;

_ganginfo = life_gangData select 0;
life_gangid = (_ganginfo select 0);
//Loop through to make sure there is not a group already created with the gang.
_exitLoop = false;
{
	_groupName = _x getVariable "gang_name";
	if(!isNil "_groupName") then {
		_groupOwner = _x getVariable["gang_owner",""];
		_groupID = _x getVariable "gang_id";
		if(_groupOwner == "" OR isNil "_groupID") exitWith {}; //Seriously?
		if(life_gangid == _groupID && ((_ganginfo select 1) == _groupOwner)) exitWith {_group = _x; _exitLoop = true;};
	};
} foreach allGroups;

if(!isNil "_group") then {
	[player] joinSilent _group;
	if((_ganginfo select 1) == (getPlayerUID player)) then {
		_group selectLeader player;
		[[player,_group],"clientGangLeader",(units _group),false] spawn life_fnc_MP;
	};
} else {
	_group = group player;
	_group setVariable["gang_id",(_ganginfo select 0),true];
	_group setVariable["gang_owner",(_ganginfo select 1),true];
	_group setVariable["gang_name",(_ganginfo select 2),true];
	//_group setVariable["gang_maxMembers",(life_gangData select 3),true];
	_group setVariable["gang_bank",(_ganginfo select 3),true];
	_group setVariable["gang_members",(life_gangData select 1),true];
    _group setVariable["gang_leaders",(life_gangData select 2),true];
};
