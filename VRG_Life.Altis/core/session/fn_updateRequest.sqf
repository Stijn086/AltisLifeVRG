/*
	File: fn_updateRequest.sqf
	Author: Tonic
*/
private["_packet","_array","_flag"];
_packet = [getPlayerUID player,(profileName),playerSide,life_cash,life_atmcash];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};
{
	if(_x select 1 == _flag) then
	{
		_array set[count _array,[_x select 0,(missionNamespace getVariable (_x select 0))]];
	};
} foreach life_licenses;
_packet set[count _packet,_array];

// grabs gear for anyone and saves it into the life_gear variable.
[] call life_fnc_saveGear;
//store gear for cops and civs into the packet below.

switch (playerSide) do {
	case west: {_packet set[count _packet, life_gear];};
	case civilian: {
		_packet set[count _packet, life_gear];
		_packet set[count _packet,life_is_arrested];
	};
};

[_packet,"DB_fnc_updateRequest",false,false] spawn life_fnc_MP;
