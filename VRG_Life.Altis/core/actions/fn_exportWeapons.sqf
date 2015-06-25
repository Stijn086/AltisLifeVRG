#include <macro.h>

private["_index","_price","_val"];
if(life_inv_pow == 0) exitWith {
	titleText["You don't have any weapons to export.","PLAIN"];
};

_index = ["pow",__GETC__(sell_array)] call fnc_index;
_price = (__GETC__(sell_array) select _index) select 1;
_val = life_inv_pow;
_price = _price * _val;

if([false,"pow",life_inv_pow] call life_fnc_handleInv) then {
	titleText[format["You exported %1 weapons for $%2",_val,[_price] call life_fnc_numberText],"PLAIN"];
	life_cash = life_cash + _price;
};
