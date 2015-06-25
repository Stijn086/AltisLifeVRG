#include <macro.h>
/*
	Author: ME
	
	Description:
	Geld vom Gangkonto abheben
*/
private["_value"];
_value = parseNumber(ctrlText 2702);
__SUB__(_gFund,_value);
_gFund = grpPlayer getVariable ["gang_bank",0];

if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_AIM_notnumeric"};
if(_value > _gFund) exitWith {hint "You do not have enough money in the Gang Bank Account!"};
if(_value < 100 && _gFund > 20000000) exitWith {hint "Sie koennen nicht weniger als $100 abheben"};


life_cash = life_cash + _value;
_gFund = _gFund - _value;
grpPlayer setVariable ["gang_bank",_gFund,true];

hint format["You have withdrawn $%1 From your Gang Bank Account",[_value] call life_fnc_numberText];
[[0,format["%1 has withdrawn $%2 from the gang bank.",profileName,_value]],"life_fnc_broadcast",grpPlayer,false] spawn life_fnc_MP;
[] call life_fnc_atmMenu;
[] call SOCK_fnc_updateRequest;
[[0,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;