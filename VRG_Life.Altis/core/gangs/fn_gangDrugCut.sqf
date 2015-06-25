#include <macro.h>
/*
	Author: 
	mullsm0ke
	
	Description:
	If the gang hideout is owned, pay 20% of all drug sales from that area into gang bank.
	Will integrate clothing shops, general stores and car lots in later. Everything is in place
	just need to add more case options for the _location SWITCH on captureHideout.sqf
*/

private["_value","_gang"];
_value = _this select 0;
_gang = _this select 1;

//Series of stupid checks
if(_value < 0) exitWith {};
if(_gang == grpPlayer) exitWith{};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};

_gFund = _gang getVariable ["gang_bank",0];
_gFund = _gFund + _value;
_gang setVariable ["gang_bank",_gFund,true];

[[0,_gang],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
